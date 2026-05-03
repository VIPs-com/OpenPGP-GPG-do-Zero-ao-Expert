# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade entre sessões. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável.

**Repositório remoto:** [github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert) — antes de editar noutra máquina: `git pull origin main`.

**Última ideia geral:** curso canônico num só `.md`; já há Tails `.img`, tabela Sequoia, `UID_IMPORT`, `FP`/`fpr:`, health-check, Módulo 12, política de idioma no `.cursorrules`.

---

## Próxima sessão (passagem rápida — ~30–60 min)

| # | Tarefa | Notas |
|---|--------|--------|
| 1 | «Continuar roadmap» ou colar este arquivo | Alinha com `.cursorrules`. |
| 2 | `git pull` / `git status` | Trabalhar em cima do `main`. |
| 3 | **Anexo do mantenedor** + cabeçalho | Versões Tails / GnuPG / `sq` vs blocos `wget` / links? |

---

## Backlog técnico (verificar / melhorar)

### Alta utilidade

- [ ] **Spot-check na VM Ubuntu do curso** dos COMANDOs mais sensíveis: `dd` + caminho do pendrive, `gpg --verify` da `.img`, `quick-add-key`, export/import subchaves, health-check completo.
- [x] **Varredura de URLs (amostra):** cabeçalho — GnuPG download, página Tails, `sq.1.html` → **200**; `user-documentation` → **308** para Pages (esperado; browser segue).
- [ ] **Varredura de URLs completa:** restantes links no `.md` (tabelas de referência, apêndices).
- [x] **Grep preventivo (parcial):** sem `grep -oP` nem `|| echo "0"` problemático nos scripts revistos; `list-secret-keys --with-colons |` só no anexo (advertência).
- [ ] **Grep preventivo completo:** novo script no `.md` → rever filtro UID/`fpr:` sempre.

### Média

- [ ] **Blocos Kyber / migração 2028–2030:** alinhar comentários se a CLI experimental do `gpg` mudar (nomes de algoritmo, `quick-generate-key`).
- [ ] **Thunderbird:** quando menus mudarem de novo, uma linha “confira ajuda integrada” + eventual screenshot/descrição mínima.
- [ ] **Glossário:** entradas que faltam ou remissões cruzadas (`sq cert` vs `sq key`, `--recipient-file`, etc.).

### Baixa / decisão de produto

- [ ] **Formato de entrega:** manter só `.md` vs export PDF/HTML/site — só quando quiser investir tempo; não bloqueia o trunk 1.x.
- [ ] **Opcional:** regra Cursor em `.cursor/rules/*.mdc` espelhando trechos do `.cursorrules` (formato novo do IDE).

---

## “Vai lembrar na próxima sessão?”

- **Sim, no sentido prático:** o próximo agente vê **este repositório**, **`.cursorrules`** e **`ROADMAP.md`**.
- **Não** no sentido de chat infinito: decisões finas ficam no **Git** (`git log -p`) ou em notas aqui no roadmap.
