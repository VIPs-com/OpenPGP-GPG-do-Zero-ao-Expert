# Roadmap — próximas sessões (`pgp`)

**Objetivo:** continuidade quando voltar ao projeto. O Cursor carrega `.cursorrules` + este repo; **este arquivo** e o **histórico Git** são a “memória” estável entre dias.

**Última ideia geral:** curso canônico num só `.md`, revisões incrementais já cobriram Tails `.img`, tabela Sequoia, `UID_IMPORT`, `FP`/`fpr:`, health-check, Módulo 12, política de idioma no `.cursorrules`.

---

## Amanhã (sessão curta — ~1 h)

| # | Tarefa | Notas |
|---|--------|--------|
| 1 | Abrir o chat e dizer **«continuar roadmap»** ou colar o link deste `ROADMAP.md` | O agente alinha com `.cursorrules`. |
| 2 | `git pull` / `git status` | Ver se há alterações locais por fechar. |
| 3 | **Uma** passagem no **anexo do mantenedor** + cabeçalho | Versões Tails / GnuPG / `sq` ainda batem com `wget` e links? |

---

## Backlog técnico (verificar / melhorar)

### Alta utilidade

- [ ] **Spot-check na VM Ubuntu do curso** dos COMANDOs mais sensíveis: `dd` + caminho do pendrive, `gpg --verify` da `.img`, `quick-add-key`, export/import subchaves, health-check completo.
- [ ] **Varredura de URLs:** `curl -I` / `Invoke-WebRequest -Method Head` em links que mudam (Tails, GnuPG, GitLab Pages do Sequoia, `user-documentation` com redirect 308).
- [ ] **Grep preventivo:** `list-secret-keys --with-colons` **sem** filtro de UID/email em **scripts** (não no anexo didático); `grep -oP`; `|| echo "0"` em contagens.

### Média

- [ ] **Blocos Kyber / migração 2028–2030:** alinhar comentários se a CLI experimental do `gpg` mudar (nomes de algoritmo, `quick-generate-key`).
- [ ] **Thunderbird:** quando menus mudarem de novo, uma linha “confira ajuda integrada” + eventual screenshot/descrição mínima.
- [ ] **Glossário:** entradas que faltam ou remissões cruzadas (`sq cert` vs `sq key`, `--recipient-file`, etc.).

### Baixa / decisão de produto

- [ ] **Formato de entrega:** manter só `.md` vs export PDF/HTML/site — só quando quiser investir tempo; não bloqueia o trunk 1.x.
- [ ] **Opcional:** regra Cursor em `.cursor/rules/*.mdc` espelhando trechos do `.cursorrules` (formato novo do IDE).

---

## “Vai lembrar amanhã?”

- **Sim, no sentido prático:** o próximo agente vê **este repositório**, **`.cursorrules`** e **`ROADMAP.md`**.
- **Não** no sentido de “memória de conversa infinita”: se precisar de contexto fino de uma decisão, está no **Git** (`git log -p`) ou numa **nota** aqui no roadmap.

Bom descanso — até à próxima rodada.
