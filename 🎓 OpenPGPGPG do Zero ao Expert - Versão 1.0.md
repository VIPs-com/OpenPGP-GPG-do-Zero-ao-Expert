# 🎓 OpenPGP/GPG do Zero ao Expert – **VERSÃO 1.0 (canônica)**

**Autor:** Professor Especialista em Criptografia Aplicada no Linux, Windows, Android, iPhone  
**GnuPG:** ~**2.4.x** no Ubuntu 24.04 do curso (`apt`) · **2.5.19+** nas seções Kyber/ML‑KEM experimental (consulte [download](https://www.gnupg.org/download/index.en.html))  
**Tails:** 7.7.1+ (confira sempre em [tails.net/install/download](https://tails.net/install/download/index.en.html))  
**Sequoia (`sq`):** exemplos do curso alinhados a **sequoia-sq ~1.3.x** ([manual `sq(1)`](https://sequoia-pgp.gitlab.io/sequoia-sq/man/sq.1.html) · [páginas do projeto](https://sequoia-pgp.gitlab.io/sequoia-sq/) · depois de instalar, use `sq version`)  
**Metodologia:** 🔴🟡🟢🔵 + COMANDO A COMANDO + Checkpoints  
**Status:** ✅ **VERSÃO 1.0 — material canônico único**

> 📌 **Nota editorial:** **`🎓 OpenPGPGPG do Zero ao Expert - Versão 1.0.md`** é o curso oficial (**VERSÃO 1.0 canônica**), arquivo único no projeto. O cabeçalho usa **OpenPGP/GPG** como nome didático do curso.

* * *

## 📐 Para quem mantém este arquivo

Orientações opcionais para quem **edita** o texto estão no **Anexo (mantenedor)** no final — antes da Conclusão. **Quem só estuda pode ignorar** esse anexo.

* * *

## 📌 0. ONBOARDING (O QUE VOCÊ VÊ ANTES DE COMEÇAR)

* * *

### 🎓 CARTA DO PROFESSOR

Olá! Seja muito bem-vindo(a).

Se você está saindo do Windows, nunca usou o terminal e acha que GPG é coisa de "hacker profissional", **não se preocupe**. Este curso foi construído para quem quer aprender do zero, mas também para quem já é experiente.

**⚠️ AVISO IMPORTANTE:** GPG existe desde 1999. Os comandos mudaram MUITO ao longo dos anos. Se você pesquisar na internet, vai encontrar tutoriais com comandos antigos que **não funcionam mais como antigamente**.

**Este curso vai te mostrar:**

*   🔴 O que é **OBSOLETO** (não use)
*   🟡 O que **FUNCIONA** (mas é verboso)
*   🟢 O que é **PADRÃO ATUAL** (recomendado para iniciantes)
*   🔵 O que é **NÍVEL EXPERT** (recomendado para profissionais)

**Regra de ouro:** Tudo será feito dentro de uma máquina virtual. Você pode errar à vontade – nada vai afetar seu computador real. Quanto mais você errar agora, mais seguro ficará no futuro.

**📖 Você sabia?** O ecossistema GPG/OpenPGP mudou muito desde tutoriais clássicos centrados em RSA: este curso organiza o que ainda vale, o que é legado e o que é o fluxo recomendado hoje — sempre com a mesma ideia de aprender na prática, com calma.

**Vamos começar sua jornada do zero ao expert!** 🚀

* * *

### 🎯 RESULTADOS ESPERADOS

Ao final deste curso, você será capaz de:

| #   | Resultado | Nível |
| --- | --- | :---: |
| 1   | Criar identidades digitais robustas e impenetráveis | 🟢  |
| 2   | Cifrar e assinar qualquer tipo de dado com GPG | 🟢  |
| 3   | Gerenciar toda a sua vida criptográfica sem depender de nuvens | 🟡  |
| 4   | Integrar OpenPGP com Git, SSH e serviços modernos | 🟡  |
| 5   | Recuperar-se de qualquer desastre (perda de máquina, roubo, corrupção) | 🔴  |
| 6   | Planejar sua transição para criptografia pós-quântica (2026 em diante) | ⚫   |
| 7   | Validar e corrigir chaves PGP com confiança absoluta | 🔴  |
| 8   | Configurar ambientes air-gapped, virtuais e de produção | ⚫   |

* * *

### 👤 PERFIL DO ALUNO & PRÉ-REQUISITOS

**Público-alvo:**

*   Desenvolvedores que querem assinar commits e tags com segurança
*   SysAdmins e SecOps que gerenciam infraestrutura crítica
*   Entusiastas de privacidade e segurança digital
*   Qualquer pessoa que queira proteger sua identidade digital

**Pré-requisitos:**

*   **Mínimo:** Saber ligar um computador e usar navegador
*   **Recomendado:** Curiosidade para aprender e paciência para errar
*   **Não é necessário:** Conhecimento prévio de Linux, terminal ou criptografia

* * *

### 🛠️ CHECKLIST DE FERRAMENTAS NECESSÁRIAS

| Ferramenta | Onde obter | Para quê |
| --- | --- | --- |
| **VirtualBox** | [virtualbox.org](https://www.virtualbox.org/) | Criar máquina virtual isolada |
| **Ubuntu 24.04 LTS** | [ubuntu.com](https://ubuntu.com/download/desktop) | Sistema operacional do curso |
| **Tails 7.7.1+** | [tails.net/install/download](https://tails.net/install/download/index.en.html) | Geração de chave mestra offline |
| **GnuPG** (`gnupg2`) | `sudo apt install gnupg2` | **Ubuntu 24.04:** costuma ser série **2.4.x** (adequado ao curso). Trechos **2.5.19+** (Kyber experimental): veja [gnupg.org/download](https://www.gnupg.org/download/index.en.html) |
| **age** | `sudo apt install age` | Backup criptografado |
| **KeePassXC** (Windows) | [keepassxc.org](https://keepassxc.org/) | SSH Agent alternativo |
| **Syncthing** | [syncthing.net](https://syncthing.net/) | Sincronização local sem nuvem |

> 💡 **Versões empacotadas:** no Ubuntu **24.04 LTS**, `gnupg2` instalado pelo `apt` normalmente é **2.4.x** — cobre quase todo o curso. Onde o texto pede **GnuPG 2.5.19+** (por exemplo Kyber/ML-KEM em laboratório), use pacote mais novo ou build a partir do site oficial do projeto.

> 📎 **Conferência dos comandos `gpg`:** os exemplos foram revisados contra o manual oficial do projeto ([gestão OpenPGP / opções principais](https://www.gnupg.org/documentation/manuals/gnupg/OpenPGP-Key-Management.html)) para as séries **2.4.x** e **2.5.x**. Na máquina do curso, confirme sempre com `gpg --version`; em caso de divergência de distro, use `gpg OPÇÃO --help` ou `man gpg`.

* * *

### 🎯 ESCOLHA SEU CAMINHO

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   🟢 MODO TURBO (Para quem quer resultado HOJE)                             │
│   ─────────────────────────────────────────                                 │
│   • Duração: 1 semana (2-3 horas)                                           │
│   • O que você vai aprender:                                                │
│     - Instalar GPG e ter uma chave funcional                                │
│     - Assinar commits no GitHub                                             │
│     - Configurar SSH sem senha usando KeePassXC                             │
│     - Fazer backup simples                                                  │
│   • NÃO vamos usar: Tails, subchaves avançadas, servidores de chaves        │
│   • Ideal para: Desenvolvedores, estudantes, usuários domésticos            │
│                                                                             │
│   🔵 MODO EXPERT (Para quem quer DOMINAR o assunto)                         │
│   ─────────────────────────────────────────                                 │
│   • Duração: 4-6 semanas (20-30 horas)                                      │
│   • O que você vai aprender:                                                │
│     - Tudo do Modo Turbo +                                                  │
│     - Chave mestra offline no Tails                                         │
│     - Subchaves [S][E][A] separadas                                         │
│     - Cifragem de arquivos e mensagens                                      │
│     - Backup 3-2-1 com age e LUKS                                           │
│     - Recuperação de desastres                                              │
│     - Pós-quântico (Kyber) e preparação para 2030                           │
│   • Ideal para: SysAdmins, SecOps, entusiastas de segurança                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

> **🏁 Terminou o Modo Turbo?** Continue abaixo para o **Modo Expert** e aprofunde-se.

* * *

### 🚨 20 MANDAMENTOS DA CRIPTOGRAFIA FORTE

#### 🏛️ Categoria 1: Geração da Identidade (1-6)

| #   | Mandamento | Por que é crítico |
| --- | --- | --- |
| 1   | A chave mestra nunca sai do ambiente air-gapped | Se vazar, sua identidade digital morre |
| 2   | Nunca gere sua chave mestra em sistema diário | O sistema pode estar comprometido |
| 3   | Tails OS é obrigatório na criação da identidade principal | Garante ambiente limpo |
| 4   | Use sempre algoritmos modernos: ed25519 + cv25519 | ECC é padrão 2026 |
| 5   | RSA está obsoleto para novas chaves | Vulnerável a quânticos, lento |
| 6   | Passphrase com Diceware (mínimo 6 palavras) | Última linha de defesa |

#### 💾 Categoria 2: Backup e Revogação (7-10)

| #   | Mandamento | Por que é crítico |
| --- | --- | --- |
| 7   | Nunca reutilize passphrase em diferentes contextos | Comprometer uma não compromete todas |
| 8   | Faça backup 3-2-1 + age antes de qualquer uso | Backup sem teste = não existe |
| 9   | Crie e teste o certificado de revogação no mesmo dia | Se esperar, você esquece |
| 10  | Expire suas subchaves (1 a 2 anos no máximo) | Força rotação periódica |

#### 🔧 Categoria 3: Operação e Manutenção (11-16)

| #   | Mandamento | Por que é crítico |
| --- | --- | --- |
| 11  | Atualize regularmente com `--refresh-keys` | Chaves expiradas precisam ser atualizadas |
| 12  | Exporte sempre com `--export-options export-minimal` | Evita vazamento de metadados |
| 13  | Confiança nunca é cega: verifique fingerprints | Única garantia de autenticidade |
| 14  | Web of Trust > Keyservers cegos | Confiança construída por pessoas |
| 15  | WKD é preferível para publicação | HTTPS autenticado |
| 16  | Assine commits e tags no Git | Prova de autoria e integridade |

#### 🚀 Categoria 4: Segurança Avançada e Futuro (17-20)

| #   | Mandamento | Por que é crítico |
| --- | --- | --- |
| 17  | Use GPG como agente SSH sempre que possível | Centraliza identidade |
| 18  | Mantenha gpg-agent e pinentry atualizados | Evita travamentos |
| 19  | Planeje a migração para pós-quântico desde já | Kyber será padrão em 2028-2030 |
| 20  | Sua identidade digital é um ativo de longo prazo | Cuide como seus documentos mais importantes |

* * *

<a id="glossario-rapido"></a>

### 📖 GLOSSÁRIO RÁPIDO (1 MINUTO)

| Termo | Significado | Analogia |
| --- | --- | --- |
| **GPG** | GNU Privacy Guard | O "aplicativo" da criptografia |
| **Chave Pública** | Endereço para te enviarem mensagens | Seu número de WhatsApp público |
| **Chave Privada** | Sua chave secreta (nunca compartilhar!) | Sua senha do WhatsApp |
| **Chave Mestra** | Cria e revoga outras chaves | O cartório |
| **Subchaves** | Chaves do dia a dia \[S\]\[E\]\[A\] | Seus carimbos diários |
| **Fingerprint** | Impressão digital da chave | Seu CPF digital |
| **Cifrar** | Tornar o arquivo secreto | Colocar carta no envelope |
| **Assinar** | Provar que VOCÊ criou | Sua rubrica |
| **Revogar** | Invalidar uma chave comprometida | Cancelar um documento |
| **WKD** | Web Key Directory | Seu site oficial de contato |
| **Kyber** | Algoritmo pós-quântico (futuro) | Cadeado quântico |

> 📎 **Mais termos** (WoT, HKPS, keygrip, LUKS, `age`, air-gapped…): ver o [Glossário de referência](#glossario-referencia), na área dos Apêndices.

* * *

### ⏳ LINHA DO TEMPO EVOLUTIVA (2023–2030)

| Período | Características | Status |
| --- | --- | --- |
| **2023–2024** | Tutoriais comuns ainda centrados em RSA e comandos antigos | 🟡 Legado |
| **2025** | ECC mainstream, endurecimento de práticas | 🟢 Transição |
| **2026** | Estado da arte documentado neste material (referência atual) | 🟢 **ATUAL** |
| **2027–2028** | Era Sequoia-PGP (Rust, CI/CD) | ⚠️ Preparação |
| **2029–2030** | Salto Pós-Quântico (Kyber, SPHINCS+) | 🔮 Futuro |

* * *

## 🗺️ 1. MAPA DO CURSO (VISÃO GERAL)

```
📚 OpenPGP/GPG do Zero ao Expert – VERSÃO 1.0 (canônica)
│
├── 📌 0. ONBOARDING (O que você vê antes de começar)
│   ├── 🎓 Carta do Professor
│   ├── 🎯 Resultados Esperados
│   ├── 👤 Perfil do Aluno
│   ├── 🛠️ Checklist de Ferramentas
│   ├── 🎯 Escolha seu Caminho (Turbo × Expert)
│   ├── 🚨 20 Mandamentos da Criptografia Forte
│   ├── 📖 Glossário Rápido
│   └── ⏳ Linha do tempo evolutiva (2023–2030)
│
├── 🗺️ 1. MAPA DO CURSO (Você está aqui)
│
├── 🟢 2. PARTE 1: PRIMEIROS PASSOS (Semana 1) - 2-3 horas
│   ├── 🔴🟡🟢🔵 Legenda de Cores
│   │
│   ├── 📋 Módulo 0: Preparação do Ambiente
│   │   ├── ▸ COMANDO 0.1–0.4: terminal, apt, instalar GPG, verificar versão
│   │   ├── ▸ COMANDO 0.5: validação pré-vôo do ambiente
│   │   ├── ▸ COMANDO 0.5b: relógio correto (NTP / timedatectl)
│   │   ├── ▸ COMANDO 0.6: identidade de laboratório (nome/e-mail fictícios)
│   │   ├── ▸ COMANDO 0.7: hardening gpg.conf (baseline 2026)
│   │   ├── ▸ COMANDO 0.8: hardening gpg-agent.conf (+ SSH-ready)
│   │   └── 🚀 Bônus: Script de instalação automatizada
│   │
│   ├── 📋 Módulo 1: Sua Primeira Chave
│   │   ├── 🔴 OBSOLETO: gpg --gen-key
│   │   ├── 🟡 FUNCIONA: gpg --full-generate-key
│   │   ├── 🟢 PADRÃO: gpg --generate-key
│   │   ├── 🔵 EXPERT: gpg --quick-generate-key
│   │   ├── ▸ COMANDO 1.1: gpg --generate-key (primeira chave — laboratório)
│   │   ├── ▸ COMANDO 1.2: gpg --list-keys
│   │   ├── ▸ COMANDO 1.3: gpg --fingerprint
│   │   ├── ▸ COMANDO 1.4: gpg --quick-add-key
│   │   └── 🚀 Bônus: Script de geração de chaves
│   │
│   ├── 📋 Módulo 2: Cifrando e Decifrando
│   │   ├── ▸ COMANDO 2.1: echo > arquivo
│   │   ├── ▸ COMANDO 2.2: gpg --encrypt
│   │   ├── ▸ COMANDO 2.3: gpg --decrypt
│   │   ├── ▸ COMANDO 2.4: gpg --detach-sign
│   │   ├── ▸ COMANDO 2.5: gpg --verify
│   │   └── 🚀 Bônus: Script de backup diário
│   │
│   └── 🏁 CHECKPOINT 1: Cifre, assine e decifre (+ rubrica de aprovação)
│
├── 🟡 3. PARTE 2: FAZENDO CERTO (Semana 2) - 3-4 horas
│   │
│   ├── 📋 Módulo 3: Backup e Revogação
│   │   ├── 🔴 Abordagem simples (tem problema)
│   │   ├── 🟡 Abordagem com fingerprint (melhor)
│   │   ├── 🟢 Abordagem completa (recomendada)
│   │   ├── ▸ COMANDO 3.1: gpg --gen-revoke
│   │   ├── ▸ COMANDO 3.2: gpg --export-secret-subkeys
│   │   ├── ▸ COMANDO 3.3: age --passphrase
│   │   ├── ▸ COMANDO 3.4: Simulando perda total
│   │   ├── ▸ COMANDO 3.5: Revogar subchave comprometida
│   │   └── 🚀 Bônus: Script de backup completo
│   │
│   ├── 📋 Módulo 4: Git + GPG
│   │   ├── ▸ COMANDO 4.1: git config user.signingkey
│   │   ├── ▸ COMANDO 4.2: git commit -S
│   │   ├── ▸ COMANDO 4.3: git log --show-signature
│   │   ├── 🧯 Troubleshooting Git + GPG (pinentry, GPG_TTY, agente)
│   │   └── 🏢 Política recomendada para times (produção)
│   │
│   └── 🏁 CHECKPOINT 2: Commit assinado no GitHub (+ rubrica de aprovação)
│
├── 🔴 4. PARTE 3: SEGURANÇA AVANÇADA (Semana 3) - 4-5 horas
│   │
│   ├── 📋 Módulo 5: SSH via GPG
│   │   ├── ▸ COMANDO 5.1: keygrip da subchave [A]
│   │   ├── ▸ COMANDO 5.2: registrar keygrip em ~/.gnupg/sshcontrol
│   │   ├── ▸ COMANDO 5.3: gpg-agent com enable-ssh-support + SSH_AUTH_SOCK
│   │   ├── ▸ COMANDO 5.4: gpg --export-ssh-key (chave pública SSH)
│   │   ├── ▸ COMANDO 5.5: authorized_keys no servidor
│   │   ├── ▸ COMANDO 5.6: ssh-add -L / GitHub / localhost
│   │   └── 🚀 Bônus: Script de configuração SSH
│   │
│   ├── 📋 Módulo 6: Tails e Chave Mestra Offline
│   │   ├── ▸ COMANDO 6.1: dd para gravar Tails (com verificação)
│   │   ├── ▸ COMANDO 6.2: gpg no Tails (offline)
│   │   ├── ▸ COMANDO 6.3: exportando subchaves
│   │   └── 🚀 Bônus: Script automatizado para Tails
│   │
│   ├── 📋 Módulo 7: Diagnóstico e Debug
│   │   ├── ▸ COMANDO 7.1–7.3: verbose/list-packets/agente e dirs
│   │   ├── ▸ COMANDO 7.4: recarregar gpg-agent
│   │   ├── ▸ COMANDO 7.5: chaves com keygrips
│   │   └── 🚀 Bônus: Script de health-check
│   │
│   ├── 📋 Módulo 8: Automação (Scripts Evolutivos)
│   │   ├── 🔴 Abordagem simples (tem problema)
│   │   ├── 🟡 Abordagem com fingerprint (melhor)
│   │   ├── 🟢 Abordagem completa (recomendada)
│   │   └── 🚀 Bônus: Script final
│   │
│   └── 🏁 CHECKPOINT 3: Simulação de perda total (+ rubrica de aprovação)
│       └── 📋 Critérios: chaveiro limpo → restore → assinatura OK → documentação
│
├── ⚫ 5. PARTE 4: EXPERT & FUTURO (Semana 4) - 3-4 horas
│   │
│   ├── 📋 Módulo 9: Threat Modeling (Modelagem de Ameaças)
│   │   ├── Quais são seus riscos?
│   │   └── Como mitigar cada um?
│   │
│   ├── 📋 Módulo 10: Comandos de Manutenção
│   │   ├── ▸ COMANDO 10.1: gpg --refresh-keys (+ keyservers HKPS / WKD)
│   │   ├── ▸ COMANDO 10.2: gpg --check-trustdb
│   │   ├── ▸ COMANDO 10.3: gpg --update-trustdb
│   │   ├── ▸ COMANDO 10.4: export minimal (sem metadados)
│   │   ├── ▸ COMANDO 10.5: publicação via WKD
│   │   └── ▸ COMANDO 10.6: WoT — assinar chave de terceiro (+ adduid/addphoto)
│   │
│   ├── 📋 Módulo 11: Criptografia Pós-Quântica
│   │   ├── 🔵 Kyber/ML-KEM (experimental)
│   │   ├── 🔵 SPHINCS+ (assinatura)
│   │   └── 🚀 Guia de migração para 2028-2030
│   │
│   ├── 📋 Módulo 12: O Futuro do OpenPGP (Sequoia-PGP)
│   │   ├── Comandos equivalentes (gpg vs sq)
│   │   └── Roadmap 2027-2030
│   │
│   └── 🎓 EXAME FINAL + CERTIFICADO (+ Desafio final + modelo de certificado)
│
└── 📚 6. APÊNDICES E FECHO DO CURSO
    │
    ├── ✅ Folha única — checklists dos checkpoints
    ├── 📖 Glossário de referência (aluno)
    ├── Apêndice A: TABELA DE ERROS RÁPIDOS (Top 15)
    ├── Apêndice B: SCRIPTS EVOLUTIVOS (simples → fingerprint → completo)
    ├── Apêndice C: HARDWARE WALLETS + SMARTCARDS
    ├── Apêndice D: GPG EM PRODUÇÃO (Docker, CI/CD, K8s)
    ├── Apêndice E: GUIA MULTIPLATAFORMA (Win/Android/iPhone + SSH sem YubiKey: FIDO2/sk, ssh-add -c, cofres)
    ├── Apêndice F: MIGRAÇÃO RSA → ECC (Legado para Moderno)
    ├── ⚖️ Qualidade, ética e referências (checklist mantenedor + ética + URLs)
    ├── 📎 Anexo (mantenedor — opcional): princípios editoriais + pré-commit (PQ/Unicode, FP, URLs)
    └── 🏁 Conclusão

┌─────────────────────────────────────────────────────────────┐
│                    ROADMAP 2025-2030                         │
│  (Cronograma de Evolução do GPG e Pós-Quântico)             │
└─────────────────────────────────────────────────────────────┘
```

> 📌 **Sincronização com o texto:** esta árvore é um **índice visual**. Se algum COMANDO no corpo mudar de nome ou ordem, atualize este mapa — ou confira sempre pelos títulos **COMANDO** no texto principal.

* * *

## 🔴🟡🟢🔵 LEGENDA DE CORES (GUIA VISUAL)

| Cor | Significado | Quando usar |
| :---: | --- | --- |
| 🔴  | **OBSOLETO** | Não use. Já foi substituído ou tem falhas de segurança |
| 🟡  | **FUNCIONA** | Ainda funciona, mas é verboso ou tem alternativas melhores |
| 🟢  | **PADRÃO ATUAL** | Recomendado para o dia a dia. Use sempre que possível |
| 🔵  | **NÍVEL EXPERT** | O método mais correto. Use depois de entender o básico |

> 💰 **DICA DO PROFESSOR:** Guarde esta legenda. Você vai usá-la o tempo todo durante o curso.

* * *

## 🟢 2. PARTE 1: PRIMEIROS PASSOS (Semana 1)

> ⏱️ **Tempo estimado:** 2-3 horas
>
> 🎯 **Objetivo:** Instalar o GPG, criar sua primeira chave, cifrar e decifrar arquivos

* * *

### 📋 MÓDULO 0: PREPARAÇÃO DO AMBIENTE

> 🎯 **Objetivo:** Instalar o GPG e preparar o ambiente para os exercícios

* * *

#### ▸ COMANDO 0.1: Primeiros passos no terminal

**O que faz:** O terminal é onde você digita comandos. Vamos testar se está funcionando.

**Digite agora:**

```sh
echo "Olá! Eu estou no terminal"
```

**Saída esperada:**

```
Olá! Eu estou no terminal
```

**O que significa:** `echo` mostra texto na tela. É o "Olá Mundo" do terminal.

* * *

**Agora vamos ver onde você está:**

```sh
pwd
```

**Saída esperada (algo como):**

```
/home/aluno
```

**O que significa:** `pwd` = Print Working Directory. Mostra a pasta onde você está.

* * *

**E quem é você no sistema?**

```sh
whoami
```

**Saída esperada:**

```
aluno
```

* * *

**Liste os arquivos da pasta atual:**

```sh
ls -la
```

**O que significa:** `ls` = LiSt. `-la` mostra todos os arquivos (inclusive ocultos) com detalhes.

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `comando não encontrado` | Você digitou errado. Linux é exato — maiúsculas/minúsculas importam |
| `Permission denied` | Alguns comandos precisam de `sudo` (super usuário) |

* * *

**▶️ EXERCÍCIO 0.1:** Crie uma pasta chamada `gpg-curso` com `mkdir gpg-curso`. Depois entre nela com `cd gpg-curso`. Use `ls -la` para ver o que tem dentro.

* * *

#### ▸ COMANDO 0.2: Atualizando a lista de programas

**O que faz:** Atualiza a lista de programas disponíveis no sistema.

**Digite agora:**

```sh
sudo apt update
```

**O que significa:** `sudo` = super usuário (administrador). `apt` = gerenciador de pacotes. `update` = atualiza a lista.

**Saída esperada (parecido com):**

```
Hit:1 http://archive.ubuntu.com/ubuntu noble InRelease
Get:2 http://archive.ubuntu.com/ubuntu noble-updates InRelease
...
Reading package lists... Done
```

> ⚠️ Pode pedir sua senha. Digite a senha que você criou para o usuário `aluno` (as letras não aparecem na tela — é normal).

* * *

#### ▸ COMANDO 0.3: Instalando o GPG

**O que faz:** Instala o GPG e ferramentas necessárias.

**Digite agora:**

```sh
sudo apt install -y gnupg2 rng-tools age cryptsetup pinentry-tty
```

**O que cada um faz:**

*   `gnupg2` → O próprio GPG (versão moderna)
*   `rng-tools` → Gera números aleatórios (entropia) para chaves seguras
*   `age` → Ferramenta para backups (moderna, simples)
*   `cryptsetup` → Para criar pendrives criptografados (LUKS)
*   `pinentry-tty` → Interface para digitar senha no terminal

**Saída esperada (parecido com):**

```
Reading package lists... Done
Building dependency tree... Done
The following NEW packages will be installed:
  gnupg2 rng-tools age cryptsetup pinentry-tty
...
Setting up gnupg2 (2.4.4-2ubuntu17.4) ...
```

* * *

#### ▸ COMANDO 0.4: Verificando a instalação

**O que faz:** Mostra a versão do GPG instalada.

**Digite agora:**

```sh
gpg --version | head -n1
```

**Saída esperada:**

```
gpg (GnuPG) 2.4.4
```

> ✅ **Se aparecer 2.4.x ou 2.5.x, está tudo certo.**

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `gpg: command not found` | A instalação falhou. Rode `sudo apt install -y gnupg2` novamente |
| `Versão 2.2.x` | Funciona, mas considere atualizar para 2.4+ |
| `Versão 2.0.x` | Muito antigo. Atualize o sistema: `sudo apt upgrade` |

* * *

**▶️ EXERCÍCIO 0.2:** Rode `gpg --version` completo (sem o `| head -n1`). Identifique a versão e os algoritmos suportados.

* * *

#### ▸ COMANDO 0.5: Validação completa do ambiente (pré-voo)

**O que faz:** Garante que seu laboratório está pronto antes de criar chaves.

**Digite agora:**

```sh
gpg --version | head -n1
age --version
cat /proc/sys/kernel/random/entropy_avail
ls -ld ~/.gnupg
```

**Critérios mínimos para seguir:**

| Verificação | Esperado | Se não estiver OK |
| --- | --- | --- |
| GPG | 2.4+ (ideal 2.5+) | Atualize o sistema e reinstale `gnupg2` |
| age | Instalado e respondendo versão | Rode `sudo apt install -y age` |
| Entropia | > 100 (ideal > 300) | Aguarde atividade do sistema ou rode `rngd` |
| Permissão `~/.gnupg` | `drwx------` (700) | Rode `chmod 700 ~/.gnupg` |

* * *

#### ▸ COMANDO 0.5b: Relógio correto (NTP)

Assinaturas e validações dependem de horário confiável. Se o relógio estiver muito errado, você pode ver falhas estranhas de verificação.

```sh
date
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd 2>/dev/null || true
timedatectl status
```

* * *

#### ▸ COMANDO 0.6: Identidade de laboratório obrigatória

**O que faz:** Evita misturar estudo com identidade real.

```sh
NOME_LAB="Aluno Lab"
EMAIL_LAB="aluno.training@openpgp-lab.local"
COMENTARIO_LAB="TRAINING 2026"

echo "Nome: $NOME_LAB"
echo "Email: $EMAIL_LAB"
echo "Comentário: $COMENTARIO_LAB"
```

> 🔴 **Regra fixa do curso:** durante os exercícios, nunca use email pessoal, da empresa ou chave de produção.

**Passphrase da mestra (Diceware — opcional)**

Para gerar uma frase forte com dados físicos de verdade:

```sh
sudo apt install -y diceware
diceware -n 6 -d " "
```

Guarde em papel ou cofre; não reutilize entre contextos.

* * *

#### ▸ COMANDO 0.7: Hardening do `gpg.conf` (baseline 2026)

**O que faz:** Define padrões criptográficos fortes, reduz metadados e evita algoritmos legados.

```sh
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

cat > ~/.gnupg/gpg.conf << 'EOF'
personal-cipher-preferences AES256 AES192 AES
personal-digest-preferences SHA512 SHA384 SHA256
cert-digest-algo SHA512
default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP

s2k-cipher-algo AES256
s2k-digest-algo SHA512
s2k-count 65011712

no-emit-version
no-comments
export-options export-minimal

require-cross-certification
keyid-format long
with-fingerprint
with-subkey-fingerprint

disable-cipher-algo 3DES
disable-cipher-algo IDEA
disable-cipher-algo CAST5
EOF

chmod 600 ~/.gnupg/gpg.conf
```

* * *

#### ▸ COMANDO 0.8: Hardening do `gpg-agent.conf` (cache, SSH e estabilidade)

**O que faz:** Ajusta TTL seguro, ativa suporte SSH e recarrega agente corretamente.

```sh
cat > ~/.gnupg/gpg-agent.conf << 'EOF'
agent-timeout 600
default-cache-ttl 3600
max-cache-ttl 7200
enable-ssh-support
EOF

chmod 600 ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent && gpgconf --launch gpg-agent
```

> ✅ **Resultado esperado:** assinatura, cifragem e SSH via GPG ficam previsíveis e mais estáveis.

**Perfis opcionais do `gpg-agent.conf` (escolha consciente)**

O COMANDO 0.8 acima já implementa um perfil **equilibrado** com SSH ativo para você cursar os módulos 4–5 sem atrito. Para vida real, compare três níveis na tabela abaixo:

| Perfil | TTL / timeouts | SSH | Observação |
| --- | --- | --- | --- |
| Conveniente | `default-cache-ttl 7200`, `max-cache-ttl 86400` | `enable-ssh-support` | Menos prompts; só em máquina **sua** e controlada |
| Equilibrado / curso | `agent-timeout 600`, `default-cache-ttl 3600`, `max-cache-ttl 7200` | `enable-ssh-support` ou comentado até o Módulo 5 | Bom equilíbrio uso × risco |
| Didático | Igual ao equilibrado, com linhas comentadas explicando cada opção | Ative SSH quando chegar no Módulo 5 | Ideal para anotações e aulas |

**Cartão rápido:** editar → `nano ~/.gnupg/gpg-agent.conf` → `chmod 600 ~/.gnupg/gpg-agent.conf` → `gpgconf --kill gpg-agent && gpgconf --launch gpg-agent` → `export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)` quando usar SSH via GPG.

* * *

#### 🚀 BÔNUS: Script de instalação automatizada

> _Agora que você já sabe o que cada comando faz, aqui está um script que faz tudo de uma vez. Use apenas se quiser repetir a instalação em outra máquina._

```sh
#!/bin/bash
# install-gpg.sh - Instalação completa do GPG

echo "🔐 Instalando GPG e ferramentas..."

sudo apt update
sudo apt install -y gnupg2 rng-tools age cryptsetup pinentry-tty
sudo rngd -r /dev/urandom -o /dev/random

echo "✅ Instalação concluída!"
gpg --version | head -n1
```

* * *

### 📋 MÓDULO 1: SUA PRIMEIRA CHAVE

> 🎯 **Objetivo:** Criar sua primeira chave GPG e entender o que cada comando faz

> ⏱️ **Tempo estimado:** 45 minutos

* * *

#### A analogia que vai mudar sua vida (O Cartório)

```
🏢 CARTÓRIO (Chave Mestra)
├─ Só serve para criar, registrar e revogar outras chaves
├─ Fica guardado OFFLINE (cofre)
└─ Você visita o cartório 1-2 vezes por ano

🕹️ CARIMBOS (Subchaves)
├─ [S] Carimbo de ASSINATURA → autentica documentos e commits
├─ [E] Carimbo de CIFRA → guarda segredos em envelopes
└─ [A] Carimbo de AUTENTICAÇÃO → abre portas (SSH)

Cada carimbo fica no seu bolso (PC diário).
Se você perder o carimbo [A], só revoga ele. O cartório continua lá.
```

> 💰 **DICA:** Guarde esta analogia. Você vai usá-la para sempre.

* * *

#### ECC sem enrolação: por que `[S]/[A]` usam `ed25519` e `[E]` usa `cv25519`

| Subchave | Curva recomendada | Motivo técnico | Uso no curso |
| --- | --- | --- | --- |
| `[S]` Assinatura | `ed25519` | EdDSA rápida e robusta para assinatura | Commits, tags, arquivos |
| `[A]` Autenticação | `ed25519` | Excelente para autenticação SSH | Login SSH via GPG |
| `[E]` Cifração | `cv25519` | X25519/ECDH é canônico para troca de chave | Cifrar mensagens/arquivos |

**Resumo prático:**

- `ed25519` = assinatura/autenticação
- `cv25519` = cifração
- Misturar pode funcionar, mas o padrão técnico moderno é usar cada curva no papel correto

```sh
# Modelo recomendado de subchaves (2026)
gpg --quick-add-key "$FP" ed25519 sign 1y
gpg --quick-add-key "$FP" cv25519 encr 1y
gpg --quick-add-key "$FP" ed25519 auth 1y
```

* * *

#### Três formas de criar uma chave (e por que uma é melhor)

**🔴 FORMA OBSOLETA (NÃO USE):**

```sh
gpg --gen-key
```

**O que tem de errado?** O comportamento muda entre versões do GPG. Você vai encontrar isso em tutoriais antigos. **IGNORE.**

* * *

**🟡 FORMA QUE FUNCIONA (mas é verbosa):**

```sh
gpg --full-generate-key
```

**O que acontece?** O GPG pergunta TUDO:

*   Tipo de chave (RSA, ECC, etc.)
*   Tamanho da chave
*   Validade
*   Nome, email, comentário
*   Senha

**Por que é verbosa?** Pergunta muita coisa que iniciante não precisa saber.

* * *

**🟢 FORMA PADRÃO ATUAL (recomendada para aprender):**

```sh
gpg --generate-key
```

**O que acontece?** Pergunta só:

*   Nome
*   Email
*   Senha

**Por que é boa?** Simples, direta, segura o suficiente para começar.

* * *

**🔵 FORMA EXPERT (o que você vai usar depois de aprender):**

```sh
gpg --quick-generate-key "Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>" ed25519 cert 3y
```

**Por que é expert?** Tudo em uma linha. Sem perguntas. Reprodutível, sem erro humano.

> 💰 **DICA DO PROFESSOR:** Comece com 🟢 para entender o fluxo. Depois que entender, use 🔵 para tudo.

* * *

#### Mapa de subchaves e linha do tempo (ler tutoriais antigos sem cair em armadilha)

**Subchaves — dois jeitos válidos:**

| Abordagem | Como | Quando |
| --- | --- | --- |
| Legado / ajuste fino | `gpg --edit-key` → `addkey` | Correções pontuais no prompt interativo |
| Moderno / reproduzível | `gpg --quick-add-key ...` | Scripts, automação e fluxo principal deste curso |

**Linha do tempo dos comandos de criação:**

| Período | Criação típica | Subchaves típicas | Status |
| --- | --- | --- | --- |
| 1999–2016 | `gpg --gen-key` | `edit-key` + `addkey` | 🔴 Obsoleto |
| 2017–2022 | `gpg --full-generate-key` | idem | 🟡 Transição |
| 2023–2026 | `gpg --generate-key` ou `--quick-generate-key` | `--quick-add-key` | 🟢 Atual |

> ⚠️ Tutoriais velhos também sugerem `gpg --trust-model always` (quase sempre inadequado fora de laboratório) e export da chave secreta **inteira** sem necessidade — para backup operacional use `--export-secret-subkeys` (Módulo 3).

> 📌 O fluxo “criação de chave” continua no bloco **Três formas de criar** acima.

* * *

#### ▸ COMANDO 1.1: Criando sua primeira chave (método padrão)

**O que faz:** Cria uma chave GPG com configurações simples.

> ⚠️ **IMPORTANTE:** Use uma identidade FALSA para aprender. NUNCA use seu email real nos exercícios.

**Digite agora:**

```sh
gpg --generate-key
```

**O GPG vai perguntar:**

```
Nome real: Aluno Lab
Endereço de e-mail: aluno.training@openpgp-lab.local
Comentário: TRAINING 2026
```

> Use EXATAMENTE esses dados. O comentário ajuda a identificar que é uma chave de laboratório.

```
Você selecionou este identificador de usuário:
    "Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>"
```

**Digite** `O` **(OK)** quando o GnuPG pedir confirmação do identificador.

```
Vai pedir uma senha (passphrase).
```

> ⚠️ **Use uma senha forte, mas que você consiga lembrar para os exercícios.** Exemplo: `cadeado$trovão&lago#castelo` (sim, isso é uma senha forte — 4 palavras aleatórias)

**Saída esperada (final):**

```
gpg: key 3A4B5C6D7E8F9A0B marked as ultimately trusted
gpg: revocation certificate stored as '/home/aluno/.gnupg/openpgp-revocs.d/3A4B5C6D7E8F9A0B.rev'
gpg: done
```

> ✅ **Guarde o fingerprint completo** da sua chave (`gpg --fingerprint …` ou o bloco “Impressão digital” nas listagens). Você vai usá-lo nos próximos comandos — não confunda só com o ID curto que aparece em algumas linhas de log.

* * *

**▶️ EXERCÍCIO 1.1:** Anote o fingerprint da sua chave em um arquivo texto. Salve como `fingerprint.txt`. Você vai precisar dele nos próximos exercícios.

* * *

#### ▸ COMANDO 1.2: Listando suas chaves

**O que faz:** Mostra todas as chaves que você tem.

**Digite agora:**

```sh
gpg --list-keys --keyid-format long
```

**Saída esperada (parecido com):**

```
pub   ed25519/3A4B5C6D7E8F9A0B 2026-04-30 [C] [expires: 2027-04-30]
      Impressão digital = 3A4B 5C6D 7E8F 9A0B 1C2D 3E4F 5A6B 7C8D 9E0F
uid                 [ultimate] Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>
sub   cv25519/7E8F9A0B1C2D3E4F 2026-04-30 [E] [expires: 2027-04-30]
```

> 💡 O campo `[ultimate]` é a marca de **confiança absoluta** na sua própria chave (traduções ou locales podem mudar o texto — não confunda com a palavra “ultimamente”).

**O que significa:**

*   `pub` = chave pública (mestra)
*   `[C]` = capacidade Certify (correto — é a mestra)
*   `uid` = seu nome e email
*   `sub` = subchave (já veio automática)
*   `[E]` = capacidade Encrypt (cifração)

> ⚠️ **Perceba:** A subchave \[E\] já veio automaticamente. Mas ainda faltam \[S\] (Assinatura) e \[A\] (Autenticação SSH).

* * *

#### ▸ COMANDO 1.3: Vendo o fingerprint (sua identidade digital)

**O que faz:** Mostra o fingerprint de forma mais legível.

**Digite agora:**

```sh
gpg --fingerprint "aluno.training@openpgp-lab.local"
```

**Saída esperada:**

```
pub   ed25519 2026-04-30 [C] [expires: 2027-04-30]
      Impressão digital = 3A4B 5C6D 7E8F 9A0B 1C2D 3E4F 5A6B 7C8D 9E0F
uid           Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>
```

> 🔴 **Essa sequência de letras e números é sua identidade digital.** Para verificar que uma chave é realmente sua, você compara esse código com outra pessoa por telefone, WhatsApp ou outro canal seguro.

* * *

#### ▸ COMANDO 1.4: Adicionando as subchaves que faltam (\[S\] e \[A\])

**Primeiro, vamos guardar o fingerprint em uma variável (para não ter que digitar o tempo todo):**

```sh
FP="3A4B5C6D7E8F9A0B1C2D3E4F5A6B7C8D9E0F1A2B"
```

> ⚠️ **Substitua pelo seu fingerprint!** Use o que você anotou no exercício 1.1.

* * *

**Agora, adicione a subchave de ASSINATURA \[S\]:**

```sh
gpg --quick-add-key "$FP" ed25519 sign 1y
```

**O que significa:**

*   `--quick-add-key` → comando para adicionar subchave
*   `ed25519` → algoritmo (moderno, seguro)
*   `sign` → capacidade (Assinatura)
*   `1y` = válida por 1 ano

**Saída esperada:**

```
gpg: A chave em processo de adição
gpg: A chave foi efetivamente criada
```

* * *

**Adicione a subchave de AUTENTICAÇÃO SSH \[A\]:**

```sh
gpg --quick-add-key "$FP" ed25519 auth 1y
```

* * *

**Verifique o resultado:**

```sh
gpg -K --with-subkey-fingerprints --keyid-format long
```

**Agora você tem o modelo completo:**

```
sec   ed25519/AAAAAAAA... [C]  ← Chave Mestra (fica offline)
ssb   ed25519/BBBBBBBB... [S]  ← Assinatura (commits, arquivos)
ssb   cv25519/CCCCCCCC... [E]  ← Cifração (cv25519, não ed25519!)
ssb   ed25519/DDDDDDDD... [A]  ← Autenticação (SSH)
```

> 🔴 **ERRO COMUM:** Alguns tutoriais usam `ed25519` para a subchave \[E\]. Funciona, mas o correto é `cv25519`. Por quê? `cv25519` é otimizada para troca de chaves (ECDH). `ed25519` é otimizada para assinaturas (EdDSA). Usar cada curva para seu propósito é a prática correta.

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `No secret key` | O fingerprint está errado. Verifique com `gpg --list-keys` |
| `cv25519 não encontrado` | GPG muito antigo. Atualize: `sudo apt install --reinstall gnupg2` |
| `ed25519 sign 1y` falhou | Confirme que o fingerprint está correto |

* * *

**▶️ EXERCÍCIO 1.2:** Rode `gpg -K` e identifique qual é a subchave \[E\] (dica: é a única com `cv25519`).

* * *

#### 🚀 BÔNUS: Script de geração automática de chaves

> _Depois de repetir os passos manualmente, você pode usar este script para recriar o mesmo modelo de chave em outro laboratório._

```sh
#!/bin/bash
# create-gpg-key.sh - Cria chave mestra + subchaves automaticamente

NOME="Aluno Lab"
EMAIL="aluno.training@openpgp-lab.local"
COMENTARIO="TRAINING 2026"

echo "🔐 Criando chave GPG..."
echo "Nome: $NOME"
echo "Email: $EMAIL"

gpg --quick-generate-key "$NOME ($COMENTARIO) <$EMAIL>" ed25519 cert 3y

FP=$(gpg --list-secret-keys --with-colons "$EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')

echo "✅ Fingerprint: $FP"

gpg --quick-add-key "$FP" ed25519 sign 1y
gpg --quick-add-key "$FP" cv25519 encr 1y
gpg --quick-add-key "$FP" ed25519 auth 1y

echo "✅ Subchaves criadas com sucesso!"
echo "💰 Não se esqueça: gere o certificado de revogação!"
```

> 📎 Nos listings `--with-colons`, a **fingerprint completa** da mestra está na linha `fpr:` (**campo 10**). Os scripts deste curso passam **e-mail ou UID** para `gpg --list-secret-keys --with-colons …` antes do `awk`, assim o `fpr` corresponde à identidade certa mesmo com **várias** mestras no chaveiro. O **campo 5** de `sec:` é só o **KeyID longo**; use `fpr` ao cruzar com papel, WKD ou GitHub.

* * *

### 📋 MÓDULO 2: CIFRANDO E DECIFRANDO

> 🎯 **Objetivo:** Cifrar, decifrar, assinar e verificar arquivos

> ⏱️ **Tempo estimado:** 45 minutos

* * *

#### ▸ COMANDO 2.1: Criando um arquivo de teste

**O que faz:** Cria um arquivo com uma "mensagem secreta".

**Digite agora:**

```sh
echo "Minha senha secreta é 123456" > segredo.txt
```

**O que significa:** `echo` escreve o texto. `>` redireciona para um arquivo (cria ou sobrescreve).

**Verifique se o arquivo foi criado:**

```sh
cat segredo.txt
```

**Saída esperada:**

```
Minha senha secreta é 123456
```

* * *

#### ▸ COMANDO 2.2: Cifrando o arquivo

**O que faz:** Transforma o arquivo em algo ilegível para quem não tem sua chave.

**Digite agora:**

```sh
gpg --encrypt --recipient "aluno.training@openpgp-lab.local" segredo.txt
```

**Saída esperada:**

```
gpg: cifrado com chave de 256 bits, ID BBBBBBBBBBBBBBBB, criada em 2026-04-30
      para "Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>"
```

**O que aconteceu:** Foi criado um arquivo `segredo.txt.gpg`.

**Veja como ele está (vai parecer lixo):**

```sh
cat segredo.txt.gpg
```

**Saída esperada (lixo ilegível):**

```
�^�C� �gpg-cipher$��$�?��}��/��f�����FZ�...
```

> 🔐 **Isso é segurança!** Sem sua chave privada, ninguém consegue ler.

* * *

#### ▸ COMANDO 2.3: Decifrando o arquivo

**O que faz:** Recupera o texto original usando sua chave privada.

**Digite agora:**

```sh
gpg --decrypt segredo.txt.gpg
```

> ⚠️ **Vai pedir sua senha** (a passphrase que você criou para a chave).

**Saída esperada:**

```
gpg: cifrado com chave de 256 bits, ID BBBBBBBBBBBBBBBB, criada em 2026-04-30
Minha senha secreta é 123456
```

> ✅ **Pronto! Você decifrou a mensagem.**

* * *

**Para salvar o resultado em um arquivo:**

```sh
gpg --decrypt segredo.txt.gpg > segredo-recriado.txt
```

**Compare com o original:**

```sh
diff segredo.txt segredo-recriado.txt
```

**Saída esperada:** (nenhuma — significa que são idênticos)

* * *

#### Diagrama do Fluxo de Cifragem

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Seu arquivo│────▶│ Cifrar com  │────▶│ Arquivo     │
│  segredo.   │     │ chave 🔓    │     │ segredo.    │
│  txt        │     │ PÚBLICA     │     │ txt.gpg     │
└─────────────┘     └─────────────┘     └─────────────┘
                     (🔓 PÚBLICA)
                           │
                           ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Você       │────▶│ Decifra com │────▶│ segredo.    │
│  recebe     │     │ chave 🔒    │     │ txt         │
│  .gpg       │     │ PRIVADA sua │     │ (original)  │
└─────────────┘     └─────────────┘     └─────────────┘
```

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `No secret key` | Você cifrou para outro destinatário ou não tem a chave privada |
| `Bad passphrase` | Senha errada. Tente novamente (caps lock?) |
| `Decryption failed` | Arquivo corrompido ou não foi cifrado para você |

* * *

**▶️ EXERCÍCIO 2.1:** Crie outro arquivo (ex: `novo.txt`), cifre, decifre e confirme que o conteúdo está correto.

* * *

#### ▸ COMANDO 2.4: Assinando um arquivo

**O que faz:** Cria uma assinatura digital que prova que VOCÊ criou o arquivo.

**Digite agora:**

```sh
echo "Eu, Aluno Lab, concluí o Módulo 2" > declaracao.txt
```

**Agora crie uma assinatura separada (detached signature):**

```sh
gpg --detach-sign --armor declaracao.txt
```

**O que significa:**

*   `--detach-sign` → cria assinatura separada
*   `--armor` → usa formato texto (para enviar por email)

**Saída esperada:**

```
gpg: usando subchave "BBBBBBBBBBBBBBBB" para assinar
gpg: Assinatura criada em 2026-04-30
```

**Foi criado o arquivo** `declaracao.txt.asc`. É sua assinatura digital.

* * *

#### ▸ COMANDO 2.5: Verificando a assinatura

**O que faz:** Confirma que o arquivo foi assinado por você e não foi alterado.

**Digite agora:**

```sh
gpg --verify declaracao.txt.asc declaracao.txt
```

**Saída esperada:**

```
gpg: Assinatura feita em ... usando chave ed25519, ID BBBBBBBBBBBBBBBB
gpg: Assinatura correta de "Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>"
```

> ✅ **Good signature** = tudo certo.

* * *

#### Diagrama do Fluxo de Assinatura

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  documento. │────▶│ Assinar com │────▶│ documento.  │
│  txt        │     │ subchave [S]│     │ txt.asc     │
└─────────────┘     └─────────────┘     └─────────────┘
                           │
                           ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│ Verificador │────▶│ Verifica com│────▶│ "Good       │
│ tem documento│     │ sua chave   │     │ signature"  │
│ .txt e .asc │     │ pública     │     │             │
└─────────────┘     └─────────────┘     └─────────────┘
```

* * *

#### ▸ Testando o que acontece se o arquivo for adulterado

**O que faz:** Mostra o poder da assinatura digital — detecta alterações.

**Vamos alterar o arquivo:**

```sh
echo "Texto alterado!" >> declaracao.txt
```

**Agora verifique novamente:**

```sh
gpg --verify declaracao.txt.asc declaracao.txt
```

**Saída esperada:**

```
gpg: Assinatura feita em ... usando chave ed25519, ID BBBBBBBBBBBBBBBB
gpg: BAD signature from "Aluno Lab (TRAINING 2026) <aluno.training@openpgp-lab.local>"
```

> 🔴 **BAD signature** = o arquivo foi alterado após a assinatura!

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `Can't check signature: No public key` | Você não tem a chave pública de quem assinou |
| `BAD signature` | O arquivo foi alterado (ou a chave está errada) |

* * *

**▶️ EXERCÍCIO 2.2:** Assine um arquivo, verifique a assinatura, altere uma letra e verifique novamente. Veja a diferença.

* * *

#### 🚀 BÔNUS: Script de backup diário

> _Agora que você já sabe cifrar e assinar manualmente, aqui está um script que automatiza o backup das suas subchaves._

> 📌 A progressão didática completa 🔴→🟡→🟢 e o script **com log + retenção** estão no **Módulo 3 → COMANDO 3.2**. Use este bloco como atalho rápido ou revise lá para produção.

```sh
#!/bin/bash
# backup-subkeys.sh - Backup diário das subchaves

BACKUP_DIR="$HOME/gpg-backups"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
mkdir -p "$BACKUP_DIR"

LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')

if [ -z "$FP" ]; then
    echo "❌ Nenhuma chave encontrada!"
    exit 1
fi

gpg --export-secret-subkeys --armor "$FP" > "$BACKUP_DIR/subkeys.asc"
age --passphrase --output "$BACKUP_DIR/subkeys-${TIMESTAMP}.age" "$BACKUP_DIR/subkeys.asc"
shred -u "$BACKUP_DIR/subkeys.asc"

echo "✓ Backup: $BACKUP_DIR/subkeys-${TIMESTAMP}.age"
```

* * *

## 🏁 CHECKPOINT 1: CIFRE, ASSINE E DECIFRE

**Desafio:** Execute todo o fluxo do Módulo 2 com um arquivo diferente.

1.  Crie um arquivo `meu-teste.txt` com qualquer conteúdo
2.  Cifre para você mesmo
3.  Decifre e confirme
4.  Assine o arquivo
5.  Verifique a assinatura
6.  Altere o arquivo
7.  Verifique novamente (deve dar BAD signature)

#### Rubrica de aprovação do Checkpoint 1

| Critério | Evidência mínima | Status |
| --- | --- | --- |
| Chave funcional | `gpg -K` mostra `[C]`, `[S]`, `[E]`, `[A]` | [ ] |
| Cifragem | Arquivo `.gpg` criado com sucesso | [ ] |
| Decifragem | Conteúdo original recuperado sem erro | [ ] |
| Assinatura | `.sig` ou clearsign gerado sem erro | [ ] |
| Verificação | Assinatura válida no arquivo íntegro | [ ] |
| Integridade | Após alterar arquivo, retorna BAD signature | [ ] |

> ✅ **Aprovado:** todos os itens marcados. Se faltar 1 item, repita o fluxo antes de avançar.

**✅ Checkpoint 1 aprovado!** Continue para a Parte 2.

* * *

## 🟡 3. PARTE 2: FAZENDO CERTO (Semana 2)

> ⏱️ **Tempo estimado:** 3-4 horas
>
> 🎯 **Objetivo:** Aprender a fazer backup, revogar chaves e integrar com Git

* * *

### 📋 MÓDULO 3: BACKUP E REVOGAÇÃO

> 🎯 **Objetivo:** Proteger suas chaves contra perda e roubo

> ⏱️ **Tempo estimado:** 60 minutos

* * *

#### ▸ COMANDO 3.1: Gerando o certificado de revogação (FAÇA AGORA!)

**O que faz:** Cria um arquivo que pode invalidar sua chave publicamente se ela for comprometida.

> 🔴 **ESTE É UM DOS COMANDOS MAIS IMPORTANTES DO CURSO**

**Digite agora:**

```sh
gpg --output revogacao-mestra-$(date +%Y%m%d).asc --gen-revoke "$FP"
```

**O GPG vai perguntar:**

```
Crie um certificado de revogação para esta chave? (s/N) s
```

**Digite** `s`

```
Motivo da revogação:
  0 = Não comprometida (aposentar a chave)
  1 = Comprometida (emergência - hackeada)
  2 = Substituída (rotina normal)

Por favor, selecione o motivo (0, 1, 2):
```

**Para laboratório, escolha** `2` **(substituída)**.

```
Confirme que deseja criar este certificado? (s/N) s
```

**Saída esperada:**

```
Revocation certificate created.
```

**Agora guarde em um local seguro:**

```sh
mkdir -p ~/secure-backup/offline
cp revogacao-*.asc ~/secure-backup/offline/
chmod 400 ~/secure-backup/offline/revogacao-*.asc
```

> 🔴 **ALERTA:** Este arquivo NÃO tem senha. Quem tiver ele pode revogar sua chave. Guarde como guardaria sua certidão de nascimento.

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `No secret key` | `$FP` não definido ou não é a mestra certa. Rode `gpg -K` e exporte `FP` com o fingerprint completo da linha `sec`. |
| `Cannot create` | O diretório pode não existir. Crie com `mkdir -p ~/secure-backup/offline` |

* * *

**▶️ EXERCÍCIO 3.1:** Liste o conteúdo do diretório `~/secure-backup/offline` com `ls -la`. Você deve ver o arquivo de revogação.

* * *

#### ▸ COMANDO 3.2: Backup das subchaves (aprendendo com evolução)

> _Vamos começar com uma abordagem bem simples. Percebeu o problema? Ela pode pegar a chave errada se você tiver múltiplas chaves. Vamos melhorar._

**🔴 Abordagem simples (tem problema!):**

```sh
gpg --export-secret-subkeys --armor > subchaves.asc
```

**Percebeu o problema?** Sem dizer **qual** chave (`"$FP"` ou outro seletor suportado pelo `gpg`), o comando concatena no arquivo **todas** as subchaves secretas exportáveis de **todas** as identidades no chaveiro padrão — backup ambíguo (mistura várias mestras no mesmo `.asc`), maior que o necessário e difícil de auditar. Com uma única chave de laboratório até “passa”; na vida real **sempre** restrinja pelo fingerprint.

* * *

**🟡 Abordagem com fingerprint (melhor):**

```sh
LAB_EMAIL="aluno.training@openpgp-lab.local"
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')
gpg --export-secret-subkeys --armor "$FP" > subchaves.asc
```

* * *

**🟢 Abordagem completa (recomendada):**

```sh
#!/bin/bash
# backup-subkeys-completo.sh — backup cifrado de subchaves (abordagem 🟢)

set -euo pipefail

BACKUP_DIR="$HOME/gpg-backups"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
mkdir -p "$BACKUP_DIR"

LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')

if [ -z "$FP" ]; then
    echo "❌ ERRO: Nenhuma chave secreta encontrada!"
    exit 1
fi

echo "✅ Fingerprint: $FP"

gpg --export-secret-subkeys --armor "$FP" > "$BACKUP_DIR/subkeys.asc"
age --passphrase --output "$BACKUP_DIR/subkeys-${TIMESTAMP}.age" "$BACKUP_DIR/subkeys.asc"
shred -u "$BACKUP_DIR/subkeys.asc"

find "$BACKUP_DIR" -name "*.age" -mtime +30 -delete

echo "✓ Backup: $BACKUP_DIR/subkeys-${TIMESTAMP}.age"
```

> ⚠️ Nos passos seguintes, **`subchaves.age`** é só nome de exemplo. Use o caminho real do arquivo `.age` gerado aqui (ex.: `$BACKUP_DIR/subkeys-<TIMESTAMP>.age`), ou renomeie cópia de laboratório para `subchaves.age` para bater com os comandos tal como estão escritos.

* * *

#### ▸ COMANDO 3.3: Teste de restauração (OBRIGATÓRIO!)

```sh
# 🔴 SIMULE PERDA TOTAL (só no laboratório!)
cp -r ~/.gnupg ~/.gnupg.backup
rm -rf ~/.gnupg ~/.cache/gpg*

# 🟢 RECUPERE das subchaves
age --decrypt --output subchaves.asc subchaves.age
gpg --import subchaves.asc

# 🟢 TESTE se funciona
echo "recuperei" | gpg --clearsign > /dev/null 2>&1 && echo "✓ Restauração OK" || echo "✗ Falha"
```

> 🔴 **SE FALHOU:** Seu backup é inútil. Refaça. Teste novamente. Repita até funcionar.

* * *

#### ▸ COMANDO 3.4: Simulação de perda total (cenário guiado)

**Objetivo:** Treinar recuperação real em caso de roubo, perda do notebook ou corrupção total.

| Cenário | O que você perdeu | O que deve recuperar primeiro |
| --- | --- | --- |
| A | Apenas subchaves do PC diário | Importar backup de subchaves e testar assinatura |
| B | PC completo, backup intacto | Restaurar ambiente + importar subchaves + validar Git |
| C | Subchaves + passphrase esquecida | Revogar chave e iniciar novo ciclo de identidade |
| D | Exposição suspeita de chave | Revogar imediatamente e publicar nova chave |

**Teste rápido (laboratório):**

```sh
# 1) simula perda do ambiente
mv ~/.gnupg ~/.gnupg.perdido.$(date +%s)

# 2) recria base mínima
mkdir -p ~/.gnupg && chmod 700 ~/.gnupg

# 3) restaura do backup cifrado
age --decrypt --output subchaves.asc subchaves.age
gpg --import subchaves.asc
shred -u subchaves.asc

# 4) valida operação real
echo "teste-pos-desastre" | gpg --clearsign > /tmp/recovery-test.asc
gpg --verify /tmp/recovery-test.asc
```

> ✅ **Critério de sucesso:** você volta a assinar e verificar com confiança no mesmo ambiente restaurado.

* * *

#### ▸ COMANDO 3.5: Revogar apenas subchave comprometida (sem matar a identidade inteira)

**Quando usar:** se só a subchave `[A]`, `[S]` ou `[E]` vazar/for perdida, mas a mestra continua segura.

```sh
# 1) abre edição da chave principal
gpg --edit-key "$FP"

# 2) dentro do prompt do gpg:
#    list             -> veja as subchaves
#    key N            -> selecione a subchave comprometida (N = índice)
#    revkey           -> revoga só a subchave selecionada
#    save             -> salva alterações
```

**Após revogar a subchave:**

```sh
# gere uma nova subchave para o papel comprometido
gpg --quick-add-key "$FP" ed25519 sign 1y   # exemplo para [S]
# ou: cv25519 encr 1y para [E]
# ou: ed25519 auth 1y para [A]
```

> 🔴 **Princípio expert:** revogue apenas o componente comprometido para preservar continuidade operacional.

**Template breve para avisar contatos (e-mail/mensagem) após revogação publicada**

Adapte o motivo (`comprometimento`, `perda`, `rotação planejada`) e substitua os placeholders. Envie **depois** de ter importado/publicado a revogação e validado assinatura/cifragem com a chave atual.

```
Assunto: [URGENTE] Atualização da minha chave OpenPGP

Prezados,

Informo que minha chave OpenPGP com fingerprint:
FPR_ANTIGA

foi REVOGADA em DATA por motivo de [comprometimento/perda/rotação].

Minha chave atual (ou substituta) tem fingerprint:
FPR_ATUAL

Por favor:
1. Deixem de usar material criptográfico associado à chave antiga
2. Atualizem a chave no chaveiro (ex.: recv/WKD conforme seu fluxo)
3. Confirmem o fingerprint por um canal independente do e-mail

Atenciosamente,
Seu Nome
```

* * *

### 📋 MÓDULO 4: GIT + GPG

> 🎯 **Objetivo:** Assinar commits e tags no Git

> ⏱️ **Tempo estimado:** 30 minutos

* * *

#### ▸ COMANDO 4.1: Configurando o Git

**Encontre o fingerprint da subchave \[S\] (Assinatura):**

```sh
# Colon listing: primeira subchave com capacidade de assinatura (:s:) e a respectiva linha fpr:
FP_SIGN=$(gpg --list-keys --with-colons "$FP" | awk -F: '/^sub:/ { want = ($0 ~ /:s:/) } /^fpr:/ && want { print $10; exit }')
echo "✅ Fingerprint da subchave [S]: $FP_SIGN"
```

**Configure o Git:**

```sh
git config --global user.signingkey "$FP_SIGN"
git config --global commit.gpgsign true
git config --global gpg.program $(which gpg)
git config --global user.name "Aluno Lab"
git config --global user.email "aluno.training@openpgp-lab.local"
```

> 💡 Se `FP_SIGN` vier **vazio**, confira `gpg --list-keys --with-colons "$FP"` (deve haver `sub:` com `:s:` e logo a seguir `fpr:`), ou rode `gpg -K --with-subkey-fingerprints --keyid-format long`, localize **`[S]`** e copie o fingerprint manualmente para `git config --global user.signingkey "..."`.

* * *

#### ▸ COMANDO 4.2: Primeiro commit assinado

```sh
mkdir test-gpg-git && cd test-gpg-git
git init
echo "# Teste" > README.md
git add .
git commit -S -m "Primeiro commit assinado com GPG"
```

* * *

#### ▸ COMANDO 4.3: Verificando a assinatura

```sh
git log --show-signature -1
```

**Saída esperada:**

```
gpg: Assinatura correta de "Aluno Lab (TRAINING 2026)..."
```

* * *

**▶️ EXERCÍCIO 4.1:** Exporte sua chave pública (ex.: `gpg --armor --export "$FP"` ou `gpg --armor --export aluno.training@openpgp-lab.local`), adicione em **SSH and GPG keys** no GitHub, faça `git push` e confira o selo **Verified** no commit.

* * *

#### 🧯 Troubleshooting avançado (Git + GPG)

| Sintoma | Diagnóstico rápido | Correção |
| --- | --- | --- |
| `gpg failed to sign the data` | `gpg --clearsign` falha também | Reinicie agente: `gpgconf --kill gpg-agent && gpgconf --launch gpg-agent` |
| Commit sem assinatura | `git config --global --get commit.gpgsign` retorna vazio/false | `git config --global commit.gpgsign true` |
| Chave errada no commit | `git config --global --get user.signingkey` divergente | Ajuste para fingerprint da subchave `[S]` |
| Pinentry não abre | `echo $GPG_TTY` vazio | `export GPG_TTY=$(tty)` e tente novamente |
| Git usa GPG errado | `git config --global --get gpg.program` inconsistente | `git config --global gpg.program $(which gpg)` |

**Checklist de validação final:**

```sh
git config --global --get user.signingkey
git config --global --get commit.gpgsign
git config --global --get gpg.program
git log --show-signature -1
```

* * *

#### 🏢 Política recomendada para times (produção)

- Todo commit em branch protegida deve ser assinado.
- Toda tag de release deve ser assinada.
- Pull Request sem assinatura válida não deve ser aprovado.
- Chaves expiradas devem bloquear release até rotação.

* * *

## 🏁 CHECKPOINT 2: COMMIT ASSINADO NO GITHUB

**Desafio:** Configure o Git para assinar seus commits e faça um push para o GitHub.

#### Rubrica de aprovação do Checkpoint 2

| Critério | Evidência mínima | Status |
| --- | --- | --- |
| Chave pública publicada | Chave adicionada em conta GitHub/GitLab | [ ] |
| Commit assinado localmente | `git log --show-signature -1` válido | [ ] |
| Assinatura remota validada | Selo `Verified` na plataforma | [ ] |
| Tag assinada | `git tag -s` criada e verificada | [ ] |
| Reprodutibilidade | Novo commit assina sem ajustes extras | [ ] |

> ✅ **Aprovado:** todos os critérios marcados.

**✅ Checkpoint 2 aprovado!**

* * *

## 🔴 4. PARTE 3: SEGURANÇA AVANÇADA (Semana 3)

> ⏱️ **Tempo estimado:** 4-5 horas

* * *

### 📋 MÓDULO 5: SSH VIA GPG

> 🎯 **Objetivo:** Substituir suas chaves SSH tradicionais pela subchave \[A\] do GPG

> ⏱️ **Tempo estimado:** 45 minutos

* * *

#### Por que usar GPG para SSH?

```
SSH tradicional:
├─ Arquivo ~/.ssh/id_ed25519 (chave privada)
├─ Outro ~/.ssh/id_ed25519.pub (chave pública)
└─ Se perder o arquivo, perde o acesso

SSH via GPG:
├─ Usa a subchave [A] (Autenticação) do seu GPG
├─ Protegida pela mesma senha do GPG
├─ Gerenciada pelo gpg-agent
└─ Se revogar [A], perde acesso SSH (e só isso)
```

**Trade-offs:**

| Vantagem | Desvantagem |
| --- | --- |
| Uma identidade para PGP e SSH | Mais lento que ssh-agent puro |
| Revogar \[A\] remove acesso SSH | Mais pontos de falha |
| Centralizado | Ideal para 1-5 servidores |

* * *

#### Matriz de decisão: GPG-SSH vs ssh-agent vs SSH CA

| Cenário | Melhor opção | Motivo |
| --- | --- | --- |
| Uso pessoal ou até 5 servidores | GPG-SSH | Uma identidade única e fácil de revogar |
| Ambiente simples e alta performance | `ssh-agent` | Menos componentes e menor atrito |
| Empresa com muitos servidores/equipes | SSH CA | Escala, auditoria e governança central |

> 🔎 Regra prática: GPG-SSH brilha quando seu ecossistema GPG já está maduro; para grande escala, SSH CA costuma ser superior.

* * *

#### ▸ COMANDO 5.1: Encontrando o keygrip da subchave \[A\]

**O que faz:** O keygrip é o identificador interno que o GPG usa para referenciar sua subchave.

**Digite agora:**

```sh
gpg -K --with-keygrip "$FP" | grep -A2 "\[A\]"
```

**Saída esperada:**

```
ssb   ed25519 2026-04-30 [A] [expires: 2027-04-30]
      Keygrip = 4E8C7F9A2B3C5D1E6F8A9B0C1D2E3F4A5B6C7D8E
```

> ✅ **Anote esse keygrip!** Você vai precisar dele.

* * *

#### ▸ COMANDO 5.2: Adicionando o keygrip ao sshcontrol

**O que faz:** O arquivo `~/.gnupg/sshcontrol` lista quais chaves o gpg-agent deve expor como chaves SSH.

```sh
KEYGRIP_AUTH="4E8C7F9A2B3C5D1E6F8A9B0C1D2E3F4A5B6C7D8E"
echo "$KEYGRIP_AUTH" >> ~/.gnupg/sshcontrol
```

**Verifique se foi adicionado:**

```sh
cat ~/.gnupg/sshcontrol
```

* * *

#### ▸ COMANDO 5.3: Configurando o gpg-agent para SSH

**O que faz:** Ativa o suporte a SSH no gpg-agent e configura o ambiente.

```sh
# Habilita suporte SSH no gpg-agent
echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf

# Reinicia o agente
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Configura a variável de ambiente SSH_AUTH_SOCK
echo 'export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)' >> ~/.bashrc
source ~/.bashrc
```

**Verifique se o socket foi criado:**

```sh
ls -la ~/.gnupg/S.gpg-agent.ssh
```

**Saída esperada:**

```
srw------- 1 aluno aluno 0 May 2 10:00 /home/aluno/.gnupg/S.gpg-agent.ssh
```

> 💡 No **Módulo 0** você já pode ter `enable-ssh-support` em `~/.gnupg/gpg-agent.conf`. Antes de acrescentar de novo, confira com `grep enable-ssh-support ~/.gnupg/gpg-agent.conf` para não duplicar linhas sem necessidade.

* * *

#### ▸ COMANDO 5.4: Exportando a chave pública SSH

**O que faz:** Gera a chave pública no formato SSH (para colocar no servidor).

```sh
gpg --export-ssh-key "$FP" > gpg-ssh-key.pub
cat gpg-ssh-key.pub
```

**Saída esperada:**

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... openpgp:0xDDDDDDDD
```

> 🔑 **Esta é sua chave pública SSH.** Copie o conteúdo.

* * *

#### ▸ COMANDO 5.5: Adicionando ao servidor remoto

**No servidor remoto (ou local para teste):**

```sh
# Adicione a chave ao authorized_keys
cat gpg-ssh-key.pub >> ~/.ssh/authorized_keys
```

* * *

#### ▸ COMANDO 5.6: Testando a conexão

```sh
# Verifica se o agente reconhece sua chave
ssh-add -L
```

**Saída esperada:** Deve listar a chave pública que você exportou.

```sh
# Teste com GitHub
ssh -T git@github.com
```

**Saída esperada:**

```
Hi AlunoLab! You've successfully authenticated...
```

```sh
# Teste com localhost (opcional — exige servidor SSH ouvindo na máquina)
ssh localhost echo "Conectado via GPG!"
```

**Saída esperada (se `openssh-server` estiver instalado e ativo):**

```
Conectado via GPG!
```

> ⚠️ Em muitas VMs Ubuntu **minimal** não há `sshd`. Se `ssh localhost` falhar, não desanime: o teste que importa neste curso costuma ser **`ssh -T git@github.com`** (ou um servidor onde você já instalou `gpg-ssh-key.pub`).

* * *

**❌ O QUE FAZER SE DER ERRO:**

| Problema | Solução |
| --- | --- |
| `ssh-add -L` mostra vazio | O keygrip não está no sshcontrol. Verifique `cat ~/.gnupg/sshcontrol` |
| `ssh-add -L` não encontra comando | Instale o OpenSSH client: `sudo apt install openssh-client` |
| `Agent refused operation` | Reinicie o agente: `gpgconf --kill gpg-agent && gpgconf --launch gpg-agent` |
| `Permission denied (publickey)` | A chave pública não está no `authorized_keys` do servidor |

* * *

#### 🚀 BÔNUS: Script de configuração SSH completo

```sh
#!/bin/bash
# setup-ssh-gpg.sh - Configura SSH via GPG automaticamente

set -euo pipefail

LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"

echo "🔐 Configurando SSH via GPG..."

# Keygrip da primeira subchave secreta com autenticação (:a:) — listagem colon (estável entre locales)
KEYGRIP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '
/^ssb:/ { want = ($0 ~ /:a:/) }
/^grp:/ && want {
  for (i = 1; i <= NF; i++)
    if ($i ~ /^[0-9A-Fa-f]{40}$/) { print $i; exit }
}')

if [ -z "$KEYGRIP" ]; then
    echo "❌ Subchave [A] não encontrada!"
    exit 1
fi

echo "✅ Keygrip encontrado: $KEYGRIP"

# Adiciona ao sshcontrol
echo "$KEYGRIP" >> ~/.gnupg/sshcontrol

# Habilita SSH no gpg-agent
if ! grep -q "enable-ssh-support" ~/.gnupg/gpg-agent.conf 2>/dev/null; then
    echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
fi

# Reinicia o agente
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Configura SSH_AUTH_SOCK
if ! grep -q "SSH_AUTH_SOCK" ~/.bashrc; then
    echo 'export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)' >> ~/.bashrc
fi

source ~/.bashrc

# Exporta chave pública SSH (usa o mesmo LAB_EMAIL do início do script)
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')
gpg --export-ssh-key "$FP" > gpg-ssh-key.pub
echo "✅ Chave SSH exportada para gpg-ssh-key.pub"

echo "🧩 SSH via GPG configurado com sucesso!"
echo "💻 Adicione o conteúdo de gpg-ssh-key.pub ao ~/.ssh/authorized_keys do servidor"
```

* * *

### 📋 MÓDULO 6: TAILS E CHAVE MESTRA OFFLINE

> 🎯 **Objetivo:** Criar a chave mestra em um ambiente isolado (air-gapped)

> ⏱️ **Tempo estimado:** 60 minutos

* * *

#### Por que Tails? (A segurança que você precisa)

**Pergunta:** _"Professor, por que tanta dificuldade? Não posso criar a chave mestra no meu computador normal?"_

**Resposta:** Imagine que sua chave mestra é sua **certidão de nascimento digital**. Você não anda com ela no bolso. Você guarda em um cofre. Tails é esse cofre.

**O que é Tails?**

*   Sistema operacional que roda de um pendrive
*   Não guarda nada no computador (amnéstico)
*   Não toca a internet (você vai desconectar)
*   Já vem com GPG pré-instalado

**Características do Tails:**

*   Amnéstico → não deixa rastros
*   Roda de pendrive → não depende do HD
*   GPG pré-instalado → pronto para uso
*   Tor integrado → opcional para anonimato

* * *

#### Matriz de cenários Tails (2026 — escolha consciente)

| Situação | Internet durante a sessão sensível | Persistência no Tails | Onde guardar mestra / exports | Recomendação prática |
| --- | --- | --- | --- | --- |
| **Laboratório (este curso)** | Desligada ao gerar/exportar segredos | Opcional — só para não perder exports entre reboots | Pendrive ou pasta da VM **sem misturar com produção** | OK usar persistência **apenas** para exercício com identidade fictícia |
| **Identidade real (produção)** | **Desligada** (Wi‑Fi, cabo, tethering) | Evite deixar mestra “morando” na persistência por meses | Gere offline → copie **na hora** para **segundo pendrive LUKS** ou mídia física exclusiva | Preferível: **sessão amnésica + cópia imediata offline**, depois desligar |
| **Baixar/gravar ISO** | Normalmente **no host** (ex.: Ubuntu da VM), não no ambiente onde você opera a mestra | — | ISO + `.sig` verificados antes do `dd` | Baixar e verificar assinatura da ISO **fora** do fluxo offline da mestra reduz erro operacional |
| **Levar material ao PC online** | — | — | Só pacotes com **subchaves** `[S][E][A]` (ou `.age`); **nunca** enviar `master-key.asc` por rede/cloud | Segundo meio físico ou arquivo `age` com passphrase forte |

**Resumo em 30 s:** para **produção**, trate o Tails como **cozinha limpa**: entre, opera offline, exporta para **mídia dedicada**, sai — sem depender de persistência como “cofre permanente”. Para **lab**, persistência é conforto pedagógico, não modelo de vida útil da mestra.

* * *

#### ▸ COMANDO 6.1: Preparando o pendrive Tails (COM VERIFICAÇÃO)

> 🔴 **ATENÇÃO:** O comando `dd` é apelidado de "Disk Destroyer". A verificação abaixo é para sua segurança.

> 💡 **Como o Tails recomenda verificar:** na [página oficial de download](https://tails.net/install/download/index.en.html), a equipe prioriza verificação **no navegador** (assistida por JavaScript ou comparação manual com checksum). Isso é totalmente válido para uso real. Os passos **2–3** abaixo fazem uma verificação **OpenPGP na linha de comando** — boa para o laboratório e para exercitar o mesmo tipo de garantia que você já usa no curso.

```sh
# 1. Baixe a imagem ISO do Tails (ajuste o número se a página oficial tiver versão mais nova)
#    Página oficial: https://tails.net/install/download/index.en.html
wget https://download.tails.net/tails/stable/tails-amd64-7.7.1/tails-amd64-7.7.1.iso

# 2. Baixe a assinatura OpenPGP e a chave de assinatura oficial do projeto (uma vez por máquina de trabalho)
wget https://tails.net/torrents/files/tails-amd64-7.7.1.iso.sig
wget https://tails.net/tails-signing.key
gpg --import tails-signing.key

# 3. Verifique a ISO (esperado: "Good signature"; aviso de confiança na chave é comum no primeiro uso)
gpg --verify tails-amd64-7.7.1.iso.sig tails-amd64-7.7.1.iso

# 4. IDENTIFIQUE seu pendrive (PASSO CRÍTICO!)
lsblk -p | grep "disk"
# Saída exemplo:
# /dev/sda ... (seu HD principal – NUNCA TOQUE!)
# /dev/sdb ... (seu pendrive – é este)

# 5. CONFIRME DUAS VEZES (para não destruir o HD errado)
read -p "DIGITE O CAMINHO DO PENDRIVE (ex: /dev/sdb): " PENDRIVE
read -p "Você digitou $PENDRIVE. Tem certeza? (digite SIM): " CONFIRMA
if [ "$CONFIRMA" != "SIM" ]; then
    echo "Operação cancelada."
    exit 1
fi

# 6. Grave a ISO (com status de progresso)
sudo dd if=tails-amd64-7.7.1.iso of=$PENDRIVE bs=4M status=progress
sync

echo "✅ Pendrive Tails criado com sucesso!"
```

**Próximos passos após gravar:**

*   Reinicie o computador
*   Entre na BIOS/UEFI (F2, F12, Del, dependendo da máquina)
*   Escolha boot pelo pendrive
*   Configure persistência cifrada (mínimo 4GB)
*   Habilite: "Persistent Storage" e "GnuPG"

* * *

#### ▸ COMANDO 6.2: Criando a chave mestra no Tails (OFFLINE)

**⚠️ Dentro do Tails, sessão offline.** Nos exemplos abaixo aparece caminho `.../TailsData_unlocked/` — isso pressupõe **persistência montada** (comum no laboratório). Para identidade **real**, prefira **não depender** da persistência como arquivo permanente da mestra: exporte para **pendrive LUKS externo** e encerre a sessão (veja **Matriz de cenários Tails** acima).

```sh
# 🔴 PASSO CRÍTICO: DESCONECTE A INTERNET (fisicamente, se possível)
# A chave mestra NUNCA deve tocar a internet

# Gere a chave mestra (use seu nome real aqui — mantenha o mesmo texto em UID_MASTER)
UID_MASTER="Seu Nome Real (OFFLINE MASTER) <seu@email.com>"
gpg --quick-generate-key "$UID_MASTER" ed25519 cert 3y

# A saída mostrará algo como:
# gpg: key 3A4B5C6D7E8F9A0B marked as ultimately trusted

# Fingerprint da mestra (filtrado pelo mesmo UID que você acabou de criar)
FP_MASTER=$(gpg --list-secret-keys --with-colons "$UID_MASTER" | awk -F: '/^fpr:/ {print $10; exit}')
echo "Fingerprint da sua identidade mestra: $FP_MASTER"

# ANOTE EM PAPEL! Não no computador. O papel é offline.

# Gere o certificado de revogação
gpg --output "/live/persistence/TailsData_unlocked/revogacao.asc" --gen-revoke "$FP_MASTER"

# Exporte a chave mestra (para backup offline)
gpg --export-secret-keys --armor "$FP_MASTER" > "/live/persistence/TailsData_unlocked/master-key.asc"

# Exporte subchaves vazias (para importar no PC depois)
gpg --export-secret-subkeys --armor "$FP_MASTER" > "/live/persistence/TailsData_unlocked/subkeys-empty.asc"

# DESLIGUE o Tails
# A chave mestra NUNCA mais vai tocar a internet
```

* * *

#### 🔒 Hardening operacional do fluxo offline

**O que nunca fazer com a chave mestra:**

- Nunca copiar `master-key.asc` para nuvem, e-mail ou chat.
- Nunca abrir sessão de navegação com a mestra carregada.
- Nunca reutilizar passphrase da mestra em outros sistemas.
- Nunca manter a mestra no computador diário.

**Checklist mínimo após sessão Tails:**

```sh
# no ambiente Tails, antes de desligar
gpg -K --with-subkey-fingerprints --keyid-format long
ls -lh /live/persistence/TailsData_unlocked/
sync
```

> ✅ Confirme que você tem: certificado de revogação, backup da mestra e export de subchaves.

* * *

#### Diagrama do Ciclo Tails → Pendrive → PC

```
🔒 TAILS (OFFLINE)
   ├─ Gera chave mestra [C]
   ├─ Cria subchaves [S][E][A]
   ├─ Exporta APENAS a subchave necessária
   └─ NUNCA toca a internet

➡️ PENDRIVE (subchave.asc)
   └─ Transporta só a subchave, nunca a mestra

💻 COMPUTADOR NORMAL (ONLINE)
   ├─ Importa a subchave exportada
   ├─ [S] → Assinar commits, releases, arquivos
   ├─ [E] → Cifrar/decifrar mensagens e dados
   └─ [A] → Autenticar via SSH
```

* * *

#### ▸ COMANDO 6.3: Exportando subchaves no Tails (script automatizado)

```sh
#!/bin/bash
# gpg-export-subkeys.sh — Automatiza criação e exportação de subchaves GPG no Tails
# ⚠️ Execute SEM internet, com persistência montada e pendrive conectado.

set -euo pipefail

# Mesmo UID usado no --quick-generate-key da mestra no Tails (ajuste se for outro)
UID_MASTER="${UID_MASTER:-Seu Nome Real (OFFLINE MASTER) <seu@email.com>}"
FP_MASTER=$(gpg --list-secret-keys --with-colons "$UID_MASTER" | awk -F: '/^fpr:/ {print $10; exit}')
PENDRIVE="/media/pendrive"  # ajuste conforme o nome do seu pendrive

# === VERIFICAÇÕES ===
if [ -z "$FP_MASTER" ]; then
    echo "❌ Chave mestra não encontrada. Importe-a primeiro:"
    echo "gpg --import /live/persistence/TailsData_unlocked/master-key.asc"
    exit 1
fi

if [ ! -d "$PENDRIVE" ]; then
    echo "❌ Pendrive não montado em $PENDRIVE"
    exit 1
fi

echo "✅ Chave mestra e pendrive detectados."
echo "🔒 Criando subchaves separadas..."

# === SUBCHAVE [S] SIGN ===
echo "→ Criando subchave [S] (Sign)..."
gpg --quick-add-key "$FP_MASTER" ed25519 sign 1y
gpg --export-secret-subkeys --armor "$FP_MASTER" > "$PENDRIVE/sign.asc"
echo "✅ Subchave [S] exportada"

# === SUBCHAVE [E] ENCRYPT ===
echo "→ Criando subchave [E] (Encrypt)..."
gpg --quick-add-key "$FP_MASTER" cv25519 encr 1y
gpg --export-secret-subkeys --armor "$FP_MASTER" > "$PENDRIVE/encrypt.asc"
echo "✅ Subchave [E] exportada"

# === SUBCHAVE [A] AUTH ===
echo "→ Criando subchave [A] (Auth)..."
gpg --quick-add-key "$FP_MASTER" ed25519 auth 1y
gpg --export-secret-subkeys --armor "$FP_MASTER" > "$PENDRIVE/auth.asc"
echo "✅ Subchave [A] exportada"

# === VERIFICAÇÃO AUTOMÁTICA ===
echo "🔎 Verificando subchaves criadas..."
gpg -K --with-keygrip | grep -E "\[S\]|\[E\]|\[A\]" || {
    echo "❌ Alguma subchave não foi encontrada!"
    exit 1
}

echo "🧩 Todas as subchaves foram criadas e exportadas com sucesso!"
echo "💾 Arquivos gerados:"
ls -lh "$PENDRIVE"/*.asc

echo "⚠️ Agora desligue o Tails — a chave mestra nunca deve tocar a internet."
```

> ⚠️ **Leitura técnica:** cada `gpg --export-secret-subkeys` exporta **todas** as subchaves secretas já criadas até aquele momento; os nomes `sign.asc` / `encrypt.asc` / `auth.asc` são só destinos sugeridos no roteiro. Em produção siga um fluxo único de export das subchaves operacionais (como nos Módulos 3 e 6 — exports consolidados).

* * *

#### 🚀 BÔNUS: Script para importar subchaves no computador normal

```sh
#!/bin/bash
# gpg-import-subkeys.sh — Importa subchaves e configura gpg-agent para SSH

set -euo pipefail

PENDRIVE="/media/pendrive"  # ajuste conforme o ponto de montagem

echo "✅ Importando subchaves do pendrive..."

# Importar cada subchave separada
for FILE in sign.asc encrypt.asc auth.asc; do
    if [ -f "$PENDRIVE/$FILE" ]; then
        gpg --import "$PENDRIVE/$FILE"
        echo "✓ $FILE importado"
    else
        echo "⚠ Arquivo $FILE não encontrado no pendrive"
    fi
done

# Configurar gpg-agent para SSH
echo "✅ Configurando gpg-agent para SSH..."
mkdir -p ~/.gnupg
if ! grep -q "enable-ssh-support" ~/.gnupg/gpg-agent.conf 2>/dev/null; then
    echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
fi

# Reiniciar gpg-agent
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Exportar variável SSH_AUTH_SOCK
if ! grep -q "SSH_AUTH_SOCK" ~/.bashrc; then
    echo 'export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)' >> ~/.bashrc
fi
source ~/.bashrc

# Verificação automática
echo "🔎 Verificando subchaves importadas..."
gpg -K --with-keygrip | grep -E "\[S\]|\[E\]|\[A\]" || {
    echo "❌ Alguma subchave não foi encontrada!"
    exit 1
}

echo "🧩 Subchaves importadas e gpg-agent configurado com sucesso!"
echo "💻 Agora você pode usar:"
echo "   - [S] para assinar commits e arquivos"
echo "   - [E] para cifrar/decifrar mensagens"
echo "   - [A] para autenticação SSH"
```

* * *

### 📋 MÓDULO 7: DIAGNÓSTICO E DEBUG

> 🎯 **Objetivo:** Aprender a diagnosticar e resolver problemas comuns do GPG

> ⏱️ **Tempo estimado:** 30 minutos

* * *

#### ▸ COMANDO 7.1: Debug detalhado de qualquer comando

```sh
gpg --verbose --debug-level 9 --decrypt arquivo.gpg
```

**O que significa:**

*   `--verbose` → mostra informações detalhadas
*   `--debug-level 9` → nível máximo de debug (9)
*   Útil para entender onde um comando está falhando

* * *

#### ▸ COMANDO 7.2: Ver conteúdo de um arquivo .gpg (sem decifrar)

```sh
gpg --list-packets arquivo.gpg
```

**O que mostra:**

*   Algoritmos usados
*   Key IDs envolvidos
*   Tamanhos e metadados

* * *

#### ▸ COMANDO 7.3: Ver o que o agente está fazendo

```sh
gpgconf --list-dirs
```

**Saída esperada:**

```
sysconfdir:/etc/gnupg
bindir:/usr/bin
libexecdir:/usr/lib/gnupg
libdir:/usr/lib/x86_64-linux-gnu/gnupg
datadir:/usr/share/gnupg
localedir:/usr/share/locale
socketdir:/run/user/1000/gnupg
homedir:/home/aluno/.gnupg
agent-socket:/run/user/1000/gnupg/S.gpg-agent
agent-ssh-socket:/run/user/1000/gnupg/S.gpg-agent.ssh
```

```sh
gpgconf --check-programs
```

**Verifica se todos os programas do GPG estão instalados e funcionando.**

* * *

#### ▸ COMANDO 7.4: Recarregar configuração

```sh
gpgconf --reload gpg-agent
```

**Usado após alterar** `~/.gnupg/gpg-agent.conf`. Se `reload` não existir ou não surtir efeito no seu `gpgconf`, use `gpgconf --kill gpg-agent && gpgconf --launch gpg-agent` (como no Módulo 0).

* * *

#### ▸ COMANDO 7.5: Ver chaves com keygrips

```sh
gpg -K --with-keygrip --with-subkey-fingerprints
```

**Mostra:**

*   Fingerprints completos
*   Keygrips (necessários para SSH)
*   Capacidades \[S\]\[E\]\[A\]

* * *

#### 🩺 Playbook de incidentes (sintoma -> causa -> ação)

| Sintoma | Causa provável | Ação imediata |
| --- | --- | --- |
| `No secret key` | Fingerprint errado ou chave não importada | `gpg -K` e reimportar backup |
| `BAD signature` em arquivo íntegro | Arquivo/chave errada ou corrupção | Verificar fingerprint do signatário e recifrar/reassinar |
| `Agent refused operation` | `gpg-agent` inconsistente | Reiniciar agente e validar sockets |
| `Permission denied (publickey)` no SSH | `sshcontrol`/`authorized_keys` incorreto | Revisar keygrip, export SSH e arquivo remoto |
| Commit não assina no Git | `gpg.program` ou `signingkey` errado | Reaplicar configuração Git e testar `--show-signature` |

**Fluxo universal de diagnóstico:**

```sh
gpg --version | head -n1
gpgconf --check-programs
gpg -K --with-keygrip --with-subkey-fingerprints --keyid-format long
gpgconf --list-dirs

# Se o agente estiver suspeito (travou, não pede PIN):
# gpgconf --kill gpg-agent && gpgconf --launch gpg-agent

# Teste mínimo de assinatura (fumaça)
echo "smoke-test" | gpg --clearsign > /tmp/gpg-smoke.asc
gpg --verify /tmp/gpg-smoke.asc
```

> 📌 **Referência única:** o **Apêndice A** lista os 15 erros com solução rápida; este bloco é o procedimento que você **roda na ordem** quando ainda não sabe qual erro é.

* * *

#### 🚀 BÔNUS: Script de health-check completo

> 💡 Este script usa **`grep -P`** (Perl regex) e **`bc`** para comparar versões — no Ubuntu do curso: `sudo apt install bc`. Em ambiente minimal sem `-P`, edite a linha que extrai a versão ou use `gpg --version | head -n1` manualmente.

```sh
#!/bin/bash
# gpg-health-check.sh - Verifica sanidade da configuração

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== HEALTH CHECK GPG ===${NC}"

# Identidade monitorada (laboratório do curso; exporte LAB_EMAIL antes de rodar se for outra)
LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"

# 1. Versão
GPG_VER=$(gpg --version | head -n1 | grep -oP '\d+\.\d+')
if (( $(echo "$GPG_VER >= 2.5" | bc -l) )); then
    echo -e "${GREEN}✓ GPG $GPG_VER (OK)${NC}"
elif (( $(echo "$GPG_VER >= 2.2" | bc -l) )); then
    echo -e "${YELLOW}⚠ GPG $GPG_VER (considere atualizar)${NC}"
else
    echo -e "${RED}✗ GPG $GPG_VER (muito antigo)${NC}"
fi

# 2. Diretório .gnupg
if [ -d ~/.gnupg ]; then
    PERM=$(stat -c "%a" ~/.gnupg)
    if [ "$PERM" = "700" ]; then
        echo -e "${GREEN}✓ ~/.gnupg permissões OK (700)${NC}"
    else
        echo -e "${RED}✗ ~/.gnupg permissões $PERM (deveria ser 700)${NC}"
        chmod 700 ~/.gnupg
        echo -e "${GREEN}  → Corrigido automaticamente${NC}"
    fi
else
    echo -e "${RED}✗ ~/.gnupg não existe${NC}"
fi

# 3. Chaves secretas
SECRET_KEYS=$(gpg --list-secret-keys --with-colons 2>/dev/null | grep -c "^sec:" || echo "0")
if [ "$SECRET_KEYS" -gt 0 ]; then
    echo -e "${GREEN}✓ $SECRET_KEYS chave(s) secreta(s) encontrada(s)${NC}"
    if [ "$SECRET_KEYS" -gt 1 ]; then
        echo -e "${YELLOW}⚠ Várias mestras — fingerprint abaixo segue LAB_EMAIL=$LAB_EMAIL${NC}"
    fi
    FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')
    echo -e "${GREEN}✓ Fingerprint da mestra: $FP${NC}"
else
    echo -e "${RED}✗ Nenhuma chave secreta encontrada${NC}"
fi

# 4. Subchave de encrypt (deve ser cv25519!)
if gpg --list-secret-keys --with-colons "$LAB_EMAIL" 2>/dev/null | awk -F: 'BEGIN{f=0} /^ssb:/ && $0 ~ /:e:/ {f=1} END{exit !f}'; then
    if gpg --export 2>/dev/null | gpg --list-packets 2>/dev/null | grep -qi "cv25519"; then
        echo -e "${GREEN}✓ Subchave [E] com cv25519 (correto)${NC}"
    else
        echo -e "${RED}✗ Subchave [E] NÃO está usando cv25519${NC}"
        echo -e "${YELLOW}  → Corrija com: gpg --quick-add-key FP cv25519 encr 1y${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Subchave [E] não encontrada${NC}"
fi

# 5. Teste de assinatura
if echo "test" | gpg --clearsign > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Assinatura funciona${NC}"
else
    echo -e "${RED}✗ Falha ao assinar${NC}"
fi

# 6. SSH via GPG
if grep -q "enable-ssh-support" ~/.gnupg/gpg-agent.conf 2>/dev/null; then
    if [ -f ~/.gnupg/sshcontrol ] && [ -s ~/.gnupg/sshcontrol ]; then
        echo -e "${GREEN}✓ SSH via GPG configurado${NC}"
    else
        echo -e "${YELLOW}⚠ SSH via GPG configurado mas sem keygrips em sshcontrol${NC}"
    fi
else
    echo -e "${YELLOW}⚠ SSH via GPG não configurado${NC}"
fi

# 7. Backup recente
BACKUP_FILE=$(ls -t ~/gpg-backups/subkeys-*.age 2>/dev/null | head -1)
if [ -n "$BACKUP_FILE" ]; then
    BACKUP_DATE=$(stat -c %y "$BACKUP_FILE" | cut -d' ' -f1)
    echo -e "${GREEN}✓ Backup recente: $BACKUP_DATE${NC}"
else
    echo -e "${RED}✗ Nenhum backup encontrado em ~/gpg-backups/!${NC}"
fi

echo -e "${GREEN}=== FIM DO HEALTH CHECK ===${NC}"
```

* * *

### 📋 MÓDULO 8: AUTOMAÇÃO (SCRIPTS EVOLUTIVOS)

> 🎯 **Objetivo:** Aprender a criar scripts de automação para tarefas repetitivas

> ⏱️ **Tempo estimado:** 45 minutos

* * *

#### Script evolutivo de backup (referência única)

A progressão **🔴 simples → 🟡 com fingerprint → 🟢 completa**, com explicação dos defeitos de cada etapa e o script **final com timestamp, log e retenção**, já está integralmente no **Módulo 3 → COMANDO 3.2**. Este Módulo 8 parte da premissa de que você dominou aquele fluxo e foca em **agendar**, **combinar funções** e **operar em rotina**.

> ✅ **Regra editorial:** não duplicar o mesmo código evolutivo em três lugares — uma única progressão didática no Módulo 3.

* * *

#### Script de Rotação de Subchaves

```sh
#!/bin/bash
# rotate-subkeys.sh - Cria novas subchaves antes da expiração

set -euo pipefail

LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')
if [ -z "$FP" ]; then
    echo "❌ Nenhuma chave secreta encontrada."
    exit 1
fi

# Expiração de referência: o menor Unix epoch entre todas as linhas `sub:` com data de
# validade definida ($7 numérico). Linhas revogadas ($2 == r) são ignoradas na conta.
# Subchaves sem expiração não entram — só contam as que têm prazo (caso típico do curso).
EXPIRY=$(gpg --list-keys --with-colons "$FP" | awk -F: '
/^sub:/ && $2 != "r" && $7 ~ /^[0-9]+$/ {
    if (min == "" || ($7 + 0) < (min + 0)) min = $7
}
END {
    if (min != "") print min
}')
if [ -z "$EXPIRY" ]; then
    echo "⚠ Nenhuma subchave com expiração legível (colon); rode 'gpg -K $FP' ou há só subs revogadas/sem prazo."
    exit 0
fi

NOW=$(date +%s)
if ! [[ "$EXPIRY" =~ ^[0-9]+$ ]]; then
    echo "⚠ Campo de expiração inesperado ($EXPIRY). Verifique com 'gpg -K $FP'."
    exit 0
fi

DAYS_LEFT=$(( (EXPIRY - NOW) / 86400 ))

echo "Dias até a expiração mais próxima (entre subs não revogadas com data): $DAYS_LEFT"

if [ "$DAYS_LEFT" -lt 60 ]; then
    echo "⚠ Subchaves vão expirar em menos de 60 dias. Rotacionando..."

    gpg --quick-add-key "$FP" ed25519 sign 1y
    gpg --quick-add-key "$FP" cv25519 encr 1y
    gpg --quick-add-key "$FP" ed25519 auth 1y

    # Publica a atualização (se usar keyserver)
    gpg --keyserver hkps://keys.openpgp.org --send-keys "$FP" 2>/dev/null || \
        echo "⚠ WKD configurado? Publique manualmente"

    echo "✓ Novas subchaves criadas e publicadas"
else
    echo "✓ Subchaves ainda têm $DAYS_LEFT dias de validade"
fi
```

* * *

#### Configuração Cron (Automação Agendada)

```sh
# Adicione ao crontab (crontab -e)

# Backup diário às 2h
0 2 * * * /home/aluno/scripts/auto-backup-gpg.sh >> /home/aluno/logs/gpg-backup.log 2>&1

# Verificação de expiração semanal (domingo 3h)
0 3 * * 0 /home/aluno/scripts/rotate-subkeys.sh >> /home/aluno/logs/gpg-rotate.log 2>&1

# Health check diário às 4h (com alerta)
0 4 * * * /home/aluno/scripts/gpg-health-check.sh | grep -E "✗|⚠" && \
    echo "ALERTA: GPG Health Check" | mail -s "GPG Alert" aluno@local
```

* * *

#### 🚀 BÔNUS: Script final (automação unificada)

```sh
#!/bin/bash
# gpg-automation.sh - Script completo com todas as funções

LAB_EMAIL="${LAB_EMAIL:-aluno.training@openpgp-lab.local}"
FP=$(gpg --list-secret-keys --with-colons "$LAB_EMAIL" | awk -F: '/^fpr:/ {print $10; exit}')

case "${1:-}" in
    backup)
        echo "🔐 Executando backup (atalho)..."
        echo "💡 Produção/didática completa: Módulo 3 → COMANDO 3.2 (script com log e retenção)."
        gpg --export-secret-subkeys --armor "$FP" > subchaves.asc
        age --passphrase --output subchaves.age subchaves.asc
        shred -u subchaves.asc
        echo "✓ Backup concluído"
        ;;
    rotate)
        echo "🔄 Rotacionando subchaves..."
        gpg --quick-add-key "$FP" ed25519 sign 1y
        gpg --quick-add-key "$FP" cv25519 encr 1y
        gpg --quick-add-key "$FP" ed25519 auth 1y
        echo "✓ Rotação concluída"
        ;;
    health)
        echo "🏥 Executando health check..."
        gpg --refresh-keys
        gpg --check-trustdb
        echo "✓ Health check concluído"
        ;;
    *)
        echo "Uso: $0 {backup|rotate|health}"
        exit 1
        ;;
esac
```

* * *

#### Governança da automação (laboratório vs produção)

| Tipo de script | Pode usar no laboratório | Pode usar em produção | Exigências mínimas |
| --- | --- | --- | --- |
| Script simples (🔴) | Sim | Não | Apenas para aprendizado |
| Script intermediário (🟡) | Sim | Com cautela | Definir fingerprint alvo |
| Script completo (🟢) | Sim | Sim | Log, retenção, validação, rollback |

**Checklist obrigatório antes de colocar em produção:**

- [ ] `set -euo pipefail` habilitado
- [ ] Fingerprint definido explicitamente
- [ ] Log de execução com timestamp
- [ ] Teste de restauração validado
- [ ] Rotina de retenção/limpeza definida

* * *

## 🏁 CHECKPOINT 3: SIMULAÇÃO DE PERDA TOTAL

**Desafio:** Simule a perda total do seu computador e recupere usando apenas seus backups.

**Instruções:**

```sh
# 1. Backup de segurança do estado atual
cp -r ~/.gnupg ~/.gnupg.checkpoint3

# 2. DELETE TUDO (SIMULA DESASTRE!)
rm -rf ~/.gnupg ~/.cache/gpg*

# 3. Verifique que não há chaves
gpg -K
# Deve mostrar: "gpg: nenhuma chave secreta"

# 4. Recupere das subchaves
age --decrypt --output subchaves.asc subchaves.age
gpg --import subchaves.asc

# 5. Teste se a recuperação funcionou
echo "recuperei" | gpg --clearsign > /dev/null 2>&1 && echo "✓ Recuperação OK" || echo "✗ Falha"

# 6. Se tiver a chave mestra (pendrive LUKS), recupere também
# Boot Tails, monte pendrive, decifre mestra.age, importe
```

> ⚠️ Como no **Módulo 3**, o nome **`subchaves.age`** aqui é **exemplo**. Aponte para o arquivo `.age` real do seu backup (ex.: `~/gpg-backups/subkeys-….age`) ou ajuste o caminho no `age --decrypt`.

#### Rubrica de aprovação do Checkpoint 3

| Critério | Evidência mínima | Status |
| --- | --- | --- |
| Estado limpo | Após `rm`, `gpg -K` não lista chaves secretas | [ ] |
| Restauração | Import do `.age` / backup sem erro | [ ] |
| Assinatura pós-restore | `gpg --clearsign` ou equivalente executa com sucesso | [ ] |
| Documentação | Lista dos comandos e saídas relevantes (notas ou log) | [ ] |

> ✅ **Aprovado:** todos os itens marcados. Opcionalmente inclua evidência de restore testado nos últimos 30 dias (Módulo 3).

**✅ Checkpoint 3 aprovado se** cumprir a rubrica acima (equivalente aos três pontos: subchaves recuperadas, assinatura OK, processo documentado).

* * *

## ⚫ 5. PARTE 4: EXPERT & FUTURO (Semana 4)

> ⏱️ **Tempo estimado:** 3-4 horas

* * *

### 📋 MÓDULO 9: THREAT MODELING (MODELAGEM DE AMEAÇAS)

> 🎯 **Objetivo:** Entender os riscos à sua identidade digital e como mitigá-los

> ⏱️ **Tempo estimado:** 30 minutos

* * *

#### O que é Threat Modeling?

É o processo de:

1.  Identificar o que você quer proteger
2.  Identificar quem pode querer atacar
3.  Identificar como podem atacar
4.  Definir como se proteger

* * *

#### Quais são seus riscos?

| Ameaça | Probabilidade | Impacto | Mitigação |
| --- | --- | --- | --- |
| **Roubo do laptop** | Média | Alto | Subchaves com expiração curta (1 ano) |
| **Malware capturando chaves** | Alta | Crítico | Chave mestra OFFLINE (Tails) |
| **Perda do backup** | Baixa | Crítico | Backup 3-2-1 (3 cópias, 2 mídias, 1 offline) |
| **Ataque quântico (2030+)** | Média | Crítico | Planejar migração para Kyber |
| **Interceptação de chave pública** | Baixa | Médio | Verificar fingerprint OFFLINE |
| **Engenharia social** | Média | Alto | NUNCA compartilhar chave privada |
| **Senha fraca na mestra** | Média | Crítico | Diceware com 6+ palavras |
| **Keyserver com chave falsa** | Baixa | Médio | Preferir WKD (Web Key Directory) |

* * *

#### Matriz de Riscos (Como priorizar)

```
        Alta Probabilidade
        ┌─────────────────────────────────────┐
        │                                     │
        │  📌 Malware          📌 Roubo       │
        │  (Ação IMEDIATA)     (Planejar)     │
        │                                     │
        │  📌 Senha fraca      📌 Engenharia  │
        │  (Corrigir AGORA)    (Treinamento)  │
        │                                     │
        └─────────────────────────────────────┘
        Baixa Probabilidade

        Baixo Impacto              Alto Impacto
```

* * *

#### Como mitigar cada ameaça

| Ameaça | Mitigação imediata | Mitigação de longo prazo |
| --- | --- | --- |
| Malware | Chave mestra offline | Verificar assinaturas de software |
| Roubo | Subchaves expiram em 1 ano | Backup 3-2-1 |
| Senha fraca | Diceware 6+ palavras | Gerenciador de senhas |
| Ataque quântico | Usar ECC (ed25519/cv25519) | Migrar para Kyber em 2028 |
| Engenharia social | NUNCA compartilhar chave privada | Treinamento de segurança |

* * *

#### Perfis de ameaça (plano prático por tipo de aluno)

| Perfil | Ameaça dominante | Controle prioritário |
| --- | --- | --- |
| Dev solo | Vazamento local e erro operacional | Backup testado + Git assinado |
| Freelancer multi-cliente | Mistura de identidades | Chaves separadas por contexto |
| Time pequeno | Chaves sem padrão | Política de assinatura e rotação |
| Empresa regulada | Auditoria e escala | Governança + SSH CA + trilha de evidência |
| Jornalista/ativista | Coerção e apreensão física | Mestra offline + compartmentalização forte |

* * *

#### Matriz de decisão: impacto x esforço

| Ação | Impacto em segurança | Esforço | Prioridade |
| --- | --- | --- | --- |
| Mestra offline + subchaves | Muito alto | Médio | P1 |
| Backup 3-2-1 testado | Muito alto | Médio | P1 |
| Assinatura obrigatória em Git | Alto | Baixo | P1 |
| Rotação trimestral assistida | Alto | Médio | P2 |
| Testes pós-quânticos em lab | Médio | Médio | P3 |

* * *

#### Princípios Zero Trust aplicados ao OpenPGP

Mapa rápido (útil ao revisar política com times de segurança — mesmo vocabulário de “never trust, always verify”):

| Princípio Zero Trust | Como o curso já materializa em GPG/OpenPGP |
| --- | --- |
| Verificar sempre | Confirmar fingerprint **fora da banda** antes de confiar na chave |
| Menor privilégio | Subchaves `[S]`/`[E]`/`[A]` separadas; mestra só `[C]` e offline |
| Assumir breach | Backup testado + certificado de revogação guardado |
| Segmentação | Mestra offline / operação diária só com subs; ambientes separados em CI |

* * *

### 📋 MÓDULO 10: COMANDOS DE MANUTENÇÃO

> 🎯 **Objetivo:** Manter suas chaves e chaveiro atualizados

> ⏱️ **Tempo estimado:** 20 minutos

* * *

#### ▸ COMANDO 10.1: Atualizando chaves de keyservers

```sh
gpg --refresh-keys
```

**O que faz:** Busca atualizações de todas as chaves no seu chaveiro (expirações, revogações, novas subchaves).

**Por que é importante:** Se você nunca rodar este comando, seu chaveiro vai acumular chaves expiradas.

**Keyservers em 2026 (fallback quando não há WKD)**

A fonte da verdade para **publicação** continua sendo **WKD** (COMANDO 10.5). Quando ainda precisar **buscar** por fingerprint:

| Endpoint | Papel |
| --- | --- |
| `hkps://keys.openpgp.org` | Foco em privacidade e verificação de e-mail; não participa da rede SKS clássica |
| `hkps://keyserver.ubuntu.com` | Fallback Hockeypuck; ampla interoperabilidade; UIDs ficam públicos |

🔴 **Evite:** pools SKS genéricos, `pgp.mit.edu` e qualquer servidor sem **HKPS** (TLS).

```sh
gpg --keyserver hkps://keys.openpgp.org --recv-keys FINGERPRINT_LONGO
# Se não encontrar:
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys FINGERPRINT_LONGO
```

Publicar com `--send-keys` só quando política/time exigirem; caso contrário prefira WKD e avise contatos pelo fingerprint.

**Fluxograma em texto (substitui diagrama visual)**

Leia como uma árvore de decisão — sempre com **HKPS** e fingerprint confirmado **fora da banda** quando possível.

**A) Obter a chave pública de alguém**

1. Você pode usar **WKD** (domínio HTTPS da pessoa / e‑mail estável)? → Siga o COMANDO 10.5 e valide o fingerprint por canal independente. **Pare aqui se funcionar.**
2. Só tem o **fingerprint** e precisa baixar? →  
   `gpg --keyserver hkps://keys.openpgp.org --recv-keys FPR`
3. Não veio material ou UID incompleto para seu caso? → **Fallback:**  
   `gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys FPR`
4. Ainda falhou? → Peça um **`.asc`** direto ao contato ou confirme se o FPR está atualizado (rotação/revogação). **Não** procure em pools SKS antigos, `pgp.mit.edu` ou endpoints sem TLS.

**B) Publicar *sua* chave**

1. **Preferido:** WKD no seu domínio + divulgar fingerprint oficial por canal paralelo ao site.
2. **Keyserver só se política/time exigirem:**  
   - `keys.openpgp.org` — foco em privacidade e verificação de e-mail no UID;  
   - `keyserver.ubuntu.com` — publicação mais “ampla”, porém UIDs ficam **públicos** de imediato.
3. **Evitar:** “sincronizar” via redes SKS legadas ou servidores sem HKPS — são vetores de confusão, spam de chaves e metadados vazados.

**C) Atualizar chaves que *já* estão no chaveiro**

1. Rotina: `gpg --refresh-keys` (com `keyserver` padrão sensato no `gpg.conf`, se você usar essa opção).
2. Se uma chave específica não atualiza, repita o caminho **(A)** com o FPR dela antes de assumir comprometimento.

* * *

#### ▸ COMANDO 10.2: Verificando integridade do trustdb

```sh
gpg --check-trustdb
```

**O que faz:** Verifica se a base de dados de confiança (trustdb) está consistente.

* * *

#### ▸ COMANDO 10.3: Reconstruindo o trustdb

```sh
gpg --update-trustdb
```

**O que faz:** Reconstrói a Web of Trust local. Útil se houver inconsistências.

* * *

#### ▸ COMANDO 10.4: Exportação minimal (sem metadados)

```sh
gpg --export --armor --export-options export-minimal "$FP" > chave-minima.asc
```

**O que faz:** Exporta a chave sem metadados extras (versão do GPG, preferências, etc).

**Por que usar:** Melhora a privacidade. O atacante não sabe qual versão do GPG você usou.

* * *

#### ▸ COMANDO 10.5: Publicação de chave via WKD (prática recomendada)

**O que faz:** Publica chave pública no seu domínio com HTTPS, reduzindo dependência de keyservers.

```sh
# exporte sua chave pública em formato ASCII
gpg --export --armor "$FP" > pubkey.asc

# fluxo WKD (alto nível):
# 1) gerar hash/local-part para diretório WKD
# 2) publicar em https://SEU_DOMINIO/.well-known/openpgpkey/...
# 3) garantir HTTPS válido
```

**Validação operacional:**

- O domínio responde em HTTPS sem erro.
- Cliente consegue descobrir sua chave por e-mail/domínio.
- Fingerprint publicado bate com seu fingerprint oficial.

* * *

#### ▸ COMANDO 10.6: Web of Trust operacional (assinando chave de terceiro)

**O que faz:** Constrói confiança explícita entre identidades verificadas.

```sh
# 1) importe a chave pública da pessoa
gpg --import chave-terceiro.asc

# 2) valide fingerprint por canal seguro (voz/video presencial)
gpg --fingerprint EMAIL_TERCEIRO

# 3) assine a chave (somente após validação forte)
gpg --sign-key EMAIL_TERCEIRO
```

> 💡 Com vários UIDs ou nomes parecidos, prefira fluxo por **fingerprint**: `gpg --edit-key FPR_DA_PESSOA` → `sign` → `save`.

> ⚠️ **Regra de segurança:** nunca assine chave de terceiro sem validação independente de fingerprint.

**Manutenção avançada da própria chave (opcional)**

No `gpg --edit-key FP`: `adduid` adiciona outro e-mail/nome à mesma chave; `addphoto` anexa foto ao UID (use imagem pequena, ex. 240×240). Depois `save`. Publique atualização (WKD/keyserver) e avise contatos do novo UID.

* * *

#### Aliases opcionais (`~/.bashrc`)

Atalhos **sem** `--trust-model always/auto` na cifragem (evite atalhos que “confiem demais” na CLI).

```sh
alias gpg-ls='gpg --list-keys --keyid-format long --with-subkey-fingerprints'
alias gpg-ls-sec='gpg -K --keyid-format long --with-keygrip --with-subkey-fingerprints'
alias gpg-fp='gpg --fingerprint --with-subkey-fingerprints'
alias gpg-agent-reset='gpgconf --kill gpg-agent && gpgconf --launch gpg-agent'

# Se você NÃO define keyserver no gpg.conf e quer refresh explícito:
# alias gpg-refresh-ks='gpg --keyserver hkps://keys.openpgp.org --refresh-keys'
```

* * *

#### Comandos de manutenção (referência rápida)

| Comando | O que faz | Frequência |
| --- | --- | --- |
| `gpg --refresh-keys` | Atualiza chaves | Semanal |
| `gpg --check-trustdb` | Verifica trustdb | Mensal |
| `gpg --update-trustdb` | Reconstrói trustdb | Quando necessário |
| `gpg --export-options export-minimal` | Exporta sem metadados | Sempre |

* * *

#### Calendário operacional (semanal, mensal, trimestral, anual)

| Frequência | Rotina | Comando/atividade |
| --- | --- | --- |
| Semanal | Atualizar chaves e checar assinatura | `gpg --refresh-keys` + teste de sign |
| Mensal | Revisão de trustdb e backups | `gpg --check-trustdb` + restore simulado |
| Trimestral | Auditoria de scripts e logs | revisar `backup/rotate/health` |
| Semestral | Revisão de expiração de subchaves | planejar rotação antes de 60 dias |
| Anual | Rotação completa e revisão de política | gerar novas `[S][E][A]` |

* * *

#### Política simples de rotação (recomendada)

- Rotacione subchaves quando faltarem menos de 60 dias para expirar.
- Nunca espere expirar para começar a rotação.
- Após rotação, valide assinatura, cifragem e SSH no mesmo dia.
- Atualize publicação (WKD/keyserver) e comunique contatos críticos.

* * *

### 📋 MÓDULO 11: CRIPTOGRAFIA PÓS-QUÃNTICA

> 🎯 **Objetivo:** Entender a ameaça dos computadores quânticos e como se preparar

> ⏱️ **Tempo estimado:** 45 minutos

* * *

#### O Problema Quântico

Computadores quânticos suficientemente grandes (milhões de qubits) quebrarão:

*   **RSA** (fatoração) → algoritmo de Shor
*   **ECC** (logaritmo discreto elíptico) → algoritmo de Shor também se aplica

**Cronograma estimado (2026-2035):**

| Ano | Marco | Impacto |
| --- | --- | --- |
| **2026** | Computadores quânticos de ~1000 qubits (NISQ) | Ameaça teórica |
| **2030-2035** | Ameaça real ao RSA-2048 | RSA começa a ficar inseguro |
| **2040+** | ECC pode estar comprometido | ECC precisa ser substituído |

* * *

#### 🔵 Kyber/ML-KEM (NIST Padronizado)

**O que é:** Algoritmo de encapsulamento de chaves baseado em reticulados (lattices). Escolhido pelo NIST em 2024 como padrão pós-quântico para troca de chaves.

**Status em GnuPG 2.5.19+:** ⚠️ **EXPERIMENTAL** – use apenas em laboratório.

```sh
# 🔵 EXPERIMENTAL - Gerando chave híbrida (Kyber + cv25519)
gpg --quick-generate-key --expert "Aluno Lab (PQ) <pq@lab>" kyber768+cv25519 cert 1y

# Verificando se o material da chave menciona Kyber (ajuste $FP à sua chave PQ de laboratório)
gpg --export "$FP" | gpg --list-packets | grep -i kyber

# ⚠️ NÃO use em produção crítica - experimental!
```

**Por que Kyber?**

*   Resistente a ataques de computadores quânticos conhecidos
*   Padronizado pelo NIST (National Institute of Standards and Technology)
*   Já implementado no GnuPG 2.5.19+ (experimental)

* * *

#### 🔵 SPHINCS+ (Assinatura Pós-Quântica)

**O que é:** Algoritmo de assinatura baseado em funções hash (stateless). Também selecionado pelo NIST.

**Características:**

*   Chaves grandes (~8 KB)
*   Assinaturas grandes
*   Stateless (diferente de XMSS e LMS)
*   Resistente a quânticos

**Status:** Ainda não suportado nativamente no GPG mainstream (2026).

* * *

#### Recomendações para cada perfil (2026)

| Perfil | Ação | Prazo |
| --- | --- | --- |
| **Usuário comum** | Continue com ed25519/cv25519. É seguro hoje. | Já  |
| **Empresa regulada** | Monitore Kyber. Planeje migração. | 2028-2030 |
| **Dados de longo prazo (30+ anos)** | Considere cifragem híbrida (Kyber + ECC) | Planejar |
| **Entusiasta** | Teste Kyber em laboratório | 2026 |

* * *

#### Cronograma de Migração para Pós-Quântico

```
# ============================================
# 2025-2026: PREPARAÇÃO
# ============================================
# ✅ Continue usando ed25519/cv25519
# ✅ Teste Kyber em laboratório
# ✅ Atualize GPG para 2.5.19+
# ✅ Configure WKD em vez de keyservers

# ============================================
# 2027: AVALIAÇÃO
# ============================================
# ⚠️ Migre chaves não críticas para Kyber
# ⚠️ Teste interoperabilidade

# ============================================
# 2028: TRANSIÇÃO
# ============================================
# 🔴 Comece a migração de chaves críticas
# 🔴 Use chaves híbridas (Kyber + ECC)

# ============================================
# 2029-2030: MATURIDADE
# ============================================
# 🟢 Kyber como padrão
# 🟢 SPHINCS+ para assinaturas
# 🟢 RSA/ECC obsoletos
```

* * *

#### Tabela de Evolução de Algoritmos (2025-2030)

| Ano | Algoritmo Padrão | Kyber | RSA | Recomendação |
| --- | --- | --- | --- | --- |
| **2025** | ed25519/cv25519 | ⚠️ Experimental | 🟡 Funciona (legado) | Use ECC |
| **2026** | ed25519/cv25519 | ⚠️ Experimental | 🔴 Evitar | Use ECC, teste Kyber |
| **2027** | ed25519/cv25519 | 🟡 Estável | 🔴 Evitar | Considere Kyber |
| **2028** | Kyber + ECC | ✅ Recomendado | ❌ Obsoleto | Use híbrido |
| **2029** | Kyber + ECC | ✅ Padrão | ❌ Obsoleto | Use Kyber |
| **2030** | Kyber + SPHINCS+ | ✅ Padrão | ❌ Obsoleto | Use pós-quântico |

* * *

#### 🚀 Guia de migração para 2028-2030

```sh
# 2028: Comece a usar chaves híbridas em produção não-crítica
gpg --quick-generate-key --expert "Seu Nome (PQ) <seu@dominio>" kyber768+cv25519 cert 3y

# 2029: Kyber como padrão para dados de longo prazo
gpg --quick-generate-key "Seu Nome (PQ) <seu@dominio>" kyber768 cert 3y

# 2030: SPHINCS+ disponível para assinaturas (quando suportado)
# gpg --quick-generate-key --expert "Seu Nome" sphincsplus cert 3y
```

* * *

#### Experimental vs Produção (regra de decisão)

| Item | Laboratório | Produção crítica |
| --- | --- | --- |
| `kyber768+cv25519` | Recomendado para testes | Somente após validação institucional |
| Chaves ECC clássicas | Base atual de ensino | Continua padrão em 2026 |
| SPHINCS+ | Estudo conceitual | Aguardar suporte estável no ecossistema |

**Regra de ouro:** em 2026, pós-quântico é trilha de preparação; segurança operacional atual ainda depende de disciplina com ECC, backup e revogação.

* * *

#### Checklist de prontidão pós-quântica

- [ ] GPG atualizado para ramo recente suportado no seu ambiente
- [ ] Ambiente de laboratório separado para testes PQ
- [ ] Registro de interoperabilidade (o que funciona e o que quebra)
- [ ] Estratégia híbrida desenhada para 2028+
- [ ] Comunicação com equipe/usuários sobre roadmap de migração

* * *

### 📋 MÓDULO 12: O FUTURO DO OPENPGP (SEQUOIA-PGP)

> 🎯 **Objetivo:** Conhecer as alternativas modernas ao GPG e se preparar para o futuro

> ⏱️ **Tempo estimado:** 30 minutos

* * *

#### O que é Sequoia-PGP?

**Sequoia-PGP** é uma implementação moderna do protocolo OpenPGP, escrita em **Rust** (linguagem mais segura que C).

**Por que foi criada:**

*   O GnuPG (GPG) tem código legado de 20+ anos
*   C é vulnerável a falhas de memória (buffer overflow, use-after-free)
*   Rust elimina essas vulnerabilidades em tempo de compilação

| Aspecto | GnuPG (GPG) | Sequoia-PGP |
| --- | --- | --- |
| **Linguagem** | C   | Rust (seguro contra falhas de memória) |
| **Maturidade** | 20+ anos | ~5 anos |
| **Adoção** | Ampla | Crescente |
| **Arquitetura** | Monolítica | Modular (bibliotecas) |
| **Integração** | CLI, ampla compatibilidade | CLI + API Rust/Python |

> 📖 **Leitura recomendada:** [documentação do utilizador do `sq`](https://sequoia-pgp.gitlab.io/user-documentation/) (guia em livro; complementa o [manual `sq(1)`](https://sequoia-pgp.gitlab.io/sequoia-sq/man/sq.1.html) do cabeçalho).

* * *

#### Onde Sequoia é usado hoje

*   **ProtonMail** (usa internamente)
*   **Thunderbird** (OpenPGP nativo desde versões recentes — sem Enigmail)
*   **rPGP** (implementação em Rust)
*   Ferramentas de segurança que buscam integração com Rust

#### Thunderbird com OpenPGP nativo (e-mail desktop)

O complemento Enigmail está **descontinuado**; Thunderbird **78+** traz OpenPGP integrado. Instale o Thunderbird, configure a conta, depois **Editar → Configurações → Criptografia ponta a ponta**: ative OpenPGP e associe sua chave. Valide sempre fingerprints como no restante do curso.

* * *

#### Comparativo enxuto: GPG × age × minisign

| Ferramenta | Melhor para | Limitação típica |
| --- | --- | --- |
| **GPG / OpenPGP** | Identidade, subchaves `[S][E][A]`, WoT, e‑mail | Mais complexo |
| **age** | Cifrar arquivos/backups com simplicidade | Não substitui todo o ecossistema OpenPGP |
| **minisign** | Assinaturas Ed25519 minimalistas | Não cobre PGP completo nem WoT |

#### Comandos equivalentes (GnuPG vs Sequoia)

| Ação | GnuPG (gpg) | Sequoia (sq) |
| --- | --- | --- |
| Importar chave/certificado | `gpg --import chave.asc` | `sq key import chave.asc` |
| Exportar certificado **público** | `gpg --export -a FPR` | `sq cert export --cert=FPR` |
| Listar chaves | `gpg --list-keys` | `sq key list` |
| Assinar (mensagem inline) | `gpg --sign arquivo.txt` | `sq sign --signer-email=EMAIL --message arquivo.txt` |
| Verificar assinatura **destacada** | `gpg --verify arquivo.sig arquivo.txt` | `sq verify --signature-file=arquivo.sig arquivo.txt` |
| Cifrar | `gpg --encrypt -r EMAIL arquivo.txt` | `sq encrypt --for-email=EMAIL arquivo.txt` |
| Decifrar | `gpg --decrypt arquivo.gpg` | `sq decrypt arquivo.gpg` |

> 📎 No Sequoia, **certificado** = material só público; **chave** = material com segredo. Export de segredo (`gpg --export-secret-keys`…) equivale a `sq key export --cert=FPR`, não à linha “certificado público” acima. Saída OpenPGP costuma vir **ASCII armor por omissão**; confira `sq help` na sua versão.

* * *

#### Mapa de Transição GnuPG → Sequoia

```
🔑 CONCEITOS IGUAIS (você já sabe tudo isso!):
├─ Chave mestra e subchaves [C][S][E][A]
├─ Fingerprints (identificadores)
├─ UIDs (User IDs - nome/email)
├─ WKD / Keyservers
└─ Agente de chaves

⚙️ APENAS OS COMANDOS MUDAM:
├─ gpg --import → sq key import
├─ gpg --export -a (público) → sq cert export --cert=FPR
├─ gpg --list-keys → sq key list
├─ gpg --sign → sq sign (--signer-email ou --signer-file …)
├─ gpg --verify (.sig destacada) → sq verify --signature-file=X arquivo
├─ gpg --encrypt → sq encrypt --for-email=EMAIL …
└─ gpg --decrypt → sq decrypt …
```

> 💡 **DICA DO PROFESSOR:** O conhecimento que você tem de GPG é **100% transferível** para o Sequoia. Os conceitos são exatamente os mesmos. Apenas os comandos mudam. Quando o Sequoia se tornar mais difundido (2027-2028), você já vai entender toda a lógica.

* * *

#### Roadmap 2027-2030 (O que vem por aí)

| Ano | Marco | O que muda |
| --- | --- | --- |
| **2027** | GPG 2.6+ com suporte nativo a chaves híbridas | Kyber se torna estável |
| **2028** | Chaves híbridas (Kyber + ECC) como padrão | Migração começa |
| **2029** | Kyber como padrão para dados de longo prazo | RSA/ECC começa a ser descontinuado |
| **2030** | SPHINCS+ disponível para assinaturas | Pós-quântico maduro |

* * *

#### O que fazer em 2026 (AGORA)

| Ação | Prioridade |
| --- | :---: |
| ✅ Gere chaves ed25519/cv25519 | Alta |
| ✅ Atualize GPG para 2.5.19+ | Alta |
| ⚠️ Teste Kyber em laboratório | Média |
| ⚠️ Configure WKD no seu domínio | Média |
| 🔴 Comece a planejar migração RSA→ECC | Média |
| 🔴 Leia sobre Sequoia-PGP | Baixa |

* * *

#### Plano de transição em 3 etapas (sem ruptura)

| Etapa | Objetivo | Resultado esperado |
| --- | --- | --- |
| 1. Espelhar comandos | Repetir rotinas `gpg` em `sq` em laboratório | Equivalência operacional validada |
| 2. Integrar em CI de teste | Verificar assinatura/validação em pipeline não crítico | Confiança no fluxo automatizado |
| 3. Adoção gradual | Usar Sequoia em tarefas selecionadas | Migração controlada, sem downtime |

**Pontos de atenção na migração:**

- Não migrar tudo em um único ciclo.
- Manter evidências de compatibilidade por caso de uso.
- Priorizar fluxo de assinatura e verificação antes de cifragem avançada.

* * *

## 🎓 EXAME FINAL + CERTIFICADO

#### Desafio Final

Complete este desafio para obter seu certificado:

1.  **Crie uma nova identidade** (do zero) no Tails
2.  **Configure subchaves** \[S\], \[E\], \[A\] com expiração de 1 ano
3.  **Faça backup completo** (3-2-1) com age
4.  **Configure Git signing** e faça um commit assinado
5.  **Configure SSH via GPG** e teste a conexão
6.  **Simule a perda total** e restaure a partir do backup
7.  **Documente todo o processo** (comandos e saídas)

> 📎 No restore, use o **caminho real** do arquivo `.age` do seu backup (como no Módulo 3 e no Checkpoint 3 — evite copiar só o nome fictício `subchaves.age`).

* * *

#### Certificado de Conclusão

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                 🎓 CERTIFICADO DE EXCELÊNCIA ABSOLUTA 🎓                    │
│                                                                             │
│   Certificamos que o(a) aluno(a) completou com sucesso o curso              │
│                                                                             │
│   "OpenPGP/GPG do Zero ao Expert – VERSÃO 1.0 (canônica)"                  │
│                                                                             │
│   Demonstrando proficiência em:                                             │
│   ✅ Chave mestra offline (air-gapped)                                      │
│   ✅ Subchaves [S][E][A] separadas                                          │
│   ✅ Backup 3-2-1 com age e LUKS                                            │
│   ✅ Git signing e SSH via GPG                                              │
│   ✅ Recuperação de desastres                                               │
│   ✅ Preparação para criptografia pós-quântica                              │
│   ✅ Multiplataforma (Linux, Windows, Android, iPhone)                      │
│                                                                             │
│   🔐 _Assinado digitalmente com GPG usando subchave [S]_                   │
│                                                                             │
│   Professor Especialista em Criptografia Aplicada                          │
│   Linux • Windows • Android • iPhone                                        │
│   Maio de 2026                                                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

* * *

## 📚 APÊNDICES

Material de consulta do aluno e tabelas de apoio. **Quem mantém o texto:** o anexo editorial e a Conclusão vêm depois dos apêndices técnicos.

* * *

### ✅ Folha única — checklists dos checkpoints

Use esta página como **referência rápida** antes de encerrar cada fase do curso. Os desafios completos e o contexto pedagógico continuam nas secções **🏁 CHECKPOINT 1**, **2** e **3**.

#### Antes de avançar para a Parte 2 — Checkpoint 1 (cifrar, assinar, verificar)

| Critério | Evidência mínima | OK |
| --- | --- | :---: |
| Chave funcional | `gpg -K` mostra `[C]`, `[S]`, `[E]`, `[A]` | [ ] |
| Cifragem | Arquivo `.gpg` criado com sucesso | [ ] |
| Decifragem | Conteúdo original recuperado sem erro | [ ] |
| Assinatura | `.sig` ou clearsign gerado sem erro | [ ] |
| Verificação | Assinatura válida no arquivo íntegro | [ ] |
| Integridade | Após alterar o arquivo, verificação retorna BAD signature | [ ] |

#### Antes de avançar para a Parte 3 — Checkpoint 2 (Git assinado)

| Critério | Evidência mínima | OK |
| --- | --- | :---: |
| Chave pública publicada | Chave adicionada na conta GitHub/GitLab | [ ] |
| Commit assinado localmente | `git log --show-signature -1` válido | [ ] |
| Assinatura na plataforma | Selo **Verified** (ou equivalente) no commit remoto | [ ] |
| Tag assinada | `git tag -s` criada e verificável | [ ] |
| Reprodutibilidade | Novo commit assina sem ajustes ad-hoc | [ ] |

#### Antes de avançar para a Parte 4 — Checkpoint 3 (perda total simulada)

| Critério | Evidência mínima | OK |
| --- | --- | :---: |
| Estado limpo | Após remover o chaveiro de laboratório, `gpg -K` não lista segredos | [ ] |
| Restauração | Import a partir do backup (ex.: `.age`) sem erro | [ ] |
| Assinatura pós-restore | `gpg --clearsign` (ou equivalente) conclui com sucesso | [ ] |
| Documentação | Notas ou log com comandos e saídas relevantes | [ ] |

> **Regra:** só avance para a parte seguinte quando **todos** os itens da tabela correspondente estiverem marcados. Se algo falhar, volte ao módulo indicado na seção do checkpoint e repita até fechar a rubrica.

* * *

<a id="glossario-referencia"></a>

### 📖 Glossário de referência

Definições curtas dos termos que mais reaparecem no curso. Para uma leitura inicial de um minuto, veja também o [Glossário rápido](#glossario-rapido) no onboarding.

| Termo | Significado |
| --- | --- |
| **\[C\] / \[S\] / \[E\] / \[A\]** | Capacidades OpenPGP na chave: **C**ertify (mestra: assinar identidades da própria chave e emitir revogação), **S**ign (assinatura), **E**ncryption (cifragem a terceiros), **A**uthentication (ex.: SSH com `gpg-agent`). |
| **WKD** | *Web Key Directory* — forma padrão de publicar a chave pública via HTTPS no domínio do email (`.well-known/openpgpkey/` ou subdomínio `openpgpkey`). Ver Módulo 10. |
| **WoT** | *Web of Trust* — confiança derivada de assinaturas mútuas e níveis de confiança no chaveiro (não confundir com “confiar cegamente” em keyserver). Ver Módulo 10 / apêndices de política. |
| **HKPS** | Acesso a servidor de chaves sobre TLS (`hkps://`), reduzindo exposição em relação a HKP simples ou infraestruturas SKS legadas. |
| **Fingerprint** | Identificador longo e estável da chave — compare **fora da banda** com o interlocutor antes de marcar confiança ou assinar a chave de terceiros. |
| **Keygrip** | Identificador que o `gpg-agent` usa para mapear material criptográfico (ligação ao SSH via `[A]`, `sshcontrol`, etc.). Ver Módulo 5. |
| **pinentry** | Programa que solicita passphrase ou PIN ao agente (`pinentry-tty`, `pinentry-gnome`, …). Fundamental para não treinar má hábitos como passphrase em variável de ambiente. |
| **Air-gapped / offline** | Operação sem rede no momento sensível (ex.: gerir mestra no Tails sem Internet). Objetivo: reduzir superfície de vazamento. |
| **LUKS** | Criptografia de disco/partição no Linux — uso típico para proteger mídia física onde guardas backups ou cofres. |
| **age** | Ferramenta simples para cifrar arquivos com chave ou passphrase — usada nos roteiros de backup com `gpg` + arquivos `.age`. |
| **Backup 3-2-1** | Três cópias dos dados importantes, em **dois** tipos de mídia diferentes, com **uma** cópia fora do local principal (ex.: fora de casa ou data center distinto). |

* * *

### APÊNDICE A: TABELA DE ERROS RÁPIDOS (TOP 15)

| #   | Mensagem de Erro | Causa | Solução Rápida |
| --- | --- | --- | --- |
| 1   | `gpg: signing failed: No secret key` | Não tem subchave \[S\] | `gpg --quick-add-key "$FP" ed25519 sign 1y` |
| 2   | `gpg: decryption failed: No secret key` | Não tem subchave \[E\] | `gpg --quick-add-key "$FP" cv25519 encr 1y` |
| 3   | `gpg: key ... not found` | Fingerprint errado | `gpg --list-keys` |
| 4   | `gpg: Sorry, we are in batchmode...` | Pinentry não configurado | `sudo apt install pinentry-tty` |
| 5   | `gpg: WARNING: unsafe permissions` | Permissões erradas | `chmod 700 ~/.gnupg` |
| 6   | `gpg: keyserver receive failed` | Keyserver offline | Tente `hkps://keys.openpgp.org` ou prefira WKD |
| 7   | `gpg: decryption failed: Bad session key` | Senha errada | Verifique passphrase |
| 8   | `gpg: Can't check signature: No public key` | Sem chave pública | `gpg --recv-keys FINGERPRINT` |
| 9   | `gpg: signing failed: Inappropriate ioctl` | Terminal não interativo | `export GPG_TTY=$(tty)` |
| 10  | `ssh-add -L` vazio | SSH via GPG não configurado | Verifique `~/.gnupg/sshcontrol` |
| 11  | `gpg: agent refused operation` | Agent travou | `gpgconf --kill gpg-agent` |
| 12  | `gpg: no valid OpenPGP data found` | Arquivo corrompido | Reexporte a chave |
| 13  | `gpg: Sorry, no terminal at all requested` | Sem pinentry gráfico | `sudo apt install pinentry-gtk2` |
| 14  | `gpg: key ... has been revoked` | Chave revogada | Baixe chave atualizada |
| 15  | `gpg: Can't connect to agent` | Agent não rodando | `gpgconf --launch gpg-agent` |

* * *

#### Playbook rápido de diagnóstico (ordem recomendada)

> 📌 **Sem duplicação:** a sequência completa de comandos (estado → chaves → agente → teste funcional) e a tabela **sintoma → causa → ação** estão no **Módulo 7 → Playbook de incidentes** e no **fluxo universal de diagnóstico** logo abaixo da tabela. Use este apêndice para a tabela dos 15 erros; use o Módulo 7 quando precisar **executar** o passo a passo.

**Decisão rápida por tipo de erro:**

- Erro de assinatura: valide subchave `[S]`, `GPG_TTY`, `gpg-agent`.
- Erro de decifração: confirme subchave `[E]` e import correto de subchaves.
- Erro de SSH: revise `sshcontrol`, keygrip, `SSH_AUTH_SOCK`.
- Erro de trust/chave pública: atualize chaveiro e revalide fingerprint.

* * *

### APÊNDICE B: SCRIPTS EVOLUTIVOS (simples → fingerprint → completo)

#### Script de backup de subchaves (sem duplicar o curso)

A progressão **🔴 simples → 🟡 com fingerprint → 🟢 completa** com explicação linha a linha e script **com log + rotação de arquivos `.age`** está **inteira** no **Módulo 3 → COMANDO 3.2**. Este apêndice mantém só **referência cruzada** — assim o aluno não encontra três cópias do mesmo código em lugares diferentes.

> ✅ **Regra editorial:** código didático repetido aparece **uma vez** no módulo; nos apêndices ficam catálogo, anti-padrões e modelo de cabeçalho.

* * *

#### Catálogo final de scripts (uso recomendado)

| Script | Objetivo | Contexto | Frequência |
| --- | --- | --- | --- |
| `backup-subkeys-completo.sh` | Backup cifrado de subchaves (🟢 abordagem completa do COMANDO 3.2) | Lab + Produção | Diário |
| `rotate-subkeys.sh` | Rotação de `[S][E][A]` | Produção | Trimestral/por expiração |
| `gpg-health-check.sh` | Auditoria de estado | Lab + Produção | Diário/Semanal |
| `gpg-export-subkeys.sh` | Export no Tails offline | Operação sensível | Sob demanda |
| `gpg-import-subkeys.sh` | Import no host online | Reinstalação/restore | Sob demanda |

#### Anti-padrões que quebram automação

- Script sem `set -euo pipefail`.
- Exportar chave sem definir fingerprint alvo.
- Não testar restauração após backup.
- Rodar automação destrutiva sem ambiente de laboratório primeiro.
- Misturar artefatos de laboratório com produção no mesmo diretório.

#### Cabeçalho padrão para qualquer script novo

```sh
#!/bin/bash
# nome-do-script.sh
# Objetivo: <o que automatiza>
# Contexto: <lab|producao|offline>
# Pré-requisitos: gpg, age, pinentry, permissões ~/.gnupg
# Risco: <baixo|medio|alto>
# Rollback: <como desfazer se falhar>
set -euo pipefail
```

* * *

### APÊNDICE C: HARDWARE WALLETS + SMARTCARDS

| Opção | Segurança | Custo | Melhor uso |
| --- | --- | --- | --- |
| YubiKey (OpenPGP applet) | Muito alta | Médio/Alto | Produção, equipe técnica |
| Nitrokey | Alta | Médio | Usuário avançado com foco open |
| Smartcard PIV/OpenPGP | Alta | Variável | Corporações com política de identidade |
| Sem hardware (Tails+LUKS) | Alta (se bem operado) | Baixo | Curso/lab e operação pessoal disciplinada |

**Quando vale adotar hardware:**

- Quando você quer reduzir exposição de chave privada no endpoint.
- Quando há exigência de compliance/auditoria.
- Quando assina releases críticas com frequência.

**Quando não vale (ainda):**

- Se o processo básico de backup/revogação ainda não está maduro.
- Se o time ainda falha em disciplina operacional básica.

* * *

### APÊNDICE D: GPG EM PRODUÇÃO (Docker, CI/CD, K8s)

#### Padrões mínimos de produção

- Chaves separadas por ambiente (`dev`, `staging`, `prod`).
- Assinatura obrigatória em pipeline de release.
- Segregação de segredo (não embutir chave em imagem de container).
- Rotação periódica com trilha de auditoria.
- Execução de verificação criptográfica no CI.

#### Exemplo de verificação em CI (conceitual)

```sh
# pipeline stage: verify-signature
gpg --import team-release-public.asc
gpg --verify artifact.sig artifact.tar.gz
```

#### GitHub Actions (assinatura de release — esqueleto)

Coloque **apenas** material de assinatura em secrets (`GPG_PRIVATE_KEY`, política para passphrase). Prefira **subchave `[S]` de CI**, nunca a mestra.

```yaml
name: Sign Release
on:
  release:
    types: [created]
jobs:
  sign:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Import and sign
        env:
          GPG_PRIVATE_KEY: ${{ secrets.GPG_PRIVATE_KEY }}
          PASSPHRASE: ${{ secrets.GPG_PASSPHRASE }}
        run: |
          echo "$GPG_PRIVATE_KEY" | gpg --batch --import
          echo "$PASSPHRASE" | gpg --batch --passphrase-fd 0 \
            --detach-sign --armor --output artifact.tgz.asc artifact.tgz
```

#### Kubernetes e Sealed Secrets (visão geral)

Em clusters, é comum versionar **segredos cifrados** (ex.: recurso **SealedSecret** no ecossistema Bitnami/Kubernetes) para só o controlador interno decifrar — o manifesto no Git não expõe o plaintext. O formato exato depende da distribuição e do operador instalado; trate como **extensão** deste apêndice depois que backup/revogação **locais** estiverem maduros.

#### Containers e gpg-agent (laboratório)

Em pipeline/CI o padrão seguro é **segredo externo** (vault, secret do orchestrator) + GnuPG em modo **não interativo** (`--batch`, pinentry loopback onde for aceitável pela política). **Não** embutir material no Dockerfile.

Em laboratório, montar um diretório `gnupg/` no container pode funcionar para ensaios; **encaminhar socket** do `gpg-agent` do host para dentro do container é frágil entre sistemas — evite salvo PoC documentado.

```dockerfile
FROM ubuntu:24.04
RUN apt-get update \
 && apt-get install -y --no-install-recommends gnupg \
 && rm -rf /var/lib/apt/lists/*
RUN install -d -m 700 /root/.gnupg
# Opcional: COPY gpg.conf /root/.gnupg/gpg.conf
```

#### Checklist de operação segura

- [ ] Chave de produção nunca em máquina pessoal
- [ ] Logs de assinatura e verificação retidos
- [ ] Rotação definida com janela e responsável
- [ ] Procedimento de revogação ensaiado

* * *

### APÊNDICE E: GUIA MULTIPLATAFORMA

#### Windows (KeePassXC + SSH Agent)

```powershell
# gpg-import-subkeys.ps1 — Importa subchaves (VERSÃO INTERATIVA!)

$LetraPendrive = Read-Host "Digite APENAS a letra do seu Pendrive (Ex: D, E, F)"
$Pendrive = "${LetraPendrive}:\"

if (-not (Test-Path "${LetraPendrive}:\")) {
    Write-Host "[ERRO] Unidade não encontrada" -ForegroundColor Red
    exit
}

$files = @("sign.asc","encrypt.asc","auth.asc")
foreach ($file in $files) {
    $path = Join-Path $Pendrive $file
    if (Test-Path $path) { gpg --import $path }
}

# Configurar gpg-agent.conf
$confFile = "$env:APPDATA\gnupg\gpg-agent.conf"
Add-Content -Path $confFile -Value "enable-ssh-support"

gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

#### Linux (referência rápida de operação)

```sh
# validar ambiente
gpg --version | head -n1
gpg -K --with-subkey-fingerprints --keyid-format long

# assinatura e verificação
echo "linux-test" > linux-test.txt
gpg --detach-sign --armor linux-test.txt
gpg --verify linux-test.txt.asc linux-test.txt
```

#### Android (OpenKeychain)

```text
1) Instale OpenKeychain
2) Importe chave pública (ou subchaves quando aplicável)
3) Valide fingerprint por canal separado
4) Faça teste de assinatura/verificação em mensagem curta
5) Não use Android para guardar chave mestra
```

#### iPhone (Secure Enclave)

```
# No app Blink Shell:
blink> ssh-keygen -t ed25519 -C "iphone-seguro"
# A chave fica presa no Secure Enclave
# Precisa de FaceID/TouchID para usar
```

No mesmo espírito (chave **limitada**, sem mestra no telefone), cofres como **Strongbox** podem guardar entradas SSH ou reutilizar um `.kdbx` criado no KeePassXC — avalie **como** sincroniza o arquivo (LAN/Syncthing vs nuvem) antes de confiar no modelo.

#### SSH forte sem YubiKey (FIDO2/sk, agente com confirmação, cofre, hardware barato)

Use esta seção quando **não** estiver no fluxo **SSH via GPG + subchave `[A]`** (Módulo 5), mas quiser fugir de uma chave PEM “solta” em `~/.ssh` sem comprar hardware caro.

**1) OpenSSH + FIDO2 (`ed25519-sk`) — celular ou security key**

Gera um tipo de chave ligada a **dispositivo FIDO2** (telefone ou token). O modelo de ameaça deixa de ser “copiaram `id_ed25519`”.

```sh
ssh-keygen -t ed25519-sk -O resident -C "ssh-fido2-laboratorio"
```

O cliente vai pedir interação no dispositivo (USB/NFC/toque — conforme SO e hardware). Em **Windows**, fluxos como Windows Hello podem aparecer conforme política do ambiente.

> ⚠️ Teste primeiro em **laboratório**. Servidores OpenSSH muito antigos ou clients desatualizados podem falhar com `-sk`.

**2) `ssh-add -c` — confirmar cada uso da chave no agente**

Reduz uso **silencioso** da chave por processos não autorizados (malware pedindo SSH sem você perceber):

```sh
ssh-add -c ~/.ssh/id_ed25519
```

Combine sempre que possível com **passphrase** forte na própria chave (`ssh-keygen`).

**3) KeePassXC (desktop) + cofre no telefone**

No desktop o fluxo já está descrito neste apêndice. Em **iPhone**, apps como **Strongbox** podem ler o mesmo `.kdbx` — trate a **sincronização** do cofre como decisão de ameaça (Syncthing em LAN vs nuvem).

**4) Hardware open-source mais barato (ex.: SoloKeys)**

Alternativa comunitária à YubiKey para quem quer token físico; custo/importação variam. Só faz sentido **depois** de dominar backup e revogação (Módulo 3).

**Tabela decisória rápida** (complementa o Módulo 5 — não o substitui)

| Abordagem | Ganho principal | Custo / atrito |
| --- | --- | --- |
| **GPG + `[A]` + gpg-agent** (trilha do curso) | Uma identidade: PGP + Git + SSH | Curva de configuração |
| **`ed25519-sk` / FIDO2** | Chave ligada a hardware/plataforma | Compatibilidade, UX variável |
| **`ssh-add -c`** | Confirmação por operação | Mais interrupções na sessão |
| **KeePassXC / Strongbox** | Chaves fora de PEM à vista no disco | Segurança do cofre `.kdbx` |
| **YubiKey / Nitrokey / SoloKeys** | Chave não exportável do token | Dinheiro + disciplina física |

**Plano híbrido em três zonas (resumo operacional)**

- **Linux endurecido:** GPG, operações sensíveis, alinhado aos Módulos 0–6.  
- **Windows:** KeePassXC no dia a dia; opcionalmente **Windows Hello** (ou PIN forte) para abrir o cofre — segundo fator **local**.  
- **Telefone:** só chave **operacional/emergência** (Blink, cofre ou política definida por você); **nunca** mestra OpenPGP.

**Syncthing** (LAN/VPN) pode alinhar **só** o que você aceita duplicar — ver também o parágrafo de sincronização abaixo na matriz em camadas.

#### Matriz de interoperabilidade rápida

| Origem | Destino | Formato recomendado |
| --- | --- | --- |
| Linux -> Windows | Chave pública ASCII | `.asc` |
| Linux -> Android | Chave pública ASCII | `.asc` ou QR |
| Linux -> iPhone | Chave pública SSH/GPG | `.pub` / `.asc` |
| Tails -> Linux | Subchaves exportadas | `.asc` cifrado com `age` |

#### Modelo em camadas (Linux forte × desktop × mobile emergência)

Trilha de referência para operações **multi-dispositivo**: pensar em **zonas**, não em um único “PC que faz tudo”.

| Camada | Papel típico | Ferramenta |
| --- | --- | --- |
| 1 — Linux endurecido / airgap | Operações sensíveis, mestra ou SSH via subs `[A]` com política estrita | GPG nativo + disciplina do Módulo 6 |
| 2 — Windows (escritório) | Dia a dia, cofre + agent SSH quando aplicável | KeePassXC / Gpg4win (trechos acima) |
| 3 — Smartphone | Acesso pontual de emergência | Chave limitada (Secure Enclave / app); **sem** mestra |

**Sincronização sem nuvem comercial:** **Syncthing** (LAN/VPN) pode alinhar cofres ou artefatos entre seus dispositivos — exponha só o necessário e mantenha validação de fingerprints fora da banda principal.

**Recuperação:** o ensaio trimestral de restore (Módulo 3 / Checkpoint 3) vale também para cofres e exports entre camadas.

#### Regras multiplataforma (não quebrar segurança)

- Mestra sempre offline (Tails/LUKS), nunca no mobile.
- Mobile usa no máximo chave operacional limitada.
- Verificar fingerprint sempre fora da banda principal.
- Se houver dúvida de comprometimento, revogar e rotacionar.

* * *

### APÊNDICE F: MIGRAÇÃO RSA → ECC (LEGADO PARA MODERNO)

#### Quando migrar

- Você ainda usa chave RSA antiga (2048/4096) no dia a dia.
- Seu fluxo exige performance melhor de assinatura/verificação.
- Quer alinhar padrão atual: `ed25519/cv25519`.

#### Estratégia segura de migração (sem interrupção)

```sh
# 1) mantenha RSA ativa temporariamente (coexistência)
gpg --list-keys --keyid-format long

# 2) crie nova identidade ECC (ou nova hierarquia de subchaves ECC)
UID_NOVO="Seu Nome (ECC 2026) <seu@email>"
gpg --quick-generate-key "$UID_NOVO" ed25519 cert 3y
FP_NOVO=$(gpg --list-secret-keys --with-colons "$UID_NOVO" | awk -F: '/^fpr:/ {print $10; exit}')

# 3) adicione subchaves modernas
gpg --quick-add-key "$FP_NOVO" ed25519 sign 1y
gpg --quick-add-key "$FP_NOVO" cv25519 encr 1y
gpg --quick-add-key "$FP_NOVO" ed25519 auth 1y

# 4) publique a nova pública (WKD e canais oficiais)
gpg --export --armor "$FP_NOVO" > nova-chave-ecc.asc
```

#### Plano de corte (cutover)

1. Assine commits e artefatos com ECC por um período de transição.
2. Atualize servidores e contatos para nova fingerprint.
3. Revogue/aposente RSA quando todo ecossistema estiver migrado.

> ✅ **Resultado expert:** legado preservado, transição sem quebra e padrão alinhado a 2026+.

* * *

### Qualidade, ética e referências

#### CHECKLIST DE QUALIDADE DO CURSO (MANTENEDOR)

| Item de qualidade | Critério de aceite | Status |
| --- | --- | --- |
| Estrutura preservada | Mapa principal (0 a 6) intacto | [ ] |
| Progressão didática | Iniciante → intermediário → avançado → expert | [ ] |
| Coerência técnica | `[S]/[A]=ed25519` e `[E]=cv25519` em todo curso | [ ] |
| Segurança operacional | Mestra offline + backup 3-2-1 + revogação | [ ] |
| Integrações práticas | Git assinado + SSH via GPG funcionando | [ ] |
| Recuperação real | Simulação de desastre validada | [ ] |
| Futuro tecnológico | Pós-quântico e Sequoia com plano de transição | [ ] |
| Multiplataforma | Linux, Windows, Android e iPhone cobertos | [ ] |
| Apêndices completos | A a F com uso real | [ ] |
| Pronto para aluno | Linguagem clara, exercícios e rubricas em cada etapa | [ ] |

> ✅ Use esta grade de verificação antes de considerar **distribuição pública** (PDF, site, LMS). O curso já pode ser estudado na íntegra sem todos os itens marcados.

* * *

#### Ética do uso da criptografia forte

Criptografia forte protege comunicação legítima e dados sensíveis — jornalistas, ativistas, empresas e pessoas comuns. Com poder técnico vem responsabilidade: use para **defender** privacidade e integridade, não para prejudicar terceiros ou violar lei aplicável ao seu contexto.

* * *

#### Referências oficiais e leituras úteis

| Recurso | URL |
| --- | --- |
| Documentação GnuPG | https://www.gnupg.org/documentation/ |
| Wiki WKD | https://wiki.gnupg.org/WKD |
| Sequoia-PGP | https://sequoia-pgp.org |
| Sequoia `sq` — manual (entrada) | https://sequoia-pgp.gitlab.io/sequoia-sq/man/sq.1.html |
| Sequoia `sq` — guia do utilizador (livro) | https://sequoia-pgp.gitlab.io/user-documentation/ |
| SafeCurves (Bernstein) | https://safecurves.cr.yp.to |
| Diceware / dados — guia EFF | https://www.eff.org/dice |
| Tails | https://tails.net |

* * *

## Anexo (mantenedor): orientações editoriais

> Seção **opcional** para quem mantém o texto. **Quem só estuda pode ignorar.**

### Princípios

- **Um tópico, um lugar:** cada assunto do mapa deve estar completo na seção indicada; evitar repetir o mesmo parágrafo em vários módulos.
- **Legendas:** fluxos ou comandos antigos aparecem como 🔴 **OBSOLETO** ou 🟡 **LEGADO**, com aviso curto do risco.
- **Didática:** ordem sugerida nos blocos — *por quê* → *como fazer* → *comandos* → *validar* → *erros comuns*; dicas soltas viram checklist ou **Dica do professor** no fim do módulo.
- **Duplicação:** depois de editar, remover trechos repetidos neste próprio arquivo.
- **Revisões futuras:** manter **VERSÃO 1.0 canônica** neste único ficheiro; incrementos (1.0.1, 1.0.2…) no mesmo `.md`, com **mapa** e **cabeçalho** sempre coerentes com o corpo.

* * *

### Antes de commitar (sanidade rápida)

- **Título do Módulo 11 (PQ):** alguns editores substituem **ã** por **â** em «quântica». Procure por `QUÂNTICA` (U+00C2) e deixe **`PÓS-QUÃNTICA`** (U+00C3), como no mapa e no restante do texto em PT‑BR.
- **`$FP` / `$FP_MASTER`:** fingerprint pela linha `fpr:` (campo 10) só **depois** de filtrar identidade (`LAB_EMAIL`, `UID_MASTER`, `"$EMAIL"` no script bônus, etc.). Evite reintroduzir `gpg --list-secret-keys --with-colons | awk …` sem esse filtro se houver risco de mais de uma mestra.
- **Versões e URLs:** alterou Tails, ISO de download ou ramo experimental do GnuPG? Atualize **cabeçalho**, **checklist de ferramentas** e blocos `wget` / `gpg --verify` correspondentes. Em links novos, confirme com **HEAD** (`curl -I` no Linux; no Windows, `Invoke-WebRequest -Method Head`): o índice `…/sequoia-sq/man/` devolve **404** — use `…/man/sq.1.html` ou a [raiz do `sequoia-sq`](https://sequoia-pgp.gitlab.io/sequoia-sq/).

* * *

## 🏁 CONCLUSÃO

Você acabou de aprender:

- ✅ O que é GPG e por que você precisa  
- ✅ Como criar chaves mestras OFFLINE (segurança real)  
- ✅ Como separar subchaves \[S\]\[E\]\[A\] (o que profissionais fazem)  
- ✅ Como cifrar, decifrar, assinar e verificar  
- ✅ Como fazer backup 3-2-1 com age  
- ✅ Como integrar com Git e SSH  
- ✅ Como se recuperar de desastres  
- ✅ O que vem por aí (Kyber, Sequoia-PGP, roadmap 2030)

**📖 Lembre-se:** Você não nasceu sabendo. Todo expert começou como iniciante. A diferença é que um dia eles decidiram aprender.

**Agora é com você.** 🎓🔐

* * *

**Professor Especialista em Criptografia Aplicada**  
**Linux • Windows • Android • iPhone**  
**Maio de 2026**