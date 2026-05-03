# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade entre sessões. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável.

**Repositório remoto:** [github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) — antes de editar em outra máquina: `git pull origin main`.

**Última ideia geral:** curso canônico num só `.md`; já há Tails `.img`, tabela Sequoia, `UID_IMPORT`, `FP`/`fpr:`, health-check, Módulo 12, política de idioma no `.cursorrules`.

---

## Próxima sessão (passagem rápida — ~30–60 min)

| # | Tarefa | Notas |
|---|--------|--------|
| 1 | «Continuar roadmap» ou colar este arquivo | Alinha com `.cursorrules`. |
| 2 | `git pull` / `git status` | Na pasta do clone (**`/e/pgp`** ou `E:\pgp`); `git remote -v` tem de ser **OpenPGP-GPG-do-Zero-ao-Expert** — não `~` nem outro repo (ver `.cursorrules`). |
| 3 | **Anexo do mantenedor** + cabeçalho | Versões Tails / GnuPG / `sq` vs blocos `wget` / links? |

---

## Backlog técnico (verificar / melhorar)

### Alta utilidade

- [ ] **Spot-check na VM Ubuntu do curso** dos COMANDOs mais sensíveis: `dd` + caminho do pendrive, `gpg --verify` da `.img`, `quick-add-key`, export/import subchaves, health-check completo.
- [x] **Varredura de URLs:** URLs HTTPS únicos do `.md` canônico verificados por **HEAD** na última rodada completa; **200** ou redirecionamentos esperados (**302** mirror Tails `.img`; **302** raiz `sequoia-sq/`; **308** guia `user-documentation/`). Sem **404**. Repetir **HEAD em lote** após novos links (ex.: GitHub do curso na nota editorial / tabela de referências).
- [x] **Grep preventivo (parcial):** sem `grep -oP` nem `|| echo "0"` problemático nos scripts revistos; `list-secret-keys --with-colons |` só no anexo (advertência).
- [ ] **Grep preventivo completo:** novo script no `.md` → rever filtro UID/`fpr:` sempre.

### Média

- [ ] **Blocos Kyber / migração 2028–2030:** alinhar comentários se a CLI experimental do `gpg` mudar (nomes de algoritmo, `quick-generate-key`). URLs HEAD já cobertos na rodada anterior; repetir após mudanças grandes no `.md`.
- [x] **Thunderbird:** linha de **Ajuda** + caminho EN **Edit → Settings → End-to-End Encryption** no **Módulo 12**; repetir screenshot só se a UI mudar de novo de forma relevante.
- [x] **Glossário (trecho Sequoia + rede):** entradas `sq cert export`, `sq key export`, `sq decrypt` / `--recipient-file` (Módulo 12); mais **HKP** vs HKPS e remissão no glossário rápido (expandir se novos comandos `sq` ou políticas de rede entrarem no curso).

### Baixa / decisão de produto

- [ ] **Formato de entrega:** manter só `.md` vs export PDF/HTML/site — só quando quiser investir tempo; não bloqueia o trunk 1.x.
- [ ] **Opcional:** regra Cursor em `.cursor/rules/*.mdc` espelhando trechos do `.cursorrules` (formato novo do IDE).

---

## “Vai lembrar na próxima sessão?”

- **Sim, no sentido prático:** o próximo agente vê **este repositório**, **`.cursorrules`** e **`ROADMAP.md`**.
- **Não** no sentido de chat infinito: decisões finas ficam no **Git** (`git log -p`) ou em notas aqui no roadmap.
