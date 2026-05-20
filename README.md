# OpenPGP/GPG do Zero ao Expert

Curso em **um único Markdown** (versão canônica **1.0**), com orientações para mantenedor, roadmap e regras para o Cursor. **Plano de evolução v1.0.x** (trincheiras, higiene do repo, nota 9,5): ver secção **«Plano definitivo v1.0.x»** no [`ROADMAP.md`](./ROADMAP.md).

## Conteúdo principal

| Arquivo | Descrição |
|---------|-----------|
| [🎓 OpenPGP-GPG do Zero ao Expert - Versão 1.0.md](./🎓%20OpenPGP-GPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md) | Curso completo (módulos, comandos, checkpoints, apêndices). No topo há um **mapa ASCII** (` ``` `) + logo abaixo o bloco **«Ligações diretas»** com saltos clicáveis para subsecções recentes (ex.: `#modulo-0-linha-tempo-cli`, `#modulo-1-decisao-subchaves-ecc`, `#apendice-a`). |
| [ROADMAP.md](./ROADMAP.md) | Fluxo auditoria → roadmap; **spot-check VM** opcional/pendente; checklist por camada; **Plano definitivo v1.0.x** (Eixos A/B/C) |
| [CERTIFICACAO-INTERNA.md](./CERTIFICACAO-INTERNA.md) | Rubrica opcional para validar nível **Expert** ao fechar o curso (instrutor/mantenedor) |
| [`LICENSE`](./LICENSE) | Direitos reservados (por padrão); substituir se mudar a política editorial |
| [.cursorrules](./.cursorrules) | Contexto e padrões do projeto para IA / equipe |
| [`.cursor/rules/openpgp-course-pointer.mdc`](./.cursor/rules/openpgp-course-pointer.mdc) | Ponte MDC do Cursor ao `.cursorrules` (regras canónicas) |

## Trilha integrada: [Zero Trust Core Expert](https://github.com/VIPs-com/Zero-Trust-Core)

Depois dos **Módulos 0–5** (ou em paralelo na trilha Expert deste repositório), o material de **integração operacional** cobre:

- KeePassXC + VeraCrypt + keyfile em **NTAG**
- Backup **3-2-1-1-0**, VM off-site (WireGuard + `rsync`)
- Runbook de contingência e automação (`ztc-health`, cron)

**Repositório:** [github.com/VIPs-com/Zero-Trust-Core](https://github.com/VIPs-com/Zero-Trust-Core) · release [v1.0.1](https://github.com/VIPs-com/Zero-Trust-Core/releases/tag/v1.0.1) · licença CC BY-SA 4.0.

> Este curso (OpenPGP-GPG) permanece a base de **GnuPG, Tails, subchaves e SSH**; Zero Trust Core **não** repete a teoria — só a pilha pessoal em camadas.

## Requisitos no leitor

- **GnuPG** ~2.4.x (Ubuntu 24.04 do curso); trechos experimentais **2.5.19+** (**ML-KEM** / `pqc`; rótulo «Kyber» na CLI) onde indicado.
- **Tails** 7.7.1+ para laboratório offline; imagem **`.img`** para pendrive (ver curso, COMANDO 6.1).
- **Sequoia `sq`** ~1.3.x onde o Módulo 12 referenciar.

## Licença e uso

Na raiz do repositório existe o arquivo **`LICENSE`**, que documenta **todos os direitos reservados** pelos autores do material (política por padrão). Se quiser adotar uma licença aberta (por exemplo **CC BY-SA 4.0** para conteúdo didático), substitua `LICENSE` por um texto reconhecido e atualize esta frase no `README.md`.

## Repositório no GitHub

**Remoto canônico:** [https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert)

```text
https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert.git
```

Atualizações habituais (depois de `git commit`):

```powershell
Set-Location E:\pgp   # ou o caminho do teu clone
git push origin main
```

Noutra máquina: `git clone https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert.git`

Nas definições do repositório no GitHub, convém preencher **Description**, **Topics** (`openpgp`, `gnupg`, `tails`, `pgp`) e, se quiseres, **Add file → LICENSE**.

## Estrutura do curso (visão rápida)

No ficheiro canônico, o corpo organiza-se em **quatro partes** (tempos orientativos no próprio curso):

| Parte | Âmbito |
|-------|--------|
| **1 — Primeiros passos** | Módulos **0–2**: ambiente, primeira chave, cifrar/decifrar/assinar/verificar; **Checkpoint 1**. |
| **2 — Fazendo certo** | Módulos **3–4**: backup e revogação; **Git** com assinatura GPG; **Checkpoint 2**. |
| **3 — Segurança avançada** | Módulos **5–8**: **SSH via GPG**; **Tails** e chave mestra offline; diagnóstico, token/`pcscd`, **automação** (*health-check*); **Checkpoint 3**. |
| **4 — Expert e futuro** | Módulos **9–12**: *threat modeling*; manutenção (WKD, keyservers, `dirmngr`, export mínimo, WoT); **ML-KEM** / PQ; **Sequoia `sq`**; exame final. |

## WSL2 e fronteira Win32 (sinalização na 1.0)

O desafio **Win32 ↔ WSL2** (dois `gpg-agent`, sockets, `SSH_AUTH_SOCK`) **não** ocupa a Parte 4 como «módulo de futuro criptográfico»: permanece **mapeado** na **1.0** com remissões, sem guia operacional longo duplicado.

- **Módulo 9:** linha de risco **Superfície dupla Win32 + WSL2** e mitigação **«um só mundo»** (política explícita).
- **Apêndice E:** caixa **v1.1 planejado** + tabela **«onde rever»** (M1–M5, M0/8, Apêndice D, bloco Windows) — mesma sintaxe `gpg`/`git`/`ssh`, outro contexto de agente e *keyring*.
- **[ROADMAP.md](./ROADMAP.md)** — **Backlog v1.1:** roteiro detalhado quando existir texto dedicado.

## Governança e qualidade

- **Só no disco local:** alguns ficheiros e pastas estão no [`.gitignore`](./.gitignore) (ex.: rascunhos, plano interno da equipa, diretórios de trabalho opcionais) — **não** sobem para o GitHub; o remoto fica o curso + meta-documentação acordada na raiz.
- **[ROADMAP.md](./ROADMAP.md):** tabela **«Última auditoria estática»** (Git/trunk, versões Tails/GnuPG/`sq`, HEAD em URLs do curso, grep preventivo, **VM** opcional, governança, `LICENSE`), **histórico de rodadas** e *snapshot* de pendências.
- **Workflow Git:** depois de alterar o `.md` canônico ou meta-docs, `git commit` + **`git push origin main`** para manter [o remoto](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) alinhado ao clone local (ver secção **Repositório no GitHub** acima).
- Conteúdo didático alinhado ao ecossistema **OpenPGP / GnuPG**; menções à **RFC 9580** e ao plano **pós-quântico** **onde o curso assinala** — material de formação, não substitui auditoria legal ou *compliance* formal da tua organização.
