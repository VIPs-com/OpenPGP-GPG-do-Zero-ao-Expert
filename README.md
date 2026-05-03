# OpenPGP/GPG do Zero ao Expert

Curso em **um único Markdown** (versão canônica **1.0**), com orientações para mantenedor, roadmap e regras para o Cursor.

## Conteúdo principal

| Arquivo | Descrição |
|---------|-----------|
| [🎓 OpenPGPGPG do Zero ao Expert - Versão 1.0.md](./🎓%20OpenPGPGPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md) | Curso completo (módulos, comandos, checkpoints) |
| [ROADMAP.md](./ROADMAP.md) | Próximas sessões e backlog técnico |
| [.cursorrules](./.cursorrules) | Contexto e padrões do projeto para IA / equipe |

## Requisitos no leitor

- **GnuPG** ~2.4.x (Ubuntu 24.04 do curso); trechos experimentais **2.5.19+** (Kyber) onde indicado.
- **Tails** 7.7.1+ para laboratório offline; imagem **`.img`** para pendrive (ver curso, COMANDO 6.1).
- **Sequoia `sq`** ~1.3.x onde o módulo 12 referenciar.

## Licença e uso

Defina a licença no GitHub (repositório → **Add file** → **Create new file** → `LICENSE`) conforme a sua decisão editorial. Até lá, assume-se **todos os direitos reservados** pelo autor, salvo indicação explícita no repositório.

## Publicar este clone no GitHub (primeira vez)

1. No GitHub: **New repository** — nome sugerido, por exemplo `openpgp-do-zero-ao-expert`. **Sem** README, `.gitignore` ou licença gerados pelo site (o histórico local já existe).
2. No PowerShell, na pasta do projeto (ajuste `SEU_USUARIO` e `NOME_DO_REPO`):

```powershell
Set-Location E:\pgp
git remote add origin https://github.com/SEU_USUARIO/NOME_DO_REPO.git
git push -u origin main
```

Se preferir **SSH**:

```powershell
git remote add origin git@github.com:SEU_USUARIO/NOME_DO_REPO.git
git push -u origin main
```

Se `remote origin` já existir de um teste anterior: `git remote remove origin` e repita o `add`.

Depois do primeiro `push`, ative **Description**, **Topics** (`openpgp`, `gnupg`, `tails`, `pgp`) e visibilidade (**Public** / **Private**) nas definições do repositório.
