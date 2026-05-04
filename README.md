# OpenPGP/GPG do Zero ao Expert

Curso em **um único Markdown** (versão canônica **1.0**), com orientações para mantenedor, roadmap e regras para o Cursor.

## Conteúdo principal

| Arquivo | Descrição |
|---------|-----------|
| [🎓 OpenPGPGPG do Zero ao Expert - Versão 1.0.md](./🎓%20OpenPGPGPG%20do%20Zero%20ao%20Expert%20-%20Versão%201.0.md) | Curso completo (módulos, comandos, checkpoints) |
| [ROADMAP.md](./ROADMAP.md) | Fluxo auditoria → roadmap; **spot-check VM** pendente; checklist por camada |
| [`LICENSE`](./LICENSE) | Direitos reservados (por padrão); substituir se mudar a política editorial |
| [.cursorrules](./.cursorrules) | Contexto e padrões do projeto para IA / equipe |
| [`.cursor/rules/openpgp-course-pointer.mdc`](./.cursor/rules/openpgp-course-pointer.mdc) | Ponte MDC do Cursor ao `.cursorrules` (regras canônicas) |

## Requisitos no leitor

- **GnuPG** ~2.4.x (Ubuntu 24.04 do curso); trechos experimentais **2.5.19+** (Kyber) onde indicado.
- **Tails** 7.7.1+ para laboratório offline; imagem **`.img`** para pendrive (ver curso, COMANDO 6.1).
- **Sequoia `sq`** ~1.3.x onde o módulo 12 referenciar.

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
