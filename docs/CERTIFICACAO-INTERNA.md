# Guia de certificação interna — nível «Expert» (curso v1.0)

**Objetivo:** permitir que **instrutor ou mantenedor** verifique, com critérios explícitos, se um aluno que **concluiu todos os módulos** demonstra competências alinhadas ao desenho do curso **OpenPGP/GPG do Zero ao Expert** (Markdown canônico na raiz do repositório).

**O que isto não é:** não substitui certificações comerciais (LPI, OSCP, etc.), auditoria legal nem homologação de produto. É **rubrica interna** para fecho de turma, *onboarding* técnico ou *badge* institucional, se a sua organização quiser **adotar**.

---

## Princípios

1. **Evidência por feito:** cada critério exige **comando executado**, **artefato** (arquivo, *commit*, *backup*) ou **relato datado** com saída reproduzível — não basta «li o módulo».
2. **Separação laboratório / produção:** chaves de laboratório (`LAB_EMAIL`, `GNUPGHOME` de teste) **não** contam como prova de operação segura em dados reais; servem para **técnica**. Para «Expert operacional», exija pelo menos um cenário com **UID/domínio próprio** ou política interna equivalente.
3. **Opcional avançado:** roteiro **ML-KEM** (Módulo 11 + passo **6b** do [`ROADMAP.md`](./ROADMAP.md)) é **extra**; não é obrigatório para declarar «Expert» no núcleo **ECC + OpenPGP clássico** de 2026.

---

## Rubrica mínima (todos obrigatórios para «Expert — núcleo»)

| # | Competência | Evidência esperada | Onde no curso |
| --- | --- | --- | --- |
| 1 | Chave mestra + subchaves **\[S\]\[E\]\[A\]** com **FP** correto | `gpg --list-secret-keys --with-colons` filtrado ao UID; `fpr:` coerente com o que assina | Módulos 1–4 |
| 2 | **Backup** e **revogação** compreendidos | Cópia de `subkeys-*.age` (ou fluxo equivalente) + saber localizar certificado em `openpgp-revocs.d` vs `--gen-revoke` | Módulo 3, Mandamentos |
| 3 | **Assinar** e **verificar** (arquivo e *clearsign*) | `.asc` / `.sig` + `gpg --verify` com **FPR** confirmado fora da banda | Módulo 2 |
| 4 | **Git** (`commit` / `tag`) com assinatura | `git log --show-signature` ou config `user.signingkey` + *tag* assinada de exemplo | Módulo 4 |
| 5 | **SSH via gpg-agent** (ou plano documentado se o SO não permitir) | `ssh-add -L` com chave do agente OU justificativa + alternativa aprovada pelo avaliador | Módulo 5 |
| 6 | **Tails** ou equivalente offline para material sensível | *Boot* ou VM + verificação de imagem (`gpg --verify` da `.img` conforme COMANDO 6.1) | Módulo 6 |
| 7 | **Token USB** (se política exigir hardware) | `gpg --card-status` OK após percorrer **Módulo 7** (`pcscd`, `udev`, grupos); OU declaração «sem hardware» + teste só com chaves em **arquivo** (`~/.gnupg`) | Módulo 6–7 |
| 8 | **Automação** consciente | `gpg-health-check.sh` (Módulo 8) com `LAB_EMAIL` ou UID real; interpretação de **WARN** vs **FAIL** | Módulo 8 |
| 9 | **Threat modeling** aplicado ao próprio caso | Matriz ou lista: 3 ameacas + mitigação + prioridade (pode ser o exercício do Módulo 9) | Módulo 9 |
| 10 | **Publicação de chave** (WKD ou política alternativa) | URL WKD de teste **ou** processo interno documentado (equipe sem domínio) | Módulo 10 |
| 11 | **Consciência pós-quântica** | Explicar em 5 frases: ML-KEM vs rótulo Kyber; ECC hoje; onde está o *draft* OpenPGP PQC — **sem** obrigar geração de chave PQ | Módulo 11 |
| 12 | **Leitura do ecossistema** | Resumo de 1 página: GnuPG vs **Sequoia `sq`**; um comando `sq` executado **ou** justificativa de indisponibilidade | Módulo 12 |

**Critério de aprovação «Expert — núcleo»:** todas as linhas da tabela com evidência aceite pelo avaliador; nenhum **FAIL** ignorado no health-check sem nota de risco assinada.

---

## Extensão «Expert — laboratório PQ» (opcional)

| # | Competência | Evidência | Referência |
| --- | --- | --- | --- |
| P1 | **GnuPG 2.5.19+** separado do `apt` LTS | `gpg --version` + origem do pacote/*build* | Cabeçalho do curso |
| P2 | **ML-KEM** end-to-end | `GNUPGHOME` de teste; `pqc default`; arquivo `/tmp/pq-lab-plain.txt` cifrado e decifrado com sucesso | Módulo 11; `ROADMAP` passo **6b** |

---

## Ficha de validação (copiar para preencher)

```
Aluno: _______________________   Data: __________
Avaliador: ____________________   Ambiente (SO/gpg): __________

[ ] Rubrica 1–12 (núcleo)
[ ] Extensão P1–P2 (PQ)

Notas / desvios:
_________________________________________________________________
Assinatura avaliador: _______________________
```

---

## Manutenção

Quando o curso subir de versão (novo Módulo, mudança de COMANDO ou *strings* PQ), **atualize** **esta rubrica** e o **ROADMAP** na mesma *pull request* — o guia deve permanecer **auditável** em relação ao Markdown **canônico**.
