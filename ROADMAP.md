# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade entre sessões. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável.

**Repositório remoto:** [github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) — antes de editar em outra máquina: `git pull origin main`.

**Última ideia geral:** curso canônico num só `.md`; já há Tails `.img`, tabela Sequoia, `UID_IMPORT`, `FP`/`fpr:`, health-check, Módulo 12, política de idioma no `.cursorrules`.

**PowerShell (Windows):** pasta do clone = `E:\pgp` / `Set-Location E:\pgp` — **`cd /e/pgp` é só Git Bash** (ver `.cursorrules`).

---

## Próxima sessão (passagem rápida — ~30–60 min)

| # | Tarefa | Notas |
|---|--------|--------|
| 1 | «Continuar roadmap» ou colar este arquivo | Alinha com `.cursorrules`. |
| 2 | `git pull` / `git status` | Na pasta do clone (**`/e/pgp`** ou `E:\pgp`); `git remote -v` tem de ser **OpenPGP-GPG-do-Zero-ao-Expert** — não `~` nem outro repo (ver `.cursorrules`). |
| 3 | **Spot-check na VM Ubuntu** (COMANDOs sensíveis) | Seguir **§ Spot-check VM Ubuntu** abaixo; cruzar com o `.md` (COMANDOs 6.1, 3.x, health-check, import subchaves). |

**Rodada mantenedor 2026-05 (feito):** Tails **7.7.1** conferido em [tails.net/install/download](https://tails.net/install/download/index.en.html); cabeçalho, tabela Módulo 0, COMANDO 6.1 (`wget`/`dd`/`gpg --verify`) e `README.md` coerentes. Anexo: linha de checklist **Versões externas** + bullet **README** na sincronização de versões.

**Rodada estática 2026-05-II (feito, texto — VM ainda pendente):** COMANDO 6.1 — nota **disco inteiro vs `/dev/sdX1`** no bloco `dd`; Módulo 8 — nota **cron + `mail`/`mailutils`** no exemplo do health-check. Próximo passo real continua a ser **spot-check na VM** (backlog).

**`.vscode/` e `scripts/` (2026-05):** deixam de ser versionados — **`.gitignore`** + remoção do índice no remoto; mantenedor mantém cópias **só no clone local** (task / `push-curso.bat` se quiser).

**Rodada estática 2026-05-III (feito, grep):** todas as linhas didáticas com `gpg --list-secret-keys --with-colons` para `FP` / `KEYGRIP` / verificação `ssb` usam **filtro por UID ou e-mail**; exceções aceites e documentadas: contagem `^sec:` no **health-check**; `gpg-import-subkeys.sh` com **`UID_IMPORT` vazio** (só laboratório). Repetir esta verificação ao **acrescentar** qualquer script novo no `.md`.

**Rodada estática 2026-05-IV (feito, PQ):** Módulo 11 — nota **mantenedor/aluno** sobre nomes de algoritmo na CLI (`--quick-generate-key` / build GnuPG); SPHINCS+ — lembrete de validar string quando houver suporte; anexo **Antes de commitar** — bullet **strings PQ na CLI**.

**Rodada estática 2026-05-V (feito):** `ROADMAP` — secção **Spot-check VM Ubuntu (roteiro mínimo)**; `README` — linha da tabela sobre o roteiro; grep por corrupção **`QUÂNTICA`** no título PQ do `.md` — **nenhuma** ocorrência indevida (só a dica no anexo).

**Rodada estática 2026-05-VI (feito):** decisão **formato de entrega** (secção abaixo); **`.cursor/rules/openpgp-course-pointer.mdc`** — ponte ao `.cursorrules` para o formato MDC do Cursor.

---

## Formato de entrega (decisão trunk 1.x)

**Até nova decisão explícita do mantenedor:** o que conta como **entrega principal** no Git é o **Markdown canónico** do curso + ficheiros de repo (`README`, `ROADMAP`, `.cursorrules`, `.cursor/rules`). **Não** há no trunk obrigação de PDF, HTML estático nem site gerado — isso fica para **fase posterior** se/quando houver tempo e ferramenta escolhida.

---

## Spot-check VM Ubuntu (roteiro mínimo)

VM alinhada ao curso (**Ubuntu 24.04**, `gnupg2`, rede para `wget`/`apt` onde necessário). Marque cada passo; anote desvios no backlog ou no commit seguinte.

| # | O quê | Referência no `.md` / notas |
|---|--------|------------------------------|
| 1 | `gpg --version` e `sq version` (se `sequoia-sq` instalado) | Cabeçalho + Módulo 12 |
| 2 | `wget` assinatura + `gpg --verify` da `.img` Tails (ou fluxo equivalente) | **COMANDO 6.1** |
| 3 | `lsblk -p`, confirmar **disco inteiro** (`/dev/sdX`), **não** `sdX1`; `dd` + `sync` em **pendrive de teste** ou imagem em loop | **COMANDO 6.1** |
| 4 | `gpg --quick-generate-key` / `--quick-add-key` com `LAB_EMAIL` e `FP` de `fpr:` | Módulos 3–4 |
| 5 | Export/import subchaves com **`UID_IMPORT`** igual ao UID da mestra quando houver >1 `sec:` | Módulo 6, `gpg-import-subkeys.sh` |
| 6 | Copiar o **health-check** do curso para `~/scripts/`, `chmod +x`, `LAB_EMAIL=... ./gpg-health-check.sh` | Módulo 8 (bônus) |
| 7 | (Opcional) `gpg --clearsign` / `gpg --verify` fumaça | Módulo 7 |

**Critério de fecho:** checklist acima sem erro bloqueante **ou** issues abertas/documentadas com comando exacto e saída.

---

## Backlog técnico (verificar / melhorar)

### Alta utilidade

- [ ] **Spot-check na VM Ubuntu do curso** dos COMANDOs mais sensíveis: `dd` + caminho do pendrive, `gpg --verify` da `.img`, `quick-add-key`, export/import subchaves, health-check completo.
- [x] **Varredura de URLs:** URLs HTTPS únicos do `.md` canônico verificados por **HEAD** na última rodada completa; **200** ou redirecionamentos esperados (**302** mirror Tails `.img`; **302** raiz `sequoia-sq/`; **308** guia `user-documentation/`). Sem **404**. Repetir **HEAD em lote** após novos links (ex.: GitHub do curso na nota editorial / tabela de referências).
- [x] **Grep preventivo (parcial):** sem `grep -oP` nem `|| echo "0"` problemático nos scripts revistos; `list-secret-keys --with-colons |` só no anexo (advertência).
- [x] **Grep preventivo completo:** rodada **2026-05-III** no `.md` canónico; ao **novo** bloco script no curso → rever de novo `list-secret-keys` + `fpr:` + `UID_IMPORT` / `LAB_EMAIL`.

### Média

- [x] **Blocos Kyber / migração 2028–2030:** nota defensiva **2026-05-IV** no Módulo 11 (validar strings na CLI real + manual); repetir sempre que o **GnuPG** subir de série experimental ou mudarem nomes `kyber*` / PQC no `gpg`.
- [x] **Thunderbird:** linha de **Ajuda** + caminho EN **Edit → Settings → End-to-End Encryption** no **Módulo 12**; repetir screenshot só se a UI mudar de novo de forma relevante.
- [x] **Glossário (trecho Sequoia + rede):** entradas `sq cert export`, `sq key export`, `sq decrypt` / `--recipient-file` (Módulo 12); mais **HKP** vs HKPS e remissão no glossário rápido (expandir se novos comandos `sq` ou políticas de rede entrarem no curso).

### Baixa / decisão de produto

- [x] **Formato de entrega:** decisão **2026-05-VI** — trunk = `.md` canónico + meta-repo; PDF/HTML/site **fora** do escopo até decisão nova (não bloqueia 1.x).
- [x] **Opcional — `.cursor/rules/*.mdc`:** ficheiro **`.cursor/rules/openpgp-course-pointer.mdc`** (ponte ao `.cursorrules`); ampliar ou dividir regras só se o `.cursorrules` ficar desordenado.

---

## “Vai lembrar na próxima sessão?”

- **Sim, no sentido prático:** o próximo agente vê **este repositório**, **`.cursorrules`**, **`.cursor/rules/*.mdc`** e **`ROADMAP.md`**.
- **Não** no sentido de chat infinito: decisões finas ficam no **Git** (`git log -p`) ou em notas aqui no roadmap.
