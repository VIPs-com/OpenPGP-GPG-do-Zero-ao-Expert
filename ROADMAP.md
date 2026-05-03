# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade entre sessões. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável.

**Repositório remoto:** [github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) — antes de editar noutra máquina: `git pull origin main`.

**PowerShell (Windows):** pasta do clone = `E:\pgp` / `Set-Location E:\pgp` — **`cd /e/pgp` é só Git Bash** (ver `.cursorrules`).

---

## Fluxo aprovado: auditoria → tabela → roadmap

Ordem acordada com o **plano «Auditoria pré-roadmap»** (e auditoria técnica do conteúdo **2026-05-03**):

1. **Auditoria de conteúdo** no `.md` canónico (precisão GnuPG/Sequoia, rubricas, exemplos) — fechar **P1 → P2 → P3** quando possível.
2. **Auditoria estática do trunk** — checklist das **seis camadas** abaixo; preencher a **tabela de resultado** na secção seguinte.
3. **Novas linhas datadas** neste ficheiro (ex.: «Rodada estática 2026-05-VII») só **depois** de lacunas reais (FAIL/WARN) ou decisão explícita do mantenedor.

A **VM** pode correr em **paralelo** ou logo a seguir à auditoria estática; o fecho formal do spot-check atualiza a tabela e o backlog.

---

## Última auditoria estática (preencher após cada rodada completa)

| Área | Resultado | Notas / próximo passo |
| --- | --- | --- |
| Git / trunk | — | `git remote -v`, `main`, `.vscode/` e `scripts/` fora do índice |
| Versões (Tails / GnuPG / `sq`) | — | Cruzar cabeçalho, Módulo 0, `README`, notas aqui |
| URLs (HEAD HTTPS únicos) | — | 200 ou redirects **esperados**; sem **404** |
| Grep scripts + PQ (`list-secret-keys`, `fpr:`, sem `grep -oP`, `QUÂNTICA` indevido) | — | Ver anexo mantenedor + `.cursorrules` |
| VM (spot-check) | — | Ver **§ Spot-check VM Ubuntu** |
| Governança (`.cursorrules`, `.mdc`, formato entrega) | — | Ponte MDC; trunk = MD + meta |

*Substituir «—» por PASS / WARN / FAIL + data quando fechar a rodada.*

---

## Checklist por camada (cada «rodada completa» de auditoria)

Use na ordem sugerida: **1 → 2 → 4 → 3 → 6** (offline primeiro); **5** = VM quando houver tempo.

| # | Camada | O quê |
| --- | --- | --- |
| 1 | Inventário Git | Pasta do clone; `git pull` / `status`; remoto = **OpenPGP-GPG-do-Zero-ao-Expert**; nada sensível em `~` por engano |
| 2 | Versões | Grep cruzado `Tails`, `7.7`, `gnupg`, `2.4`, `2.5`, `sequoia`, `sq` entre `.md` canónico, `README`, notas de rodada |
| 3 | URLs | HEAD em lote nos HTTPS **únicos** do `.md` canónico; repetir após **novos** links |
| 4 | Grep preventivo | `list-secret-keys` / `fpr:` / `UID_IMPORT` / `LAB_EMAIL`; sem `grep -oP`; título PQ **`PÓS-QUÃNTICA`** (ã) — grep por **`QUÂNTICA`** (â) = corrupção de editor |
| 5 | Spot-check VM | Tabela em **§ Spot-check VM Ubuntu** |
| 6 | Governança | `.cursorrules` ↔ `openpgp-course-pointer.mdc`; secção **Formato de entrega**; `LICENSE` se política editorial existir |

---

## Próxima sessão (~30–90 min, «de vagar»)

| # | Tarefa | Notas |
| --- | --- | --- |
| 1 | Colar ou abrir este `ROADMAP.md` + `.cursorrules` | Contexto estável para o agente |
| 2 | `git pull` / `git status` / `git remote -v` | Em `E:\pgp` ou `/e/pgp` |
| 3 | **P1** no `.md` canónico (se ainda aberto) | Ver **§ Pendências ativas — P1** |
| 4 | Checklist **camadas 1–2–4** (e **3** se houver rede) | Atualizar **tabela de auditoria** |
| 5 | **Spot-check VM** | **§ Spot-check VM Ubuntu**; único passo que exige Ubuntu real |

---

## Pendências ativas (curso + repo)

### P1 — Correções técnicas imediatas (`.md` canónico)

*Origem: auditoria técnica 2026-05-03 + plano aprovado. **Não** alterar o título PQ para «â» — política do anexo: manter **`PÓS-QUÃNTICA`** (ã); grep por corrupção **`QUÂNTICA`**.*

- [ ] **T2:** Remover ou substituir `agent-timeout` em `gpg-agent.conf` (COMANDO 0.8 e tabela de perfis); confirmar com `man gpg-agent` / VM — opções válidas incluem `default-cache-ttl`, `max-cache-ttl`; para timeout de pinentry ver `pinentry-timeout` se for o objetivo.
- [ ] **T6:** Ajustar texto/exemplo de `gpg --generate-key` vs comentário (2.4.x não pede comentário como em `--full-generate-key`).
- [ ] **SEC1:** Alinhar exemplo de passphrase (COMANDO 1.1) com Mandamento 6 (mínimo 6 palavras em produção) ou nota explícita «laboratório».
- [ ] **Validação PQ (camada 4):** confirmar zero `QUÂNTICA` indevido no título/corpo; título canónico com **ã**.

### P2 — Precisão e clareza didática

- [ ] **T1:** Reformular `--gen-key` vs alias moderno de `--generate-key` (evitar «obsoleto» enganoso).
- [ ] **T7:** Nota sobre cert de revogação automático em `~/.gnupg/openpgp-revocs.d/` vs revogação manual exportada.
- [ ] **E2 / E3:** Tabela «Resultados esperados» / legenda — coerência 🔴🟡🟢🔵 e ⚫ vs legenda.
- [ ] **C1:** Rubrica checkpoint 1 — `.asc` (armor) vs `.sig` (binário).
- [ ] **S1 (opcional):** Texto ECC/RSA 2030–2040 vs estimativas NIST/NSA, com ressalva de incerteza.

### P3 — Ecossistema e robustez

- [ ] **R2:** Spot-check VM (espelha P1 operacional no SO real).
- [ ] **T5:** Idempotência COMANDO 5.3 (`grep -q` antes de `echo >>` em `enable-ssh-support`).
- [ ] **R1:** Ficheiro `LICENSE` no repositório (decisão editorial; README já menciona fallback).
- [ ] **R3:** Rever ponta a ponta `openpgp-course-pointer.mdc` ↔ `.cursorrules`.

### Outras (alta utilidade, fora P1–P3)

- [ ] **Spot-check na VM Ubuntu** — roteiro completo abaixo (`dd`, `gpg --verify` `.img`, `quick-add-key`, import subchaves, health-check).

---

## Spot-check VM Ubuntu (roteiro mínimo)

VM alinhada ao curso (**Ubuntu 24.04**, `gnupg2`, rede para `wget`/`apt` onde necessário). Marque cada passo; anote desvios no commit seguinte ou em issue.

| # | O quê | Referência no `.md` / notas |
| --- | --- | --- |
| 1 | `gpg --version` e `sq version` (se `sequoia-sq` instalado) | Cabeçalho + Módulo 12 |
| 2 | `wget` assinatura + `gpg --verify` da `.img` Tails (ou fluxo equivalente) | **COMANDO 6.1** |
| 3 | `lsblk -p`, confirmar **disco inteiro** (`/dev/sdX`), **não** `sdX1`; `dd` + `sync` em **pendrive de teste** ou imagem em loop | **COMANDO 6.1** |
| 4 | `gpg --quick-generate-key` / `--quick-add-key` com `LAB_EMAIL` e `FP` de `fpr:` | Módulos 3–4 |
| 5 | Export/import subchaves com **`UID_IMPORT`** igual ao UID da mestra quando houver >1 `sec:` | Módulo 6, `gpg-import-subkeys.sh` |
| 6 | Copiar o **health-check** do curso para `~/scripts/`, `chmod +x`, `LAB_EMAIL=... ./gpg-health-check.sh` | Módulo 8 (bônus) |
| 7 | (Opcional) `gpg --clearsign` / `gpg --verify` fumaça | Módulo 7 |

**Critério de fecho:** checklist sem erro bloqueante **ou** desvio documentado com comando e saída.

---

## Formato de entrega (decisão trunk 1.x)

**Até nova decisão explícita do mantenedor:** entrega principal no Git = **Markdown canónico** do curso + meta-repo (`README`, `ROADMAP`, `.cursorrules`, `.cursor/rules`). **Não** há obrigação no trunk de PDF, HTML estático nem site gerado — fase posterior se/quando houver ferramenta e tempo.

---

## Histórico de rodadas (2026-05 — concluídas)

Resumo do que já foi integrado no material ou no repo; detalhes finos no `git log`.

| Rodada | Tema |
| --- | --- |
| **2026-05** (mantenedor) | Tails **7.7.1**; cabeçalho, Módulo 0, COMANDO 6.1, `README`; anexo **Versões externas** |
| **2026-05-II** | `dd` disco vs partição; health-check **cron + mailutils** |
| **2026-05-III** | Grep preventivo `list-secret-keys` / `fpr:` / exceções documentadas |
| **2026-05-IV** | Módulo 11 PQ / strings CLI; SPHINCS+; anexo pré-commit PQ |
| **2026-05-V** | Secção spot-check VM; `README`; grep corrupção **`QUÂNTICA`** |
| **2026-05-VI** | Formato entrega trunk; **`.cursor/rules/openpgp-course-pointer.mdc`** |
| **Repo** | `.vscode/` e `scripts/` só locais (`.gitignore` + fora do remoto) |

**Manutenção recorrente:** ao **novo** bloco shell no `.md` canónico → rever `list-secret-keys` + `fpr:` + `UID_IMPORT` / `LAB_EMAIL`; ao **novo** link HTTPS → repetir **HEAD** em lote; ao subir **GnuPG** experimental → rever nomes PQ na CLI (Módulo 11).

---

## Backlog concluído (referência rápida)

Itens já tratados nas rodadas acima (não reabrir salvo regressão):

- Varredura URLs (última rodada completa; repetir só após links novos — agora coberto na **camada 3**).
- Grep preventivo parcial/completo (rodada III + regra de manutenção).
- Kyber / Thunderbird / glossário Sequoia+rede / decisão trunk / ponte MDC.

---

## «Vai lembrar na próxima sessão?»

- **Sim:** o próximo agente vê este repo, **`.cursorrules`**, **`.cursor/rules/*.mdc`** e **`ROADMAP.md`**.
- **Não** no sentido de chat infinito: decisões finas ficam no **Git** (`git log -p`) e na **tabela de auditoria** deste ficheiro.
