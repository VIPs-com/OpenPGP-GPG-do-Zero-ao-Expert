#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-verify-image.sh — OpenPGP-GPG (host)
# Playbook 10 — só verificação PGP (sem import).
#
# Uso: ./pgp-whonix-verify-image.sh -i imagem.ova -s imagem.ova.asc \
#        -f FINGERPRINT_wiki_Verify_the_images [-k derivative.asc]

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
command -v gpg curl >/dev/null 2>&1 || fail "Instale gnupg curl."

WORKDIR="$(mktemp -d)"
GNUPGHOME_DIR="$(mktemp -d)"; chmod 700 "$GNUPGHOME_DIR"; export GNUPGHOME="$GNUPGHOME_DIR"
[[ -n "$KEY_FILE" ]] || KEY_FILE="${WORKDIR}/derivative.asc"
[[ -f "$KEY_FILE" ]] || curl -fsSL "$DERIVATIVE_URL" -o "$KEY_FILE" || fail "derivative.asc"
gpg --quiet --import "$KEY_FILE"

exp="$(echo "$EXPECTED_FPR" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
ok=0
while read -r fpr; do
    act="$(echo "$fpr" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
    [[ "$act" == "$exp" ]] && ok=1 && break
done < <(gpg --with-colons --fingerprint 2>/dev/null | awk -F: '/^fpr:/ {print $10}')
[[ "$ok" -eq 1 ]] || fail "Fingerprint não confere."

gpg --verify "$SIG" "$IMAGE" 2>&1 | grep -qi "Good signature" || fail "Assinatura inválida."
echo "OK — Good signature. Próximo: pgp-whonix-import-ova.sh"
