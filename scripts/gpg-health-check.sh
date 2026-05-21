#!/bin/bash
# OpenPGP-GPG do Zero ao Expert — health-check (v1)
# Curso: Módulo 8 (bônus) — https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== HEALTH CHECK GPG ===${NC}"

# Identidade monitorada (laboratório do curso; exporte LAB_EMAIL antes de rodar se for outra)
LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"

# 1. Versão (M.N — sem depender de grep -P)
GPG_VER=$(gpg --version | head -n1 | grep -oE '[0-9]+\.[0-9]+' | head -n1 || true)
GPG_VER="${GPG_VER:-0.0}"
if command -v bc >/dev/null 2>&1; then
    if (( $(echo "$GPG_VER >= 2.5" | bc -l) )); then
        echo -e "${GREEN}✓ GPG $GPG_VER (OK)${NC}"
    elif (( $(echo "$GPG_VER >= 2.2" | bc -l) )); then
        echo -e "${YELLOW}⚠ GPG $GPG_VER (considere atualizar)${NC}"
    else
        echo -e "${RED}✗ GPG $GPG_VER (muito antigo)${NC}"
    fi
else
    echo -e "${YELLOW}⚠ bc não encontrado — comparativo numérico ignorado (detectado M.N ≈ $GPG_VER). Instale: sudo apt install bc${NC}"
fi

# 2. Diretório .gnupg
if [ -d ~/.gnupg ]; then
    PERM=$(stat -c "%a" ~/.gnupg)
    if [ "$PERM" = "700" ]; then
        echo -e "${GREEN}✓ ~/.gnupg permissões OK (700)${NC}"
    else
        echo -e "${RED}✗ ~/.gnupg permissões $PERM (deveria ser 700)${NC}"
        chmod 700 ~/.gnupg
        echo -e "${GREEN}  → Corrigido automaticamente${NC}"
    fi
else
    echo -e "${RED}✗ ~/.gnupg não existe${NC}"
fi

# 3. Chaves secretas (grep -c já imprime 0 sem linhas — evite || echo para não duplicar)
SECRET_KEYS=$(gpg --list-secret-keys --with-colons 2>/dev/null | grep -c "^sec:" || true)
SECRET_KEYS=$((10#${SECRET_KEYS:-0}))
if [ "$SECRET_KEYS" -gt 0 ]; then
    echo -e "${GREEN}✓ $SECRET_KEYS chave(s) secreta(s) encontrada(s)${NC}"
    if [ "$SECRET_KEYS" -gt 1 ]; then
        echo -e "${YELLOW}⚠ Várias mestras — fingerprint abaixo segue LAB_EMAIL=$LAB_EMAIL${NC}"
    fi
    FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')
    echo -e "${GREEN}✓ Fingerprint da mestra: $FP${NC}"
else
    echo -e "${RED}✗ Nenhuma chave secreta encontrada${NC}"
fi

# 4. Subchave de encrypt (deve ser cv25519!)
if gpg --list-secret-keys --with-colons "$LAB_EMAIL" 2>/dev/null | awk -F: 'BEGIN{f=0} /^ssb:/ && $0 ~ /:e:/ {f=1} END{exit !f}'; then
    if [ -z "${FP:-}" ]; then
        echo -e "${YELLOW}⚠ Subchave [E] detectada mas \$FP vazio — confira LAB_EMAIL e o passo 3 (fingerprint em fpr:)${NC}"
    elif gpg --export "$FP" 2>/dev/null | gpg --list-packets 2>/dev/null | grep -qi "cv25519"; then
        echo -e "${GREEN}✓ Subchave [E] com cv25519 (correto)${NC}"
    else
        echo -e "${RED}✗ Subchave [E] NÃO está usando cv25519${NC}"
        echo -e "${YELLOW}  → Corrija com: gpg --quick-add-key \"\$FP\" cv25519 encr 1y${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Subchave [E] não encontrada${NC}"
fi

# 5. Teste de assinatura
if echo "test" | gpg --clearsign > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Assinatura funciona${NC}"
else
    echo -e "${RED}✗ Falha ao assinar${NC}"
fi

# 6. SSH via GPG
if grep -q "enable-ssh-support" ~/.gnupg/gpg-agent.conf 2>/dev/null; then
    if [ -f ~/.gnupg/sshcontrol ] && [ -s ~/.gnupg/sshcontrol ]; then
        echo -e "${GREEN}✓ SSH via GPG configurado${NC}"
    else
        echo -e "${YELLOW}⚠ SSH via GPG configurado mas sem keygrips em sshcontrol${NC}"
    fi
else
    echo -e "${YELLOW}⚠ SSH via GPG não configurado${NC}"
fi

# 7. Token USB + pcscd + scdaemon (heurística — NÃO mata processos; ver Módulo 7)
echo -e "${YELLOW}--- Token / smartcard (opcional) ---${NC}"
USB_HINT=$(lsusb 2>/dev/null | grep -iE 'yubico|nitrokey' || true)
if [ -n "$USB_HINT" ]; then
    echo -e "${GREEN}✓ lsusb: possível token USB (YubiKey/Nitrokey)${NC}"
    CARD_OUT=$(gpg --card-status 2>&1 || true)
    if echo "$CARD_OUT" | grep -qiE 'Application ID|Application identifier|OpenPGP card no\.:'; then
        echo -e "${GREEN}✓ gpg --card-status: leitor respondeu (material OpenPGP visível)${NC}"
    else
        echo -e "${YELLOW}⚠ Token visível no lsusb, mas gpg --card-status não mostrou cartão OpenPGP como esperado${NC}"
        echo -e "${YELLOW}  → Ver Módulo 7 (pcscd, scdaemon, udev). Teste manual: gpgconf --kill scdaemon && gpg --card-status${NC}"
        if [ "${HEALTHCHECK_AUTO_RESET:-0}" = "1" ]; then
            echo -e "${YELLOW}⚠ HEALTHCHECK_AUTO_RESET=1 — tentando reinício controlado de scdaemon + gpg-agent (ver Apêndice D)${NC}"
            gpgconf --kill scdaemon 2>/dev/null || true
            gpgconf --kill gpg-agent 2>/dev/null || true
            gpgconf --launch gpg-agent 2>/dev/null || true
            CARD_OUT=$(gpg --card-status 2>&1 || true)
            if echo "$CARD_OUT" | grep -qiE 'Application ID|Application identifier|OpenPGP card no\.:'; then
                echo -e "${GREEN}✓ gpg --card-status OK após reset (modo auto)${NC}"
            else
                echo -e "${RED}✗ gpg --card-status ainda falhou após reset — investigue pcscd/udev/USB (Módulo 7)${NC}"
            fi
        fi
    fi
    if command -v systemctl >/dev/null 2>&1; then
        if systemctl --no-pager list-unit-files pcscd.service 2>/dev/null | awk '$1=="pcscd.service"{found=1} END{exit !found}'; then
            if systemctl is-active --quiet pcscd 2>/dev/null; then
                echo -e "${GREEN}✓ pcscd.service ativo${NC}"
            else
                echo -e "${YELLOW}⚠ pcscd.service existe mas não está ativo — sudo systemctl start pcscd (Módulo 7)${NC}"
            fi
        fi
    fi
    if pgrep -x scdaemon >/dev/null 2>&1; then
        echo -e "${GREEN}✓ scdaemon em execução (PID $(pgrep -x scdaemon | head -1))${NC}"
    else
        echo -e "${YELLOW}⚠ scdaemon não encontrado — pode ser normal se nunca abriu o leitor nesta sessão${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Nenhum YubiKey/Nitrokey óbvio no lsusb — diagnóstico de cartão pulado${NC}"
fi

# 8. Grupos udev / CCID (plugdev; pcscd só se o grupo existir)
echo -e "${YELLOW}--- Grupos (CCID / leitor USB) ---${NC}"
if id -nG 2>/dev/null | tr ' ' '\n' | grep -qx plugdev; then
    echo -e "${GREEN}✓ Usuário no grupo plugdev${NC}"
else
    echo -e "${YELLOW}⚠ Usuário fora do grupo plugdev — tokens USB costumam precisar (sudo usermod -aG plugdev \"$USER\"; logout). Ver Módulo 7${NC}"
fi
if getent group pcscd >/dev/null 2>&1; then
    if id -nG 2>/dev/null | tr ' ' '\n' | grep -qx pcscd; then
        echo -e "${GREEN}✓ Usuário no grupo pcscd${NC}"
    else
        echo -e "${YELLOW}⚠ Grupo pcscd existe, mas o usuário não é membro — considere: sudo usermod -aG pcscd \"$USER\" (logout). Ver Módulo 7${NC}"
    fi
fi

# 9. Backup recente
BACKUP_FILE=$(ls -t ~/gpg-backups/subkeys-*.age 2>/dev/null | head -n1 || true)
if [ -n "$BACKUP_FILE" ]; then
    BACKUP_DATE=$(stat -c %y "$BACKUP_FILE" | cut -d' ' -f1)
    echo -e "${GREEN}✓ Backup recente: $BACKUP_DATE${NC}"
else
    echo -e "${RED}✗ Nenhum backup encontrado em ~/gpg-backups/!${NC}"
fi

echo -e "${GREEN}=== FIM DO HEALTH CHECK ===${NC}"
