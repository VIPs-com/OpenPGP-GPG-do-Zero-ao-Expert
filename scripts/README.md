# Scripts — OpenPGP-GPG do Zero ao Expert

Scripts oficiais do curso [OpenPGP-GPG do Zero ao Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert). Correspondem ao **bônus do Módulo 8** (health-check) no arquivo canônico do curso.

## Instalação

```sh
git clone https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert.git
cd OpenPGP-GPG-do-Zero-ao-Expert
mkdir -p ~/bin
cp scripts/gpg-health-check.sh ~/bin/
chmod +x ~/bin/gpg-health-check.sh
export LAB_EMAIL="seu.uid@exemplo.com"   # opcional; padrão = lab do curso
~/bin/gpg-health-check.sh
```

Dependência opcional: `sudo apt install bc` (comparativo de versão GnuPG).

## Arquivos

| Arquivo | Função |
| --- | --- |
| `gpg-health-check.sh` | Versão GnuPG, permissões `~/.gnupg`, subchaves, assinatura, SSH-agent, token USB, backup `~/gpg-backups/` |

## Trilha integrada (Zero Trust Core)

Cofres NFC, VeraCrypt, `ztc-health` e off-site estão no repositório irmão — **não** duplicados aqui:

| Script | Repositório |
| --- | --- |
| `ztc-health.sh`, `ztc-open-cofre.sh`, `ztc-rsync-offsite.sh` | [Zero-Trust-Core/scripts](https://github.com/VIPs-com/Zero-Trust-Core/tree/master/scripts) |

## Licença

Mesma do repositório: ver [`LICENSE`](../LICENSE).
