![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=%C3%8Dndice%20da%20An%C3%A1lise&fontSize=36&fontAlignY=35&animation=twinkling)

![visitors](https://visitor-badge.laobi.icu/badge?page_id=Rede-ENois.smartcontracts.analise_readme)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](../../LICENSE)
![Language: Portuguese](https://img.shields.io/badge/Language-Portuguese-brightgreen.svg)
![Status](https://img.shields.io/badge/Status-Ongoing-yellow)
[![GitHub Issues](https://img.shields.io/github/issues/Rede-ENois/smartcontracts)](https://github.com/Rede-ENois/smartcontracts/issues)

# Análise do Sistema Econômico — Rede É Nóis

Esta pasta reúne a **análise funcional e econômica** do ecossistema de
cryptoativos da Rede É Nóis, derivada da proposta apresentada no
[`README.md`](../../README.md) do módulo `smartcontracts/`. Os documentos
descrevem **o que o sistema deve fazer e como ele deve ser desenvolvido** —
não representam contratos já implementados.

## Escopo da análise

- **Rede alvo inicial:** blockchain **Arc** (Layer-1 da Circle, compatível
  com EVM, com USDC como ativo nativo de taxas e finalidade em finanças de
  stablecoins).
- **Moedas de referência:** **USDC** (dólar) e **BRLA** (real brasileiro,
  ERC-20 emitida pela BRLA Digital).
- **Token utilitário:** **Faísca** (ERC-20, sem teto global de emissão,
  controlada por políticas e papéis autorizados). Migração **1:1** da moeda
  simbólica homônima já existente na Web 2 (média estimada de ~250 Faíscas
  por membro; referência interna sugerida de R$ 0,01 por Faísca).
- **Carteiras:** **Smart Accounts custodiadas** pela plataforma (modelo
  EIP-7702, chave privada exportável) além de carteiras EVM próprias.
- **NFTs de reconhecimento e utilidade:** compatíveis com MetaMask,
  entregues como premiação (perfil completo, admin de comunidade, membro
  mais ativo do período, entre outros) e com coleções que podem gerar
  premiações em Faísca. O subsistema é **totalmente plugável**: novos
  domínios de NFT — jogos **GameFi**, coleções parceiras — entram por
  registro no `NFTRegistry` (interface `INFTModule`), sem alterar os
  contratos existentes. Os jogos movimentam a rede e monetizam criadores e
  jogadores, que podem **alugar seus NFTs** pelo `NFTRental` (direito de
  uso temporário, ERC-4907) com divisão de receita on-chain entre locador,
  criador e rede.
- **Tesouraria:** centro financeiro da rede, com **adapters acopláveis**
  para estratégias de investimento e para serviços/produtos vendidos no
  site, e **corredor fiat ⇄ tesouraria** para capital próprio da
  administração (aportes para investimento em cripto e repasses a fiat).

## Documentos

| Documento | Conteúdo |
|---|---|
| [01 — Visão Geral](01-visao-geral.md) | Contexto, atores, componentes, fluxos econômicos, segregação patrimonial e roadmap. |
| [02 — Glossário](02-glossario.md) | Terminologia do ecossistema: tokens, DeFi, governança, NFTs e segurança. |
| [03 — Requisitos](03-requisitos.md) | Requisitos funcionais (RF) e não funcionais (RNF) rastreáveis, por módulo. |
| [04 — Arquitetura](04-arquitetura.md) | Constelação de contratos, diagramas de classes e componentes, papéis e upgradeabilidade. |
| [05 — Casos de Uso](05-casos-de-uso.md) | Um capítulo por caso de uso, com diagrama e descrição. |
| [06 — Diagramas de Sequência](06-diagramas-sequencia.md) | Um capítulo por fluxo, com diagrama de sequência e descrição. |
| [07 — Normas ERC](07-normas-erc.md) | Cada padrão ERC adotado, seu papel no sistema e cuidados de implementação. |
| [08 — Levantamento Faísca Web 2](08-levantamento-web2-faisca.md) | Modelo contábil e inventário dos fluxos reais da Faísca na Web 2, com mapeamento para a Web 3. |
| [09 — Howey e Valores Mobiliários](09-teste-howey-valores-mobiliarios.md) | Análise preliminar Brasil/EUA por operação, defesa condicionada, riscos, evidências e gate regulatório RF-REG; não substitui parecer jurídico. |

## Conversão para PDF

Os documentos podem ser convertidos em PDF com os diagramas Mermaid
renderizados como imagens, usando os scripts da pasta
[`scripts/docs/`](../../scripts/docs):

```bash
# instala as dependências do toolchain (mermaid-cli via NVM/Node 22)
./scripts/docs/install-docs-toolchain.sh

# converte todos os .md de docs/analise em PDFs em docs/analise/pdf/
./scripts/docs/md-to-pdf.sh docs/analise docs/analise/pdf
```

## Convenções

- Todos os diagramas usam [Mermaid](https://mermaid.js.org/) e são renderizáveis
  no GitHub e no pipeline de PDF.
- Requisitos carregam identificadores estáveis (`RF-*`, `RNF-*`) para
  rastreabilidade em testes e auditoria.
- Parâmetros econômicos citados (taxas, quóruns, limites) são **propostas**
  sujeitas a simulação, governança e revisão de segurança — mesma ressalva
  do `README.md` principal.

## Changelog

| Data | Versão | Descrição |
|---|---|---|
| 2026-10-24 | 0.6.0 | Doc 09: análise Howey/CVM Brasil/EUA e defesa condicionada; requisitos RF-REG para revisão e aprovação. |
| 2026-10-23 | 0.1.0 | Estrutura inicial da análise do sistema econômico. |
| 2026-10-23 | 0.2.0 | Migração Faísca Web2 1:1 e Smart Accounts (EIP-7702) no escopo; diagramas coloridos pela paleta padrão. |
| 2026-10-23 | 0.3.0 | Corredor fiat ⇄ tesouraria no escopo: novo módulo de requisitos RF-FIA, UC-18 e SD-13. |
| 2026-10-23 | 0.4.0 | Subsistema de NFTs plugável no escopo: `NFTRegistry` + `INFTModule`, módulo de requisitos RF-GAM (GameFi, aluguel ERC-4907, splits), UC-19/UC-20 e SD-14/SD-15. |
| 2026-10-23 | 0.5.0 | Levantamento da Faísca Web 2: doc 08 (economia real: P2P, escrow marketplace/serviços, jogos, disputas); módulo RF-ESC; UC-21..UC-25; SD-16..SD-18; decisões D-11..D-13. |

![footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer&animation=twinkling)
