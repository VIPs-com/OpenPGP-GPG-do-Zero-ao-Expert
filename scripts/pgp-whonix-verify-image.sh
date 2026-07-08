#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-verify-image.sh — OpenPGP-GPG (host)
# Playbook 10 — só verificação PGP (sem import).
#
# Uso: ./pgp-whonix-verify-image.sh -i imagem.ova -s imagem.ova.asc \
#        -f FINGERPRINT_wiki_Verify_the_images [-k derivative.asc]
#
# Changelog jul/2026: VALIDSIG+FPR; retry derivative.asc; sem "Good signature"

set -euo pipefail
IMAGE="" SIG="" KEY_FILE="" EXPECTED_FPR=""
DERIVATIVE_URL="https://www.whonix.org/keys/derivative.asc"
WORKDIR="" GNUPGHOME_DIR=""

fail() { echo "ERRO: $*" >&2; exit 1; }
cleanup() {
    [[ -n "$GNUPGHOME_DIR" ]] && rm -rf "$GNUPGHOME_DIR"
    [[ -n "$WORKDIR" ]] && rm -rf "$WORKDIR"
}
trap cleanup EXIT

while [[ $# -gt 0 ]]; do
    case "$1" in
        -i) IMAGE="$2"; shift 2 ;; -s) SIG="$2"; shift 2 ;;
        -k) KEY_FILE="$2"; shift 2 ;; -f) EXPECTED_FPR="$2"; shift 2 ;;
        *) fail "Opção: $1" ;;
    esac
done

[[ -n "$IMAGE" && -n "$SIG" && -n "$EXPECTED_FPR" ]] || fail "Use -i -s -f."
[[ -f "$IMAGE" && -f "$SIG" ]] || fail "Arquivo não encontrado."
command -v gpg >/dev/null 2>&1 || fail "Instale gnupg."
command -v curl >/dev/null 2>&1 || fail "Instale curl."

WORKDIR="$(mktemp -d)"
GNUPGHOME_DIR="$(mktemp -d)"; chmod 700 "$GNUPGHOME_DIR"; export GNUPGHOME="$GNUPGHOME_DIR"

if [[ -z "$KEY_FILE" ]]; then
    KEY_FILE="${WORKDIR}/derivative.asc"
    _ok=0
    for _try in 1 2 3; do
        if curl -fsSL --max-time 120 "$DERIVATIVE_URL" -o "$KEY_FILE" && [[ -s "$KEY_FILE" ]]; then
            _ok=1; break
        fi
        echo "  Tentativa ${_try}/3 falhou — aguardando 5s..." >&2
        sleep 5
    done
    [[ "$_ok" = "1" ]] || fail "derivative.asc após 3 tentativas"
elif [[ ! -f "$KEY_FILE" ]]; then
    fail "Chave não encontrada: $KEY_FILE"
fi

gpg --quiet --import "$KEY_FILE"

exp="$(echo "$EXPECTED_FPR" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
ok=0
while read -r fpr; do
    act="$(echo "$fpr" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
    [[ "$act" == "$exp" ]] && ok=1 && break
done < <(gpg --with-colons --fingerprint 2>/dev/null | awk -F: '/^fpr:/ {print $10}')
[[ "$ok" -eq 1 ]] || fail "Fingerprint não confere."

gpg_log="$(mktemp)"
gpg --status-fd 1 --verify-options show-notations --verify "$SIG" "$IMAGE" \
    >"$gpg_log" 2>&1 || true
if grep -q "^\[GNUPG:\] VALIDSIG .*${exp}" "$gpg_log"; then
    cat "$gpg_log" >&2
    rm -f "$gpg_log"
    echo "OK — VALIDSIG + fingerprint. Próximo: pgp-whonix-import-ova.sh"
    exit 0
fi
if grep -qi "EXPKEYSIG" "$gpg_log"; then
    cat "$gpg_log" >&2
    rm -f "$gpg_log"
    fail "EXPKEYSIG — chave expirada."
fi
cat "$gpg_log" >&2
rm -f "$gpg_log"
fail "Assinatura inválida."
