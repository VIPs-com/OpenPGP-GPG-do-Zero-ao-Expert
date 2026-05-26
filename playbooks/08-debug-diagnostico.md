# Playbook 08 — Debug e Diagnóstico

**Objetivo:** Diagnosticar e resolver os problemas mais comuns do GPG + agente + token  
**Tempo:** ~15 min (referência — use conforme sintoma)  
**Pré-requisitos:** Playbook 01 concluído  

---

## Visão geral do processo

```mermaid
flowchart TD
    A([Sintoma]) --> B[gpg --version + gpgconf --check-programs]
    B --> C[gpg -K --with-keygrip]
    C --> D{Chaves listadas?}
    D -- Não --> E[gpg --import backup]
    D -- Sim --> F[gpgconf --list-dirs]
    F --> G{Agente OK?}
    G -- Não --> H[gpgconf --kill + --launch gpg-agent]
    G -- Sim --> I[echo smoke | gpg --clearsign]
    I --> J{Good signature?}
    J -- Não --> K[Verificar GPG_TTY + PIN]
    J -- Sim --> L([Sistema saudável])
    K --> H

    style A fill:#10b981,color:#fff
    style B fill:#10b981,color:#fff
    style C fill:#10b981,color:#fff
    style D fill:#475569,color:#fff
    style E fill:#7c3aed,color:#fff
    style F fill:#10b981,color:#fff
    style G fill:#475569,color:#fff
    style H fill:#3b82f6,color:#fff
    style I fill:#10b981,color:#fff
    style J fill:#475569,color:#fff
    style K fill:#991b1b,color:#fff
    style L fill:#eab308,color:#fff
```

---

## Diagnóstico rápido — rode na ordem

```sh
# 1. Versão e programas
gpg --version | head -n1
gpgconf --check-programs

# 2. Listar chaves com detalhes
gpg -K --with-keygrip --with-subkey-fingerprints --keyid-format long

# 3. Diretórios do agente
gpgconf --list-dirs

# 4. Teste mínimo de assinatura
echo "smoke-test" | gpg --clearsign > /tmp/gpg-smoke.asc
gpg --verify /tmp/gpg-smoke.asc
```

---

## COMANDO 7.1 — Debug verbose de qualquer operação

```sh
gpg --verbose --debug-level 9 --decrypt arquivo.gpg
```

Use quando um comando falha silenciosamente.

## COMANDO 7.2 — Inspecionar pacotes de arquivo .gpg

```sh
gpg --list-packets arquivo.gpg
```

Mostra: algoritmos usados · Key IDs · tamanhos · metadados (sem decifrar).

## COMANDO 7.3 — Ver diretórios e sockets do agente

```sh
gpgconf --list-dirs
gpgconf --check-programs
```

> Se `GNUPGHOME` estiver definido em variáveis de ambiente, todos os caminhos mudam — confirme com `echo "$GNUPGHOME"`.

## COMANDO 7.4 — Reiniciar agente (correção universal)

```sh
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
gpg --card-status 2>/dev/null || echo "(sem token — normal)"
```

## COMANDO 7.5 — Ver keygrips (necessários para SSH)

```sh
gpg -K --with-keygrip --with-subkey-fingerprints
```

---

## Token USB (YubiKey / Nitrokey) — diagnóstico

### 1) Confirmar que o SO vê o token

```sh
lsusb | grep -iE 'yubico|nitrokey|gnupg|openpgp|smart'
```

Sem resultado → problema de cabo, porta ou USB pass-through (em VM: ativar filtro USB).

### 2) Verificar e reiniciar pcscd

```sh
systemctl status pcscd --no-pager
sudo systemctl restart pcscd
```

Instalar se ausente: `sudo apt install pcscd` → relogue.

### 3) Reiniciar scdaemon preso

```sh
gpgconf --kill scdaemon
gpgconf --launch gpg-agent
gpg --card-status
```

### 4) Grupos udev (uma vez por máquina)

```sh
sudo usermod -aG plugdev "$USER"
# Se o grupo pcscd existir:
getent group pcscd >/dev/null && sudo usermod -aG pcscd "$USER"
# Encerrar sessão e voltar — depois:
gpg --card-status
```

---

## Tabela de sintomas → causa → ação

| Sintoma | Causa provável | Ação |
|---------|---------------|------|
| `No secret key` | Fingerprint errado ou chave não importada | `gpg -K` → reimportar backup |
| `BAD signature` em arquivo íntegro | Arquivo ou chave errada | Verificar FP do signatário |
| `Can't connect to agent` | Agente parado ou `GNUPGHOME` diferente | `gpgconf --launch gpg-agent`; checar `$GNUPGHOME` |
| `Agent refused operation` | Agente inconsistente | `gpgconf --kill + --launch gpg-agent` |
| `Permission denied (publickey)` no SSH | `sshcontrol`/`authorized_keys` incorreto | Rever keygrip e export SSH |
| `gpg --card-status` falha com token plugado | `pcscd` parado, `scdaemon` preso, `udev`/grupos | Sequência: `lsusb` → `pcscd` → `scdaemon` → grupos |
| `GPG_TTY` vazio → pinentry não abre | Terminal sem TTY exportado | `export GPG_TTY=$(tty)` |
| Commit Git não assina | `commit.gpgsign` ou `signingkey` errado | `git config --global commit.gpgsign true` |

---

## ✅ Sistema saudável quando:

```sh
# Todos os passos abaixo sem erro:
gpg --version | head -n1            # 2.4.x
gpg -K | grep "Aluno Lab"           # chave listada
echo "ok" | gpg --clearsign | gpg --verify - && echo "✅ Assinatura OK"
ssh-add -L | grep "openpgp" && echo "✅ SSH via GPG OK" || echo "(SSH não configurado — normal)"
```

---

📖 **Referência:** [COMANDO 7.1–7.5](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-71-debug-detalhado-de-qualquer-comando) · [Módulo 7 — Token USB](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#modulo-7-token-usb) · [Apêndice A](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#apendice-a)
