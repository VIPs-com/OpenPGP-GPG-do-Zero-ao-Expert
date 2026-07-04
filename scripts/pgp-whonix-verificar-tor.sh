#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-verificar-tor.sh — rode na Whonix-Workstation
# Playbook: playbooks/10-whonix-capstone.md (Passo 5)

set -euo pipefail
SKIP=0
for a in "$@"; do [[ "$a" == "--skip-systemcheck" ]] && SKIP=1; done

echo "=== OpenPGP-GPG — verificação Tor (Whonix Workstation) ==="
if [[ "$SKIP" -eq 0 ]] && command -v systemcheck >/dev/null 2>&1; then
    systemcheck || exit 1
fi
curl --silent --fail --socks5-hostname 127.0.0.1:9050 \
    https://check.torproject.org/api/ip 2>/dev/null | grep -qi '"IsTor":true' \
    || curl --silent --fail --socks5-hostname 127.0.0.1:9050 \
    https://check.torproject.org 2>/dev/null | grep -qi congratulations \
    || { echo "ERRO: Tor não confirmado." >&2; exit 1; }
echo "OK: Tor operacional. Importe subkeys (Módulo 6) na Workstation."
