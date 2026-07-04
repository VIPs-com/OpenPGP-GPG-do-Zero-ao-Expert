#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-install-virtualbox.sh — OpenPGP-GPG do Zero ao Expert
#
# Playbook: playbooks/10-whonix-capstone.md (Passo 1 — host Debian)
# Oracle VirtualBox verificado (GPG + DKMS + Extension Pack opcional).

set -euo pipefail

VBOX_SERIES="7.2"
INSTALL_EXTPACK=0
ASSUME_YES=0
KEYRING="/usr/share/keyrings/oracle-virtualbox.gpg"
REPO_FILE="/etc/apt/sources.list.d/virtualbox.list"
KEY_URL="https://www.virtualbox.org/download/oracle_vbox_2016.asc"
EXPECTED_FPR="B9F8D658297AF3EFC18D5CDFA2F683C52980AECF"
LOG_FILE="/var/log/virtualbox-install.log"
SUPPORTED_CODENAMES=("trixie" "bookworm" "bullseye")

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
fail() { log "ERRO: $*"; exit 1; }

require_root() { [[ "${EUID}" -ne 0 ]] && fail "Use sudo."; }

check_arch_and_codename() {
    local arch codename
    arch="$(dpkg --print-architecture)"
    # shellcheck disable=SC1091
    . /etc/os-release
    codename="${VERSION_CODENAME:-}"
    [[ "$arch" == "amd64" ]] || fail "amd64 required."
    local ok=0; for c in "${SUPPORTED_CODENAMES[@]}"; do [[ "$codename" == "$c" ]] && ok=1; done
    [[ "$ok" -eq 1 ]] || fail "Codename não suportado: $codename"
    echo "$codename"
}

confirm() { [[ "$ASSUME_YES" -eq 1 ]] && return 0; read -r -p "$1 [s/N] " r; [[ "$r" =~ ^[sSyY]$ ]]; }

while getopts ":v:eyh" opt; do
    case "$opt" in v) VBOX_SERIES="$OPTARG" ;; e) INSTALL_EXTPACK=1 ;; y) ASSUME_YES=1 ;; *) exit 1 ;; esac
done

require_root
touch "$LOG_FILE"
CODENAME="$(check_arch_and_codename)"
confirm "Instalar virtualbox-${VBOX_SERIES}?" || exit 0

apt-get update -qq
apt-get install -y -qq "linux-headers-$(uname -r)" dkms build-essential gcc make perl curl wget gnupg2
wget -qO- "$KEY_URL" | gpg --dearmor --yes -o "$KEYRING"
fpr="$(gpg --show-keys --with-colons --fingerprint "$KEYRING" | awk -F: '/^fpr:/ {print $10; exit}')"
[[ "$fpr" == "$EXPECTED_FPR" ]] || fail "Fingerprint Oracle inválida."
echo "deb [arch=amd64 signed-by=${KEYRING}] https://download.virtualbox.org/virtualbox/debian ${CODENAME} contrib" > "$REPO_FILE"
apt-get update 2>&1 | tee -a "$LOG_FILE" | grep -qiE "NO_PUBKEY|BADSIG" && fail "Repo VirtualBox não confiável."
apt-get install -y "virtualbox-${VBOX_SERIES}"
usermod -aG vboxusers "${SUDO_USER:-$USER}" 2>/dev/null || true
if [[ "$INSTALL_EXTPACK" -eq 1 ]]; then
    ver="$(dpkg-query -W -f='${Version}' "virtualbox-${VBOX_SERIES}" | cut -d: -f2 | cut -d- -f1)"
    tmp="$(mktemp -d)"
    wget -q -P "$tmp" "https://download.virtualbox.org/virtualbox/${ver}/Oracle_VirtualBox_Extension_Pack-${ver}.vbox-extpack" || true
    [[ -f "$tmp/Oracle_VirtualBox_Extension_Pack-${ver}.vbox-extpack" ]] && echo y | VBoxManage extpack install --replace "$tmp/Oracle_VirtualBox_Extension_Pack-${ver}.vbox-extpack" || true
    rm -rf "$tmp"
fi
log "OK — relogin vboxusers. Próximo: pgp-whonix-import-ova.sh"
