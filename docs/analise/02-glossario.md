![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=Gloss%C3%A1rio&fontSize=36&fontAlignY=35&animation=twinkling)

![visitors](https://visitor-badge.laobi.icu/badge?page_id=Rede-ENois.smartcontracts.analise_glossario)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](../../LICENSE)
![Language: Portuguese](https://img.shields.io/badge/Language-Portuguese-brightgreen.svg)
![Status](https://img.shields.io/badge/Status-Ongoing-yellow)
[![GitHub Issues](https://img.shields.io/github/issues/Rede-ENois/smartcontracts)](https://github.com/Rede-ENois/smartcontracts/issues)

# 02 — Glossário

Terminologia adotada na análise do sistema econômico da Rede É Nóis. Os
termos seguem o uso do [`README.md`](../../README.md) do módulo; quando um
termo tem significado técnico específico (padrões ERC, fórmulas do swap), a
definição aqui é a que vale para os requisitos e casos de uso.

## Tokens e moedas

| Termo | Definição |
|---|---|
| **Faísca (FAISC/FSK — símbolo a definir)** | Token fungível de utilidade da Rede É Nóis, implementado como ERC-20. Sem teto global de emissão; mint e burn restritos a papéis autorizados e políticas auditáveis. Não é stablecoin, participação societária nem promessa de rendimento. |
| **Faísca Web2 (legado)** | Moeda simbólica homônima que já existe na plataforma Web 2, acumulada por participação. Será migrada 1:1 para a criptomoeda Faísca. Estimativa de trabalho: média de ~250 Faíscas por membro; referência interna sugerida de R$ 0,01 por Faísca (referência, não paridade garantida). |
| **Migração 1:1** | Fluxo de claim em que cada unidade de Faísca Web2 elegível vira uma unidade de Faísca on-chain, com autorização assinada, anti-duplicidade e janela definida por governança. |
| **USDC** | Stablecoin da Circle referenciada em dólar americano (ERC-20). Na Arc, é também o ativo nativo de taxas. Ativo de reserva do swap e principal numerário da tesouraria. Sujeita a riscos do emissor (desvinculação, restrições). |
| **BRLA** | Stablecoin ERC-20 referenciada em real brasileiro, emitida pela BRLA Digital. Canal de entrada para o público brasileiro e unidade de preço de produtos/serviços em reais. |
| **Stablecoin** | Token que busca manter paridade com uma moeda fiduciária. A paridade é política do emissor, não garantia do projeto. |
| **NFT** | Token não fungível — representa conquistas, funções, colecionáveis e itens de jogos da rede. |
| **Soulbound / intransferível** | NFT cuja transferência é bloqueada no contrato (não apenas ocultada na interface), por política da coleção. |
| **Edição (NFT)** | Conjunto de unidades idênticas de um mesmo NFT — ex.: várias unidades da conquista "Perfil Completo". Padrão natural: ERC-1155. |
| **Token ID** | Identificador de um tipo/edição de NFT dentro de uma coleção. |

## Rede e infraestrutura

| Termo | Definição |
|---|---|
| **Arc** | Layer-1 da Circle voltada a finanças de stablecoins; compatível com EVM, finalidade determinística, USDC como ativo nativo de gas. Rede inicial do ecossistema. |
| **EVM** | Ethereum Virtual Machine — ambiente de execução dos contratos Solidity. Compatibilidade EVM permite portar o ecossistema a outras redes. |
| **Gas** | Taxa paga para executar transações. Na Arc, denominada em USDC. |
| **Mainnet / Testnet** | Rede de produção / rede de testes. Nenhum contrato vai à mainnet antes de testnet + auditoria. |
| **Carteira (wallet)** | Software que guarda chaves e assina transações; MetaMask é a referência para exibição de NFTs. |
| **Smart Account** | Conta inteligente do membro custodiada pela plataforma, criada junto ao perfil Web 2; combina UX sem fricção com recursos de conta programável. Chave privada exportável — o membro pode assumir a autocustódia a qualquer momento. |
| **EIP-7702** | Padrão que permite a uma EOA delegar a execução a código de smart account (transação tipo 0x04). Modelo de referência das Smart Accounts custodiadas: mantém portabilidade de EOA com recursos de conta inteligente (gas patrocinado, lote, regras de sessão). Depende de suporte da rede e das carteiras. |
| **Carteira custodiada** | Conta cujas chaves são guardadas pela plataforma como facilitação de entrada; distinta de autocustódia. Na É Nóis a custódia é transitória por desenho: a chave é exportável. |
| **ContractRegistry** | Contrato de descoberta de endereços do ecossistema; elimina endereços hardcoded fora da cadeia. |

## Swap e liquidez

| Termo | Definição |
|---|---|
| **AMM** | Automated Market Maker — formador automatizado de mercado que precifica trocas por fórmula, não por livro de ofertas. |
| **Produto constante (`k = x·y`)** | Invariante do swap: `x` (reserva de Faísca) × `y` (reserva de USDC) permanece constante numa troca ideal sem taxas. |
| **Preço marginal (`p = y/x`)** | Preço indicativo em USDC por Faísca antes de taxas e impacto da ordem. |
| **Taxa de negociação (`f`)** | Percentual retido sobre o ativo de entrada, `0 ≤ f < 1`, definido por governança. Permanece na reserva e amplia `k`. |
| **Impacto no preço (price impact)** | Diferença entre o preço marginal e o preço médio efetivo de uma ordem; cresce com o tamanho da ordem. |
| **`minOut` / `deadline`** | Valor mínimo de saída aceito e prazo de validade da troca — proteções contra slippage e MEV. |
| **Liquidez** | Profundidade das reservas disponíveis para trocas. Vendas de Faísca só pagam conforme a reserva de USDC existente. |
| **Oráculo** | Fonte de preços externa. A cotação instantânea do próprio swap **não** é oráculo confiável (manipulável, exposta a MEV). Nesta fase, a fonte de referência do swap é a pool da **Uniswap v4** (ver RF-SWP-13). |
| **TWAP** | Time-Weighted Average Price — média de preços ponderada pelo tempo a partir das observações acumuladas de uma pool; resiste a manipulação de bloco único, ao contrário do preço spot. |
| **Arbitragem circular** | Comprar onde o preço está menor e revender onde está maior, em ciclo entre dois mercados (swap⇄DEX), drenando a reserva do lado mais barato até a paridade; mitigada ancorando o swap ao oráculo da DEX (RF-SWP-14). |
| **MEV** | Maximal Extractable Value — reordenação/inserção de transações por quem produz blocos para capturar valor. |

## Tesouraria e investimentos

| Termo | Definição |
|---|---|
| **Tesouraria (Treasury)** | Contrato central de coordenação financeira: recebe recursos, segrega finalidades e executa decisões da governança. |
| **Caixa operacional** | Parcela da tesouraria para despesas correntes e orçamento de premiações. |
| **Reserva do swap** | Parcela segregada destinada exclusivamente às reservas `x` e `y` do AMM. |
| **Capital de investimento** | Parcela autorizada pela governança para aplicação via adapters. |
| **Corredor fiat ⇄ tesouraria** | Canal bidirecional para movimentar capital próprio da administração entre o financeiro fiat (off-chain) e a `Treasury` (on-chain): aportes viram cripto por canal aprovado (ex.: compras quando os preços estão competitivos para investimento) e saídas viram fiat via off-ramp para contas registradas. Cada movimentação é operação de governança, com evento auditável e reconciliação contábil. |
| **Financeiro fiat da administração** | Contas e registros fiduciários da administração da rede — contraparte off-chain do corredor fiat. Distinto dos recursos de usuários e das finalidades segregadas da tesouraria. |
| **Adapter** | Contrato plugável que adapta a interface da tesouraria a um protocolo ou produto externo (padrão Adapter/Strategy). Entra e sai por decisão da governança. |
| **Vault ERC-4626** | Padrão de cofre tokenizado: deposita-se um ativo, recebe-se shares proporcionais; resgata-se ativo subjacente. |
| **Allowlist** | Lista de adapters/protocolos aprovados; só o que está nela recebe capital. |
| **Limite de exposição** | Teto de capital por protocolo, ativo e estratégia, definido por governança. |
| **Plano de saída** | Procedimento de desinvestimento e contingência de cada adapter (prazos, filas, perdas possíveis). |

## Governança e segurança

| Termo | Definição |
|---|---|
| **Multisig** | Carteira/contrato que exige `M` de `N` assinaturas para executar ações. Na É Nóis: `M = teto(2N/3)` sobre o **total** de signatários. |
| **Signatário** | Detentor de uma das `N` chaves do multisig. Abstenção não reduz quórum. |
| **Timelock** | Atraso obrigatório on-chain (≥ 48h) entre aprovação e execução de mudanças sensíveis; permite reação da comunidade. |
| **Pausa emergencial** | Mecanismo restrito que suspende operações de risco; **não** pode sacar, fazer upgrade ou retomar irrestritamente. |
| **Papel (role)** | Permissão nomeada no controle de acesso (ex.: `MINTER_ROLE`). Poder administrativo não decorre de possuir Faísca ou NFT. |
| **Proxy / Upgrade** | Padrão que separa endereço/estado (proxy) de lógica (implementação), permitindo atualizar o código sob governança. |
| **Diamond (ERC-2535)** | Proxy modular com "facets" — múltiplas implementações por trás de um único endereço. |
| **UUPS (ERC-1822/ERC-1967)** | Padrão de proxy em que a autorização de upgrade vive na própria implementação. |
| **Reentrância** | Ataque em que uma chamada externa reentra na função antes da atualização de estado; mitigado por `ReentrancyGuard` e checks-effects-interactions. |
| **Replay** | Reaproveitamento de uma assinatura/autorização válida; mitigado por nonce, deadline e domínio (EIP-712). |
| **Front-running** | Execução antecipada à transação alheia para lucrar com seu efeito; relevante no resgate de NFTs e no swap. |

## Premiações e participação

| Termo | Definição |
|---|---|
| **Premiação** | Concessão de Faísca por participação ou contribuição reconhecida, dentro de orçamento e limites por período. |
| **Gratificação por doação** | Faísca atribuída a doadores conforme regra pública de campanha; proporcionalidade definida pela administração. |
| **Serviço de comprovação** | Backend que valida participação/elegibilidade e emite autorizações assinadas (EIP-712), sem publicar dados pessoais on-chain. |
| **Anti-duplicidade** | Mecanismos (nonce, registro de claims) que impedem receber duas vezes a mesma premiação. |
| **Resgate em evento** | Distribuição de edição de NFT a quem apresenta código/assinatura válida, limitada a `X` unidades — "primeiros" definidos pela ordem on-chain. |
| **Claim** | Ação do usuário de reivindicar premiação/NFT autorizada; alternativa a envio proativo. |
| **Snapshot elegível** | Registro de quem detinha um NFT/edição em altura definida, base para premiações em Faísca a colecionadores. |

## Módulos de NFT e GameFi

| Termo | Definição |
|---|---|
| **Domínio / módulo de NFT** | Contrato de NFT plugável registrado no `NFTRegistry` — as conquistas comunitárias (`EnoisNFT`), um jogo GameFi ou uma coleção parceira. Cada módulo implementa `INFTModule` e opera sob política própria. |
| **INFTModule** | Interface mínima e estável que todo módulo de NFT implementa: emissão autorizada, metadados, políticas e *capabilities* declaradas. Permite adicionar domínios sem alterar contratos existentes. |
| **NFTRegistry** | Registro/allowlist de módulos de NFT gerido pela governança (multisig + timelock); fonte de descoberta dos domínios ativos para frontend, marketplace e `RewardsDistributor`. |
| **Capabilities** | Características que um módulo declara no registro — ex.: transferível, soulbound, alugável, royalties — permitindo ao sistema tratar cada domínio conforme sua política. |
| **GameFi** | Jogos hospedados na plataforma cujos itens (personagens, equipamentos, passes, terrenos) são NFTs; movimentam a rede, monetizam criadores e geram renda a jogadores. |
| **Criador (studio)** | Desenvolvedor do jogo ou coleção; beneficiário das políticas comerciais do seu domínio (venda primária, comissão de aluguel, royalties). |
| **Aluguel de NFT** | Concessão temporária do direito de uso de um item, sem transferência de titularidade nem depósito de garantia; expira automaticamente no prazo on-chain. |
| **Direito de uso (user right)** | Papel de "usuário" do NFT com data de expiração, conforme a **ERC-4907** (ou mecanismo equivalente): separa quem é dono de quem pode usar. |
| **Locador / locatário** | Dono do NFT que o disponibiliza para aluguel / quem adquire o direito de uso temporário. |
| **Split de receita** | Divisão automática e on-chain da receita de vendas e aluguéis entre locador, criador e rede (tesouraria), por política pública do domínio. |
| **NFTRental** | Módulo de mercado de aluguel: listagens assinadas, cobrança em Faísca/USDC/BRLA, concessão do direito de uso e splits liquidados no ato. |

## Economia Web 2 (legado)

| Termo | Definição |
|---|---|
| **Ledger append-only / hash-chain** | Livro-razão da Faísca Web 2 (`coin_entries`): lançamentos imutáveis encadeados por hash em cada conta; o saldo é snapshot reconstruível. |
| **Mili-faísca** | Unidade mínima da Faísca Web 2 (1/1000); valores internos em milésimos (ex.: boost = 5.000 mf = 5 Faíscas). |
| **Tesouraria Web 2 / sink** | Conta de supply fixo (2M emitidos no genesis) que paga todas as premiações e recebe os gastos-sink (loja, boost, gasto em jogo). |
| **Airdrop** | Crédito inicial de 100 Faíscas debitado da tesouraria a cada membro novo. |
| **Presença diária** | Premiação recorrente (+5/dia, bônus +25/semana) debitada da tesouraria. |
| **Escrow contábil** | Retenção de Faísca na compra (marketplace/serviços) como estado do ledger; no Web 3 vira custódia real do `FaiscaEscrow`. |
| **Contestação / disputa** | Reclamação de transferência ou compra na janela de 7 dias, decidida por administração (Web 2) ou por árbitro multisig (Web 3). |
| **Boost** | Impulso pago de jogo: 5 Faíscas por 7 dias no topo do catálogo, um por semana por jogo. |
| **requestId / refId idempotente** | Identificador único por requisição (ex.: `game:{id}:{requestId}`, `boost:{g}:{semana}`) que impede cobrança duplicada. |
| **playerRef / identidade pseudônima de jogo** | Pseudônimo estável por (usuário, jogo) gerado por HMAC — o jogo externo nunca recebe a sessão da plataforma. |
| **Cotação de referência** | Valor publicado pela administração (ref. R$ 0,01/Faísca) para exibição e precificação — **declaradamente não é câmbio**. |
| **Disputa arbitral** | Versão Web 3 da contestação: decisão por `DISPUTE_ADMIN_ROLE` sobre fundos custodiados em `DISPUTED`, limitada a release ou refund. |

## Integrações externas citadas

| Termo | Definição |
|---|---|
| **Circle Mint / on-ramp** | Serviços do ecossistema Circle para emitir/adquirir USDC; integração e elegibilidade a confirmar — nenhum acesso é presumido. É também a perna de entrada fiat→cripto do corredor fiat ⇄ tesouraria. |
| **Off-ramp** | Conversão de cripto em moeda fiduciária; serviço separado, não garantido pelo projeto. No corredor fiat, é o trilho de saída cripto→fiat para as contas registradas da administração. |
| **Aave, Morpho** | Protocolos de empréstimo/rendimento candidatos a adapters de investimento. |
| **xStocks, Ondo, Dinari (dShares), Securitize** | Produtos de ativos reais (RWA) candidatos a adapters; cada um com requisitos próprios de elegibilidade e jurisdição. |
| **MetaMask** | Carteira EVM de referência para conexão dos usuários e exibição de NFTs. |

## Changelog

| Data | Versão | Descrição |
|---|---|---|
| 2026-10-23 | 0.1.0 | Versão inicial do glossário. |
| 2026-10-23 | 0.2.0 | Termos de migração (Faísca Web2, migração 1:1) e carteiras (Smart Account, EIP-7702, custodiada). |
| 2026-10-23 | 0.3.0 | Termos de oráculo de preço: TWAP, arbitragem circular e referência à Uniswap v4 como fonte de preço do swap. |
| 2026-10-23 | 0.4.0 | Termos do corredor fiat ⇄ tesouraria e do financeiro fiat da administração; on/off-ramp contextualizados como pernas do corredor. |
| 2026-10-23 | 0.5.0 | Nova seção "Módulos de NFT e GameFi": INFTModule, NFTRegistry, capabilities, aluguel (ERC-4907), split de receita e NFTRental. |
| 2026-10-23 | 0.6.0 | Nova seção "Economia Web 2 (legado)": ledger/hash-chain, mili-faísca, escrow contábil, contestação, boost, playerRef, cotação de referência — termos do levantamento do doc 08. |

![footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer&animation=twinkling)
