#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-import-ova.sh — OpenPGP-GPG do Zero ao Expert
#
# Playbook: playbooks/10-whonix-capstone.md (Passos 2–4)
# Verify derivative.asc + fingerprint (-f da wiki) + VBoxManage import.

set -euo pipefail

OVA_FILE="" SIG_FILE="" KEY_FILE="" VARIANT="" EXPECTED_FPR=""
BOOT_VMS=0 ASSUME_YES=0
LOG_FILE="/var/log/whonix-install.log"
GNUPGHOME_DIR=""

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
fail() { log "ERRO: $*"; cleanup; exit 1; }
cleanup() { [[ -n "$GNUPGHOME_DIR" && -d "$GNUPGHOME_DIR" ]] && rm -rf "$GNUPGHOME_DIR"; }
trap cleanup EXIT

confirm() { [[ "$ASSUME_YES" -eq 1 ]] && return 0; read -r -p "$1 [s/N] " r; [[ "$r" =~ ^[sSyY]$ ]]; }

while getopts ":i:s:k:f:t:byh" opt; do
    case "$opt" in
        i) OVA_FILE="$OPTARG" ;; s) SIG_FILE="$OPTARG" ;; k) KEY_FILE="$OPTARG" ;;
        f) EXPECTED_FPR="$OPTARG" ;; t) VARIANT="$OPTARG" ;; b) BOOT_VMS=1 ;; y) ASSUME_YES=1 ;;
        h) exit 0 ;; *) exit 1 ;;
    esac
done

command -v VBoxManage >/dev/null 2>&1 || fail "VBoxManage ausente — rode pgp-whonix-install-virtualbox.sh primeiro."
[[ -n "$OVA_FILE" && -n "$SIG_FILE" && -n "$KEY_FILE" && -n "$EXPECTED_FPR" ]] || fail "Use -i -s -k -f."
[[ -f "$OVA_FILE" && -f "$SIG_FILE" && -f "$KEY_FILE" ]] || fail "Arquivo não encontrado."

touch "$LOG_FILE" 2>/dev/null || LOG_FILE="./whonix-install.log"
confirm "Importar '$OVA_FILE'?" || exit 0

GNUPGHOME_DIR="$(mktemp -d)"; chmod 700 "$GNUPGHOME_DIR"; export GNUPGHOME="$GNUPGHOME_DIR"
gpg --quiet --import "$KEY_FILE"

exp="$(echo "$EXPECTED_FPR" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
matched=0
while read -r fpr; do
    act="$(echo "$fpr" | tr -d ' ' | tr '[:lower:]' '[:upper:]')"
    [[ "$act" == "$exp" ]] && matched=1 && break
done < <(gpg --with-colons --fingerprint 2>/dev/null | awk -F: '/^fpr:/ {print $10}')
[[ "$matched" -eq 1 ]] || fail "Fingerprint não confere — whonix.org/wiki/Verify_the_images"

out=""
gpg --verify "$SIG_FILE" "$OVA_FILE" > /dev/null 2>&1 || fail "Assinatura inválida."
gpg --verify "$SIG_FILE" "$OVA_FILE" 2>&1 | tee -a "$LOG_FILE" | grep -qi "Good signature" || fail "Sem Good signature."

VBoxManage import "$OVA_FILE" | tee -a "$LOG_FILE"
if [[ "$BOOT_VMS" -eq 1 ]]; then
    VBoxManage startvm "Whonix-Gateway" --type headless || true
    sleep 20
    VBoxManage startvm "Whonix-Workstation" --type gui || true
fi
log "OK — Gateway primeiro, depois pgp-whonix-verificar-tor.sh na Workstation."
