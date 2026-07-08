#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 OpenPGP-GPG contributors
#
# pgp-whonix-verificar-tor.sh — rode na Whonix-Workstation
# Playbook: playbooks/10-whonix-capstone.md (Passo 5)
#
# Changelog jul/2026: retry + timeout; finais de linha LF (CRLF quebra shebang).

set -euo pipefail

SKIP=0
TOR_RETRIES=3
TOR_TIMEOUT=30
for a in "$@"; do [[ "$a" == "--skip-systemcheck" ]] && SKIP=1; done

tor_check_ok() {
    if curl --silent --fail --max-time "$TOR_TIMEOUT" --socks5-hostname 127.0.0.1:9050 \
        https://check.torproject.org/api/ip 2>/dev/null | grep -qi '"IsTor":true'; then
        return 0
    fi
    if curl --silent --fail --max-time "$TOR_TIMEOUT" --socks5-hostname 127.0.0.1:9050 \
        https://check.torproject.org 2>/dev/null | grep -qi congratulations; then
        return 0
    fi
    return 1
}

echo "=== OpenPGP-GPG — verificação Tor (Whonix Workstation) ==="
if [[ "$SKIP" -eq 0 ]] && command -v systemcheck >/dev/null 2>&1; then
    systemcheck || exit 1
fi

echo "check.torproject.org via SOCKS (até ${TOR_RETRIES} tentativas)..."
_tor_ok=0
for _n in $(seq 1 "$TOR_RETRIES"); do
    if tor_check_ok; then
        _tor_ok=1
        break
    fi
    echo "  Tentativa ${_n}/${TOR_RETRIES} sem confirmação — aguardando 10s..."
    sleep 10
done
[[ "$_tor_ok" -eq 1 ]] || { echo "ERRO: Tor não confirmado." >&2; exit 1; }
echo "OK: Tor operacional. Importe subkeys (Módulo 6) na Workstation."
