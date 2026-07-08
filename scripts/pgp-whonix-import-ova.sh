#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-import-ova.sh — OpenPGP-GPG do Zero ao Expert
#
# Playbook: playbooks/10-whonix-capstone.md (Passos 2–4)
# Verify derivative.asc + fingerprint (-f da wiki) + VBoxManage import.
#
# Uso:
#   sudo ./pgp-whonix-import-ova.sh \
#        -i /caminho/Whonix-*.ova -s /caminho/Whonix-*.ova.asc \
#        -f "FINGERPRINT_wiki" [-k derivative.asc] [-b] [-y]
#
# Changelog jul/2026 (port Privacy-OS-Hub v1.0.9.1):
#   - log() → stderr; VALIDSIG+FPR (locale PT-BR); EXPKEYSIG; fetch retry

set -euo pipefail

OVA_FILE="" SIG_FILE="" KEY_FILE="" EXPECTED_FPR=""
BOOT_VMS=0 ASSUME_YES=0
LOG_FILE="/var/log/whonix-install.log"
GNUPGHOME_DIR=""
DERIVATIVE_URL="https://www.whonix.org/keys/derivative.asc"
DOWNLOADED_KEY=0

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE" >&2; }
fail() { log "ERRO: $*"; cleanup; exit 1; }
cleanup() {
    [[ -n "$GNUPGHOME_DIR" && -d "$GNUPGHOME_DIR" ]] && rm -rf "$GNUPGHOME_DIR"
    [[ "$DOWNLOADED_KEY" -eq 1 && -n "$KEY_FILE" && -f "$KEY_FILE" ]] && rm -f "$KEY_FILE"
}
trap cleanup EXIT

fetch_url() {
    local url="$1" dest="$2" tries="${3:-3}" n
    for ((n=1; n<=tries; n++)); do
        if curl -fsSL --max-time 120 -o "$dest" "$url" && [[ -s "$dest" ]]; then
            return 0
        fi
        log "AVISO: download falhou (tentativa ${n}/${tries}): $url"
        sleep 5
    done
    return 1
}

confirm() { [[ "$ASSUME_YES" -eq 1 ]] && return 0; read -r -p "$1 [s/N] " r; [[ "$r" =~ ^[sSyY]$ ]]; }

while getopts ":i:s:k:f:byh" opt; do
    case "$opt" in
        i) OVA_FILE="$OPTARG" ;; s) SIG_FILE="$OPTARG" ;; k) KEY_FILE="$OPTARG" ;;
        f) EXPECTED_FPR="$OPTARG" ;; b) BOOT_VMS=1 ;; y) ASSUME_YES=1 ;;
        h) exit 0 ;; *) exit 1 ;;
    esac
done

command -v VBoxManage >/dev/null 2>&1 || fail "VBoxManage ausente — rode pgp-whonix-install-virtualbox.sh primeiro."
[[ -n "$OVA_FILE" && -n "$SIG_FILE" && -n "$EXPECTED_FPR" ]] || fail "Use -i -s -f ( -k opcional )."
[[ -f "$OVA_FILE" && -f "$SIG_FILE" ]] || fail "Arquivo .ova/.asc não encontrado."

if [[ -z "$KEY_FILE" ]]; then
    KEY_FILE="$(mktemp)"
    DOWNLOADED_KEY=1
    fetch_url "$DERIVATIVE_URL" "$KEY_FILE" || fail "Falha ao baixar derivative.asc após 3 tentativas"
fi
[[ -f "$KEY_FILE" ]] || fail "Arquivo de chave não encontrado: $KEY_FILE"

touch "$LOG_FILE" 2>/dev/null || LOG_FILE="./whonix-install.log"
confirm "Importar '$OVA_FILE'?" || exit 0

GNUPGHOME_DIR="$(mktemp -d)"; chmod 700 "$GNUPGHOME_DIR"; export GNUPGHOME="$GNUPGHOME_DIR"
gpg --quiet --import "$KEY_FILE" 2>&1 | tee -a "$LOG_FILE" >&2

exp="$(echo "$EXPECTED_FPR" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
matched=0
while read -r fpr; do
    act="$(echo "$fpr" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
    [[ "$act" == "$exp" ]] && matched=1 && break
done < <(gpg --with-colons --fingerprint 2>/dev/null | awk -F: '/^fpr:/ {print $10}')
[[ "$matched" -eq 1 ]] || fail "Fingerprint não confere — whonix.org/wiki/Verify_the_images"

gpg_log="$(mktemp)"
gpg --status-fd 1 --verify-options show-notations --verify "$SIG_FILE" "$OVA_FILE" \
    >"$gpg_log" 2>&1 || true
if grep -q "^\[GNUPG:\] VALIDSIG .*${exp}" "$gpg_log"; then
    log "Assinatura verificada (VALIDSIG + fingerprint esperado)."
    cat "$gpg_log" | tee -a "$LOG_FILE" >&2
    rm -f "$gpg_log"
else
    if grep -qi "EXPKEYSIG" "$gpg_log"; then
        cat "$gpg_log" | tee -a "$LOG_FILE" >&2
        rm -f "$gpg_log"
        fail "EXPKEYSIG — chave expirada. Reimporte derivative.asc e confira fingerprint."
    fi
    cat "$gpg_log" | tee -a "$LOG_FILE" >&2
    rm -f "$gpg_log"
    fail "Assinatura INVÁLIDA. NÃO importe."
fi

VBoxManage import "$OVA_FILE" | tee -a "$LOG_FILE" >&2
if [[ "$BOOT_VMS" -eq 1 ]]; then
    VBoxManage startvm "Whonix-Gateway" --type headless || true
    sleep 20
    VBoxManage startvm "Whonix-Workstation" --type gui || true
fi
log "OK — Gateway primeiro, depois pgp-whonix-verificar-tor.sh na Workstation."
