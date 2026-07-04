# Playbooks — OpenPGP-GPG do Zero ao Expert

> **Formato:** código primeiro · fluxograma Mermaid · zero teoria inline  
> **Público:** quem já leu o curso e quer um guia de ação rápida  
> **Navegação:** cada playbook tem um `## Visão geral do processo` com flowchart clicável

---

## Mapa de playbooks

| # | Arquivo | Módulo do curso | Tempo | O que você faz |
|:-:|---------|----------------|------:|----------------|
| 01 | [01-ambiente-gpg.md](./01-ambiente-gpg.md) | Módulo 0 (0.2–0.8) | ~20 min | Instalar GPG · hardening `gpg.conf` + `gpg-agent.conf` |
| 02 | [02-primeira-chave.md](./02-primeira-chave.md) | Módulo 0.6 + 1 | ~25 min | Identidade de lab · mestra [C] · subchaves [S][E][A] |
| 03 | [03-cifrar-assinar.md](./03-cifrar-assinar.md) | Módulo 2 | ~20 min | Cifrar · decifrar · assinar detached · verificar + tamper test |
| 04 | [04-backup-revogacao.md](./04-backup-revogacao.md) | Módulo 3 | ~30 min | Certificado revogação · backup `age` · restore simulado |
| 05 | [05-git-assinado.md](./05-git-assinado.md) | Módulo 4 | ~20 min | Git config · commit -S · log --show-signature · tag assinada |
| 06 | [06-ssh-gpg-agent.md](./06-ssh-gpg-agent.md) | Módulo 5 | ~25 min | Keygrip [A] · `sshcontrol` · `SSH_AUTH_SOCK` · `ssh -T git@github.com` |
| 07 | [07-tails-chave-mestra.md](./07-tails-chave-mestra.md) | Módulo 6 | ~60 min | Gravar Tails · mestra air-gapped · exportar subchaves para PC |
| 08 | [08-debug-diagnostico.md](./08-debug-diagnostico.md) | Módulo 7 | ~15 min | Fluxo universal de diagnóstico · token USB · tabela sintoma→ação |
| 09 | [09-manutencao.md](./09-manutencao.md) | Módulo 10 + 8 | ~20 min | Refresh · trustdb · rotação subchaves · WKD · cron |
| 10 | [10-whonix-capstone.md](./10-whonix-capstone.md) | Capstone GPG+Tor | ~60 min | VirtualBox · Whonix LXQt · verify · import · subkeys na WS |

---

## Sequência recomendada (do zero)

```
01 → 02 → 03 → 04 → 05 → 06
                ↓
               07 (Tails — para identidade de produção)
                ↓
               10 (Whonix capstone — ambiente Tor para subkeys)
                ↓
               08 (quando algo der errado)
               09 (rotina mensal/trimestral)
```

## Como usar

Cada playbook segue o padrão:

```
Título / Objetivo / Tempo / Pré-requisitos
---
## Visão geral (Mermaid flowchart)
## Passo 1 … Passo N  (código primeiro)
## ✅ Concluído (smoke test)
## Troubleshooting (quando presente)
📖 Referência → âncoras no curso
```

## Correlação com o curso

| Playbook | Âncora no curso |
|----------|----------------|
| 01 | [`#-comando-02-atualizar-o-sistema`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-02-atualizar-o-sistema) |
| 02 | [`#comando-0-6-lab-ztc`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#comando-0-6-lab-ztc) |
| 03 | [`#-comando-21-criar-arquivo-de-teste`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-21-criar-arquivo-de-teste) |
| 04 | [`#-comando-31-certificado-de-revogação-obrigatório`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-31-certificado-de-revogação-obrigatório) |
| 05 | [`#-comando-41-configurando-o-git`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-41-configurando-o-git) |
| 06 | [`#-comando-51-encontrando-o-keygrip-da-subchave-a`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-51-encontrando-o-keygrip-da-subchave-a) |
| 07 | [`#comando-6-1-tails-ztc`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#comando-6-1-tails-ztc) |
| 08 | [`#-comando-71-debug-detalhado-de-qualquer-comando`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#-comando-71-debug-detalhado-de-qualquer-comando) |
| 09 | [`#comando-10-1`](../🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md#comando-10-1) |

---

*OpenPGP-GPG do Zero ao Expert · VIPs-com · [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)*
