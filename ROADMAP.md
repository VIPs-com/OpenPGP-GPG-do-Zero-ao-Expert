# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade entre sessões. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável.

**Repositório remoto:** [github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) — antes de editar noutra máquina: `git pull origin main`.

**PowerShell (Windows):** pasta do clone = `E:\pgp` / `Set-Location E:\pgp` — **`cd /e/pgp` é só Git Bash** (ver `.cursorrules`).

---

## Fluxo aprovado: auditoria → tabela → roadmap

Ordem acordada com o **plano «Auditoria pré-roadmap»** (e auditoria técnica do conteúdo **2026-05-03**):

1. **Auditoria de conteúdo** no `.md` canônico (precisão GnuPG/Sequoia, rubricas, exemplos) — fechar **P1 → P2 → P3** quando possível.
2. **Auditoria estática do trunk** — checklist das **seis camadas** abaixo; preencher a **tabela de resultado** na seção seguinte.
3. **Novas linhas datadas** neste arquivo (ex.: «Rodada estática 2026-05-X») só **depois** de lacunas reais (FAIL/WARN) ou decisão explícita do mantenedor.

A **VM** pode correr em **paralelo** ou logo a seguir à auditoria estática; o fecho formal do spot-check atualiza a tabela e o backlog. **Adiamento explícito:** se o mantenedor decidir **não** executar o roteiro nesta fase, mantenha **PENDENTE** na auditoria e **[ ]** em **R2** — não bloqueia outras tarefas do repo nem a continuidade do material estático.

---

## Última auditoria estática (preencher após cada rodada completa)

**Rodada de fecho:** **2026-05-14** — plano «Auditoria pré-roadmap» (camadas 1, 2, 4, 3, 6; **5** = VM continua manual).

| Área | Resultado | Notas / próximo passo |
| --- | --- | --- |
| Git / trunk | **PASS** 2026-05-03 | Re-verificação rápida (camada **1**): `main` alinhado com `origin/main`; working tree limpo; `git remote -v` = **OpenPGP-GPG-do-Zero-ao-Expert**; `git ls-files` sem `.vscode/` nem `scripts/` |
| Versões (Tails / GnuPG / `sq`) | **PASS** 2026-05-03 | Re-verificação (camada **2**): cabeçalho + `README.md` + Módulo 0 — Tails **7.7.1+**, GnuPG **2.4.x** / **2.5.19+**, **sequoia-sq ~1.3.x**; sem divergência |
| URLs (HEAD HTTPS únicos) | **PASS** 2026-05-14 | Lote canónico **23** (rodada 2026-05-03) + **2** da tabela «Referências oficiais» no `.md` canônico (`https://safecurves.cr.yp.to`, `https://www.eff.org/dice`); **HEAD** → **200** em todos; `https://SEU_DOMINIO/...` **fora** do lote |
| Grep scripts + PQ (`list-secret-keys`, `fpr:`, sem `grep -oP`, `QUÂNTICA` indevido) | **PASS** 2026-05-03 | Re-grep (camada **4**) pós-2026-05-02: **sem** `grep -oP`; **`QUÂNTICA`** só no anexo; novos blocos revistos — Apêndice F `FP_NOVO` com `"$UID_NOVO"`; exceções inalteradas: **health-check** `^sec:`; **import** `COLON_FILTER` sem UID só com nota de laboratório |
| VM (spot-check) | **PENDENTE** | Roteiro **§ Spot-check VM Ubuntu** — **adiado** (mantenedor: não executar agora); permanece **PENDENTE** até corrida real ou nova decisão |
| Governança (`.cursorrules`, `.mdc`, formato entrega) | **PASS** 2026-05-02 | `openpgp-course-pointer.mdc` → `.cursorrules`, `alwaysApply: true`; README coerente com trunk = MD + meta |
| `LICENSE` | **PASS** 2026-05-03 | Arquivo `LICENSE` no trunk (direitos reservados); README alinhado — mudança para licença aberta = substituir `LICENSE` + editar README |

*Substituir células conforme novas rodadas; VM passa a **PASS** quando o roteiro for executado ou desvio for documentado. **Adiado** = manter **PENDENTE** e anotar aqui a data da decisão (ver histórico).*

---

## Checklist por camada (cada «rodada completa» de auditoria)

Use na ordem sugerida: **1 → 2 → 4 → 3 → 6** (offline primeiro); **5** = VM quando houver tempo.

| # | Camada | O quê |
| --- | --- | --- |
| 1 | Inventário Git | Pasta do clone; `git pull` / `status`; remoto = **OpenPGP-GPG-do-Zero-ao-Expert**; nada sensível em `~` por engano |
| 2 | Versões | Grep cruzado `Tails`, `7.7`, `gnupg`, `2.4`, `2.5`, `sequoia`, `sq` entre `.md` canônico, `README`, notas de rodada |
| 3 | URLs | HEAD em lote nos HTTPS **únicos** do `.md` canônico; repetir após **novos** links |
| 4 | Grep preventivo | `list-secret-keys` / `fpr:` / `UID_IMPORT` / `LAB_EMAIL`; sem `grep -oP`; título PQ **`PÓS-QUÃNTICA`** (ã) — grep por **`QUÂNTICA`** (â) = corrupção de editor |
| 5 | Spot-check VM | Tabela em **§ Spot-check VM Ubuntu** |
| 6 | Governança | `.cursorrules` ↔ `openpgp-course-pointer.mdc`; seção **Formato de entrega**; `LICENSE` se política editorial existir |

---

## Próxima sessão (~30–90 min, «de vagar»)

| # | Tarefa | Notas |
| --- | --- | --- |
| 1 | Colar ou abrir este `ROADMAP.md` + `.cursorrules` | Contexto estável para o agente |
| 2 | `git pull` / `git status` / `git remote -v` | Em `E:\pgp` ou `/e/pgp` |
| 3 | Próxima tarefa à escolha (conteúdo `.md`, URLs, anexo, meta-repo) | **VM spot-check adiado** — ver § Pendências; **R2** continua **[ ]** |
| 4 | Checklist **camadas 1–2–4** (e **3** se houver rede) | Atualizar **tabela de auditoria** quando fizer rodada |
| 5 | **Spot-check VM** (opcional, quando houver Ubuntu) | **§ Spot-check VM Ubuntu** + **Registro de execução** — só após voltar a priorizar a VM |
| 6 | **Plano definitivo v1.0.x (nota 9,5)** | Secção **«Plano definitivo v1.0.x»** (após **Pendências ativas**) — Eixos A/B/C, *tracking* de trincheiras e higiene do repo |

---

## Pendências ativas (curso + repo)

### P1 — Correções técnicas imediatas (`.md` canônico)

*Origem: auditoria técnica 2026-05-03 + plano aprovado. **Não** alterar o título PQ para «â» — política do anexo: manter **`PÓS-QUÃNTICA`** (ã); grep por corrupção **`QUÂNTICA`**.*

- [x] **T2:** Remover ou substituir `agent-timeout` em `gpg-agent.conf` (COMANDO 0.8 e tabela de perfis); confirmar com `man gpg-agent` / VM — opções válidas incluem `default-cache-ttl`, `max-cache-ttl`; para timeout de pinentry ver `pinentry-timeout` se for o objetivo.
- [x] **T6:** Ajustar texto/exemplo de `gpg --generate-key` vs comentário (2.4.x não pede comentário como em `--full-generate-key`).
- [x] **SEC1:** Alinhar exemplo de passphrase (COMANDO 1.1) com Mandamento 6 (mínimo 6 palavras em produção) ou nota explícita «laboratório».
- [x] **Validação PQ (camada 4):** confirmar zero `QUÂNTICA` indevido no título/corpo; título canônico com **ã**.

### P2 — Precisão e clareza didática

- [x] **T1:** Reformular `--gen-key` vs alias moderno de `--generate-key` (evitar «obsoleto» enganoso).
- [x] **T7:** Nota sobre cert de revogação automático em `~/.gnupg/openpgp-revocs.d/` vs revogação manual exportada.
- [x] **E2 / E3:** Tabela «Resultados esperados» / legenda — coerência 🔴🟡🟢🔵 e ⚫ vs legenda.
- [x] **C1:** Rubrica checkpoint 1 — `.asc` (armor) vs `.sig` (binário).
- [x] **S1 (opcional):** Texto ECC/RSA 2030–2040 vs estimativas NIST/NSA, com ressalva de incerteza.

### P3 — Ecossistema e robustez

- [ ] **R2:** Spot-check VM (espelha P1 operacional no SO real). *Estado: **adiado** — não vai fazer agora; mantém-se pendente na auditoria e **[ ]** até nova prioridade.*
- [x] **T5:** Idempotência COMANDO 5.3 (`grep -q` antes de `echo >>` em `enable-ssh-support`).
- [x] **R1:** Arquivo `LICENSE` no repositório (direitos reservados; substituir se a decisão editorial for licença aberta).
- [x] **R3:** Rever ponta a ponta `openpgp-course-pointer.mdc` ↔ `.cursorrules`.

### Outras (alta utilidade, fora P1–P3)

- [ ] **Spot-check na VM Ubuntu** — roteiro completo abaixo (`dd`, `gpg --verify` `.img`, `quick-add-key`, import subchaves, health-check). *Idem **R2**: adiado por ora.*

---

## Plano definitivo v1.0.x (excelência / nota 9,5)

**Objetivo:** consolidar a **VERSÃO 1.0 canônica** num único Markdown (12 módulos + apêndices), alinhada a [`CERTIFICACAO-INTERNA.md`](./CERTIFICACAO-INTERNA.md), **sem** fundir a estrutura de 15 módulos da referência interna **`🎓 VERSÃO 4.4 EVOLUÍDA – A OBR.md`**. **Nota 9,5** = higiene do repositório + cadência de auditoria + **trincheiras** de conteúdo *reescritas* no tom 1.0 (**mineração selectiva** da 4.4).

**Ligações:** tabela **«Última auditoria estática»** (início deste ficheiro); **VM** — secção **«Spot-check VM Ubuntu»** abaixo; **R2** — **«Pendências ativas»** acima.

**Regra:** não renumerar módulos nem criar «Módulo 1.5» no mapa certificado; novos blocos entram como **subsecções** ou **apêndices**.

### Eixo A — Higiene do repositório (decisões de manutenção)

| Item | Estado | Notas |
| --- | --- | --- |
| **A1** — Nome do ficheiro canônico (`OpenPGPGPG` no nome em disco) | não iniciado | Corrigir o segmento no *filename*; varredura em `README.md`, cabeçalho do `.md` canônico, `CERTIFICACAO-INTERNA.md`, `.cursorrules`, links relativos; decidir **emoji + Versão 1.0** vs nome **ASCII** e registar a decisão num *commit* |
| **A2** — Camada **5** (spot-check VM Ubuntu) | Pendente (política) | Ver **R2**, tabela **Registro de execução** e linha **VM** na auditoria estática; **PASS** só após corrida real ou desvio documentado |
| **A3** — Rodada **URLs** (camada 3) + métricas | não iniciado | Após *rename*, trincheiras com novos links ou grandes colagens: HEAD em lote nos HTTPS **únicos** do `.md` canônico; actualizar a célula **URLs** na tabela de auditoria (contagem + data) |

### Eixo B — Trincheiras de conteúdo v1.0.x (4.4 → canônico)

| Trincheira | Destino no canônico | Critério de pronto | Estado |
| --- | --- | --- | --- |
| Curvas **ed25519** × **cv25519** + tabela de decisão `[S]`/`[E]` | Módulo 1 (subsecções) | Aluno explica em ~60s o papel de `[S]` e `[E]` no curso | não iniciado |
| Evolução CLI `--gen-key` → `--full-*` / `--generate-key` / `--quick-*` | Módulo 0 ou 1 | Linha do tempo + o que usar no Ubuntu 24.04 do curso | não iniciado |
| PQ mais prático (lab híbrido, avisos 2.4 vs 2.5) | Módulo 11 | `GNUPGHOME` de teste + *teardown*; sem prometer 2.5 no `apt` para todos | não iniciado |
| Hardware: comparação, limitações, remissões `keytocard` | Apêndice C (+ M6/M7) | Tabela YubiKey / Nitrokey / SoloKeys; **sem** triplicar COMANDOs existentes | não iniciado |
| Windows / KeePassXC / FIDO2 / Syncthing / iPhone (profundidade) | Apêndice E | Roteiros em passos; **iPhone** mantém *disclaimer* Blink ≠ Secure Enclave | não iniciado |

**Fonte de mineração:** `🎓 VERSÃO 4.4 EVOLUÍDA – A OBR.md` (raiz do repo) — reaproveitar **ideia e estrutura**; reescrever no vocabulário e nas versões do trunk.

### Eixo C — Cadência

- Preferir **um tema** (ou uma linha da tabela B) por *commit* / *PR*.
- Após cada trincheira: camadas **2** e **4**; camada **3** se houver URLs novos; registo no **Histórico de rodadas** deste ficheiro e actualização da coluna **Estado** na tabela B.
- **Mapa visual** do curso: alterar só se surgir **COMANDO** novo ou título que o aluno procura no índice.

---

## Spot-check VM Ubuntu (roteiro mínimo)

> 📎 **Adiado:** se não for prioridade nesta fase, **não** preencha o registo abaixo; o roteiro permanece aqui para quando voltar à VM.

VM alinhada ao curso (**Ubuntu 24.04**, `gnupg2`, rede para `wget`/`apt` onde necessário). Marque cada passo; anote desvios no commit seguinte ou em issue.

| # | O quê | Referência no `.md` / notas |
| --- | --- | --- |
| 1 | `gpg --version` e `sq version` (se `sequoia-sq` instalado) | Cabeçalho + Módulo 12 |
| 2 | `wget` assinatura + `gpg --verify` da `.img` Tails (ou fluxo equivalente) | **COMANDO 6.1** |
| 3 | `lsblk -p`, confirmar **disco inteiro** (`/dev/sdX`), **não** `sdX1`; `dd` + `sync` em **pendrive de teste** ou imagem em loop | **COMANDO 6.1** |
| 4 | `gpg --quick-generate-key` / `--quick-add-key` com `LAB_EMAIL` e `FP` de `fpr:` | Módulos 3–4 |
| 5 | Export/import subchaves com **`UID_IMPORT`** igual ao UID da mestra quando houver >1 `sec:` | Módulo 6, `gpg-import-subkeys.sh` |
| 6 | Copiar o **health-check** do curso para `~/scripts/`, `chmod +x`, `LAB_EMAIL=... ./gpg-health-check.sh` | Módulo 8 (bônus) |
| 6b | (Opcional, **GnuPG 2.5.19+** separado do `apt`) Roteiro **ML-KEM** do Módulo 11: `GNUPGHOME` de teste, `pqc default`, cifrar/decifrar `/tmp/pq-lab-plain.txt` | Módulo 11 |
| 7 | (Opcional) `gpg --clearsign` / `gpg --verify` fumaça | Módulo 7 |

**Critério de fecho:** checklist sem erro bloqueante **ou** desvio documentado com comando e saída.

### Registro de execução (preencher na VM, depois commitar)

| # | Passo | OK |
| --- | --- | :---: |
| 1 | `gpg --version` (+ `sq version` se `sequoia-sq` instalado) | [ ] |
| 2 | `wget` + `gpg --verify` da `.img` Tails (ou fluxo equivalente) | [ ] |
| 3 | `lsblk` + `dd`/`sync` em disco **inteiro** (não partição) ou loop | [ ] |
| 4 | `quick-generate-key` / `quick-add-key` + `FP` de `fpr:` | [ ] |
| 5 | Import subchaves + `UID_IMPORT` quando >1 `sec:` | [ ] |
| 6 | `gpg-health-check.sh` com `LAB_EMAIL` | [ ] |
| 6b | (Opcional) Roteiro **ML-KEM** Módulo 11 (`pqc`, `GNUPGHOME` de teste) | [ ] |
| 7 | (Opcional) `clearsign` / `verify` | [ ] |

**Data da corrida:** _______________

**Notas / desvios** (comando + saída se **WARN** ou falha): _______________

**Ao fechar o spot-check na VM:** (1) marque os **OK** acima; (2) na tabela **«Última auditoria estática»**, linha **VM**, passe a **PASS** com a **data** e copie ou resuma as **notas**; (3) marque **[x]** em **R2** e em **Spot-check na VM Ubuntu** nas pendências; (4) `git commit` (ex.: `docs(repo): spot-check VM Ubuntu OK`) ou issue com o mesmo conteúdo.

---

## Formato de entrega (decisão trunk 1.x)

**Até nova decisão explícita do mantenedor:** entrega principal no Git = **Markdown canônico** do curso + meta-repo (`README`, `ROADMAP`, **`LICENSE`**, `.cursorrules`, `.cursor/rules`). **Não** há obrigação no trunk de PDF, HTML estático nem site gerado — fase posterior se/quando houver ferramenta e tempo.

---

## Changelog editorial (material v1.0.x)

Transparência para alunos e mantenedores: mudanças de **conteúdo** que cruzam módulos (detalhe no `git log` do `.md` canônico).

| Versão / data | Mudança | Impacto |
| --- | --- | --- |
| **v1.0.x** (2026-05) | **`HEALTHCHECK_AUTO_RESET`** no **Apêndice D**; ramo opt-in no `gpg-health-check.sh` (**Módulo 8**) | Suporte a **CI/CD** e servidores de assinatura: reinício controlado de `scdaemon` / agente quando `lsusb` vê token mas `gpg --card-status` falha; riscos (máquina partilhada, `pcscd`) documentados |
| **v1.0.x** (2026-05) | **Módulo 9:** riscos de **hardware/token** (USB / `pcscd` / VM, perda ou roubo do token) e remissões ao **Módulo 7**, passos **7–8** do health-check e **Apêndice D** | *Threat model* alinhado à camada física; liga mitigação preventiva à recuperação operacional |
| **v1.0.x** (2026-05) | **Módulo 11 (PQ):** **ML-KEM** (FIPS 203) vs rótulo **«Kyber»** na CLI; **RFC 9580** + trilho **draft-ietf-openpgp-pqc**; roteiro **`pqc default`** + cifragem/decifragem em `GNUPGHOME` de laboratório | Referência canônica até ~2030 com teoria alinhada a normas e prática reproduzível em **GnuPG 2.5.19+** |
| **v1.0.x** (2026-05) | **`CERTIFICACAO-INTERNA.md`:** rubrica **Expert — núcleo** (12 itens) + extensão opcional **PQ**; ficha copiável; limites legais explícitos | Fecho de turma / *onboarding* auditável sem «ilhas» fora do `README` |
| **v1.0.x** (2026-05) | **`.md` canônico:** remissão pós-**EXAME FINAL** → `./CERTIFICACAO-INTERNA.md` (instrutores + aluno avançado) | O recurso aparece no momento de fecho da jornada, antes dos **APÊNDICES** |
| **v1.0.x** (2026-05) | **Rede / WKD / CI:** secção **dirmngr**; **WKD** no domínio próprio; **gpg-agent** *headless* (`GPG_TTY`, loopback, SSH vs CI) | Auditoria: menos «ilhas» para aluno avançado e *training* corporativo |
| **v1.0.x** (2026-05) | **Clareza operacional:** prioridade **GnuPG** (apt vs lab PQ); **RFC 9580** visível no Módulo 12; exemplos Tails/SSH iPhone/PowerShell alinhados a fatos | Reduz confusão de iniciante e risco cognitivo / *supply-chain* |
| **v1.0.x** (2026-05) | **OpenKeychain (Android):** quadro de manutenção limitada / LTS comunitário; passo extra na lista; entrada no glossário | Aluno não assume *app* móvel como pilar de décadas sem verificar o repositório |
| **v1.1.x** (planejado) | **WSL2 + GPG (Windows):** agente, `SSH_AUTH_SOCK`, *boundary* Win32, coexistência com Gpg4win | *Gap* corporativo mais citado por devs Windows; texto completo adiado à **1.1** |
| **v1.0.x** (2026-05) | **Pré-lançamento:** HEAD nos URLs do cabeçalho; glossário alinhado a **ML-KEM** / **`GPG_TTY`** / **`HEALTHCHECK_AUTO_RESET`** | Segunda passagem opcional fechada sem bloquear publicação |

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
| **2026-05-VII** | **P1** no `.md`: remover `agent-timeout` + nota `pinentry-timeout`; COMANDO **1.1–1.3** alinhados a `--generate-key` sem comentário obrigatório; passphrase exemplo **6** segmentos (Mandamento 6); grep **`QUÂNTICA`** só no anexo |
| **2026-05-VIII** | **P2:** `--gen-key` como legado/alias (T1); nota `openpgp-revocs.d` vs `--gen-revoke` (T7); «Resultados esperados» + legenda **⚫** e níveis 🔵 (E2/E3); rubrica CP1 `.asc`/clearsign/`.sig` (C1); cronograma quântico + NIST + incerteza (S1); mapa Módulo 1 |
| **2026-05-IX** | **Auditoria estática trunk** (plano pré-roadmap): Git, versões, **HEAD** em URLs do `.md` canônico, grep preventivo, governança **R3**; correção URL GitHub sem `**` no Markdown; **T5** idempotência COMANDO 5.3; **VM** pendente de execução |
| **2026-05-03** | **R1:** arquivo **`LICENSE`** (todos os direitos reservados); **README** — seção licença; tabela de auditoria — linha `LICENSE` **PASS** |
| **2026-05-03 (camada 3 + curso)** | **URLs:** **HEAD** no `.md` — **23** HTTPS únicos, **200** todos (novo link `ROADMAP.md` no curso). **Aluno:** seção opcional **«Spot-check na VM»** (camada 5, checklist, fecho **PASS**, PR); mapa atualizado |
| **2026-05-03 (camadas 1+2+4)** | **Git** (1), **versões** (2) e **grep preventivo** (4) reexecutados após novos blocos desde 2026-05-02 — **PASS**; sem regressão |
| **2026-05-04** | **Anexo + ROADMAP:** checklist **Versões externas** inclui `LICENSE`; tabela de referências + bullet pré-commit `LICENSE`/`README`; **formato de entrega** lista `LICENSE`; nota **«Ao fechar o spot-check na VM»** (tabela R2 + commit) |
| **2026-05-05** | **VM:** tabela **«Registro de execução»** no `ROADMAP` (checkboxes por passo + data/notas) para fechar R2 com commit após a corrida real |
| **2026-05-06** | **VM adiada:** decisão explícita — **não** executar spot-check agora; auditoria **VM** mantém-se **PENDENTE**; **R2** / «Outras» ficam **[ ]**; próxima sessão desbloqueada para outras tarefas |
| **2026-05-07** | **Apêndice D + Módulo 8 + Módulo 9:** `HEALTHCHECK_AUTO_RESET=1` (opt-in); health-check com ramo condicionado; *threat model* com riscos token/USB e tabela de mitigação cruzada — ver **Changelog editorial** acima |
| **2026-05-08** | **Módulo 11 + meta:** ML-KEM/FIPS 203, RFC 9580 + *draft* OpenPGP PQC, roteiro `pqc` + round-trip cifrar/decifrar; glossário/mandamento 19/Módulo 9/12 e cabeçalho alinhados — ver **Changelog editorial** |
| **2026-05-09** | **`CERTIFICACAO-INTERNA.md` + README:** guia de rubrica «Expert»; changelog editorial |
| **2026-05-09** | **Curso canônico:** secção **«Validação de competências (nível Expert)»** após **EXAME FINAL + CERTIFICADO**, link `./CERTIFICACAO-INTERNA.md` |
| **2026-05-10** | **Módulo 10 + Apêndice D + glossário + mapa:** `dirmngr` (avançado); WKD *direct* passo a passo (`gpg-wks-client`); *headless* / `GPG_TTY` / pinentry no Apêndice D; âncoras `#comando-10-5`, `#dirmngr-avancado`, `#wkd-passo-a-passo`, `#apendice-d-headless-gpg-agent` |
| **2026-05-11** | **Auditoria externa (correcções):** COMANDO 2.1 sem texto tipo senha; Tails 6.1 com `TAILS_VER`; tabela Módulo 12 — prioridade **2.4.x apt** vs **2.5.x** só em lab; **RFC 9580** no Módulo 12 + glossário; iPhone/Blink sem alegação de Secure Enclave; PowerShell `enable-ssh-support` idempotente |
| **2026-05-12** | **Apêndice E (Android):** OpenKeychain — manutenção limitada, lançamentos irregulares, aviso de dependência; glossário + mapa |
| **2026-05-13** | **v1.1 planejado:** secção **Backlog v1.1** no `ROADMAP` (WSL2 + GPG, `SSH_AUTH_SOCK`, Gpg4win vs agente WSL); nota no Apêndice E + linha no mapa do curso |
| **2026-05-14** | **Pré-lançamento 1.0:** `curl -I -L` nos URLs do cabeçalho (GnuPG download, Tails, Sequoia `sq`, manual OpenPGP Key Management) — **200** ou **302→200**; glossário — entradas **ML-KEM**, **`GPG_TTY`**, **`HEALTHCHECK_AUTO_RESET`** + âncora `#apendice-d-healthcheck-auto-reset`; **HEAD** na tabela de referências (**SafeCurves**, **EFF Diceware**) — **200**; rubrica certificação (Git **Módulo 4** / SSH **Módulo 5**); nota didática **Apêndice F** (migração RSA→ECC); **pedagogia WSL2:** Módulo 9 — linha **Win32 + WSL2** → **Apêndice E** + `ROADMAP` v1.1; Apêndice E — `#apendice-e`, remissões M1–M5 / M0·8 / D / Windows; `#modulo-9-threat-modeling` (PARTE 4 sem inflação — PQ / Sequoia / WKD) |
| **2026-05-02** | **ROADMAP:** secção **«Plano definitivo v1.0.x (excelência / nota 9,5)»** — Eixos A (higiene), B (trincheiras 4.4 → canônico), C (cadência); **Backlog v1.1** alargado (**E‑ZT**, **E‑BENCH**, **E‑FLOW**, **E‑CERT**, **E‑K8S**); **README** remete ao plano; **Próxima sessão** — linha 6 |
| **Repo** | `.vscode/` e `scripts/` só locais (`.gitignore` + fora do remoto) |

**Manutenção recorrente:** ao **novo** bloco shell no `.md` canônico → rever `list-secret-keys` + `fpr:` + `UID_IMPORT` / `LAB_EMAIL`; ao **novo** link HTTPS → repetir **HEAD** em lote; ao subir **GnuPG** experimental → rever nomes PQ na CLI (Módulo 11).

---

## Backlog v1.1 (planejado — não bloqueia a versão 1.0 canônica)

Conteúdo acordado para **futura** revisão **1.1.x** do `.md` canônico; o trunk **1.0** permanece válido sem estes blocos.

| # | Tema | Notas para quem for escrever |
| --- | --- | --- |
| **E‑WSL** | **WSL2 + GnuPG no Windows** (Apêndice E ou subsecção nova) | Cobrir **dois mundos**: `gpg`/`gpg-agent` no **Ubuntu WSL** vs **Gpg4win** no Win32 — **conflito** de agentes, `GNUPGHOME`, sockets. **`SSH_AUTH_SOCK`**: não cruza o *boundary* **WSL ↔ Win32** por defeito; documentar *workarounds* comuns (*npipe* / `socat` / «Git só no WSL») com **avisos de risco**. **Pinentry** no WSL sem DISPLAY. *Decision tree*: «só WSL», «só Windows», «híbrido com política explícita». |
| **E‑ZT** | **Zero Trust** aplicado ao cofre GnuPG (conceito longo) | Enquadramento arquitectural (identidade, agentes, superfícies); **não** obrigatório para fechar a 1.0; evitar duplicar o *threat model* do Módulo 9 sem remissões |
| **E‑BENCH** | **Benchmarks** de performance (algoritmos / curvas) | Scripts reprodutíveis + aviso de *microbenchmark* enganoso; opcional para turmas avançadas |
| **E‑FLOW** | **Fluxogramas** / *assets* visuais densos | Diagramas (WKD, Tails → subchaves, recuperação); manutenção extra — ficar para quando houver ferramenta e tempo |
| **E‑CERT** | **Certificado** de conclusão mais elaborado (*design*) | Modelo visual ou PDF gerado; não bloqueia estudo pelo `.md` |
| **E‑K8S** | **Kubernetes** / rotinas operacionais além do Apêndice D | *Playbooks* ou exemplos adicionais se o Apêndice D ficar curto para o teu público-alvo |

**Origem:** **E‑WSL** — *feedback* de *gap* corporativo Windows/WSL. **E‑ZT** a **E‑K8S** — *stretch goals* acordados fora do âmbito **v1.0.x** (ver **Plano definitivo v1.0.x** — Eixo B para o que **entra** na 1.0).

---

## Backlog concluído (referência rápida)

Itens já tratados nas rodadas acima (não reabrir salvo regressão):

- Varredura URLs (última rodada completa; repetir só após links novos — agora coberto na **camada 3**).
- Grep preventivo parcial/completo (rodada III + regra de manutenção).
- ML-KEM / Thunderbird / glossário Sequoia+rede / decisão trunk / ponte MDC.

---

## «Vai lembrar na próxima sessão?»

- **Sim:** o próximo agente vê este repo, **`.cursorrules`**, **`.cursor/rules/*.mdc`** e **`ROADMAP.md`**.
- **Não** no sentido de chat infinito: decisões finas ficam no **Git** (`git log -p`) e na **tabela de auditoria** deste arquivo.
