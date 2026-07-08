# Scripts — OpenPGP-GPG do Zero ao Expert

Scripts oficiais do curso [OpenPGP-GPG do Zero ao Expert](https://github.com/VIPs-com/OpenPGP-GPG-do-Zero-ao-Expert).

## GPG (Módulo 8)

```sh
mkdir -p ~/bin
cp scripts/gpg-health-check.sh ~/bin/
chmod +x ~/bin/gpg-health-check.sh
~/bin/gpg-health-check.sh
```

| Arquivo | Função |
| --- | --- |
| `gpg-health-check.sh` | Versão GnuPG, `~/.gnupg`, subchaves, SSH-agent, backup |

## Whonix capstone (playbook 10)

Scripts **autocontidos** — prefixo `pgp-whonix-*` (host Debian + Workstation):

| Arquivo | Onde roda | Função |
| --- | --- | --- |
| `pgp-whonix-install-virtualbox.sh` | Host | VirtualBox Oracle verificado |
| `pgp-whonix-verify-image.sh` | Host | Só verificação PGP (`derivative.asc`, `-f`) |
| `pgp-whonix-import-ova.sh` | Host | Verify + `VBoxManage import` |
| `pgp-whonix-verificar-tor.sh` | Workstation | Tor + systemcheck |

Guia: [`playbooks/10-whonix-capstone.md`](../playbooks/10-whonix-capstone.md)

**jul/2026:** PGP fail-closed com `VALIDSIG` + fingerprint (não depende de `Good signature`/locale PT-BR); `install-virtualbox` com `log` em stderr + `apt-get update` exit real; `sanitize_stale_repo_file()` remove `virtualbox.list` corrompido antes do Passo 1; `verificar-tor` com retry/timeout e finais de linha LF.

## Trilha integrada (Zero Trust Core)

Cofres NFC, VeraCrypt e `ztc-health` estão no repositório irmão — **não** duplicados aqui. Whonix neste repo é **autocontido** via `pgp-whonix-*`.

## Licença

Ver [`LICENSE`](../LICENSE).
