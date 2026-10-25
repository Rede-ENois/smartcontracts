![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=Howey%20e%20Valores%20Mobili%C3%A1rios&fontSize=36&fontAlignY=35&animation=twinkling)

![visitors](https://visitor-badge.laobi.icu/badge?page_id=Rede-ENois.smartcontracts.analise_howey)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](../../LICENSE)
![Language: Portuguese](https://img.shields.io/badge/Language-Portuguese-brightgreen.svg)
![Status](https://img.shields.io/badge/Status-Ongoing-yellow)
[![GitHub Issues](https://img.shields.io/github/issues/Rede-ENois/smartcontracts)](https://github.com/Rede-ENois/smartcontracts/issues)

# 09 — Teste de Howey e valores mobiliários: defesa condicionada da proposta

## 1. Finalidade, escopo e conclusão executiva

Este documento aplica critérios de caracterização de valores mobiliários à proposta econômica descrita nos [requisitos](03-requisitos.md), para orientar sua defesa técnica, a revisão jurídica e as decisões de governança no **Brasil e nos Estados Unidos**, separadamente.

**Data-base da pesquisa: 24/10/2026.** Trata-se de análise técnico-regulatória preliminar, não de parecer jurídico, autorização para oferta, aprovação da CVM/SEC ou certificação de não enquadramento. Os contratos próprios ainda não estão implementados: evidência de requisito não equivale a evidência de comportamento em produção. O [levantamento Web2](08-levantamento-web2-faisca.md) é um snapshot documental, não uma auditoria jurídica ou verificação atual da produção.

**Tese defensiva:** é defensável estruturar reconhecimento comunitário, consumo de funcionalidades, aquisição de bens/serviços e uso de itens de jogo sem conferir participação nos resultados de um empreendimento. Essa tese exige utilidade demonstrada, comunicação coerente e análise dos direitos e incentivos efetivos de cada operação. Ela **não permite concluir que todo o ecossistema está fora do mercado de valores mobiliários**.

Os pontos de maior atenção são: gratificação proporcional a doações, compra de Faísca em USDC, premiação recorrente por mera posse de NFT, venda de NFTs associada à expectativa de receita de aluguel e gestão de tesouraria/liquidez apresentada como fonte de valorização. Ausência de rendimento garantido não significa ausência de expectativa de lucro.

**Recomendação:** aprovar a continuidade da concepção e da validação; não liberar ofertas ou fluxos econômicos reais com base apenas neste texto. Aplicar o gate de [RF-REG](03-requisitos.md#17-conformidade-e-caracterização-regulatória-rf-reg), com revisão profissional por jurisdição, cenário e público-alvo. Se houver enquadramento, definir o caminho regulatório aplicável antes da oferta, em vez de apenas mudar sua descrição.

## 2. Método e limites das conclusões

1. Identificar ativo, ofertante, adquirente, contraprestação, direitos, fontes de receita e atividades esperadas de cada parte.
2. Separar ativo, campanha/oferta, contrato associado e negociação secundária; examinar também a combinação entre esses elementos.
3. Aplicar os elementos de cada jurisdição aos fatos, inclusive termos, publicidade, canais de venda e promessas atribuíveis ao ofertante.
4. Registrar fatos favoráveis, contrapontos, lacunas e evidências de implementação; submeter as conclusões ao responsável jurídico.
5. Reavaliar mudanças materiais e novas ofertas. Alterações não autorizam conclusões retroativas automáticas sobre transações anteriores.

As matrizes usam **P** (presente no desenho), **C** (condicional aos fatos/termos) e **ND** (não demonstrado na documentação). ND não significa ausente. O risco qualitativo é prioridade de revisão, não probabilidade estatística nem resultado jurídico. Os elementos são cumulativos no teste aplicável, não pontos que se somam. A análise de outras categorias legais precede qualquer conclusão restrita ao contrato de investimento.

## 3. Brasil — Lei 6.385/1976 e CVM

### 3.1. Regra de enquadramento

O art. 2º da Lei 6.385/1976 inclui categorias específicas de valores mobiliários e, no inciso IX, títulos ou contratos de investimento coletivo ofertados publicamente que gerem direitos de participação, parceria ou remuneração, inclusive decorrente de serviços, cujos rendimentos advenham do esforço do empreendedor ou de terceiros [B1]. Portanto, afastar o CIC não afasta automaticamente outras categorias legais, derivativos ou representações digitais de valores mobiliários.

O Parecer de Orientação CVM 40 adota abordagem funcional: a denominação token de utilidade, pagamento ou NFT não determina, isoladamente, o tratamento. Sua seção 4.1 reconhece a inspiração em Howey, mas ressalva que Brasil e EUA podem chegar a resultados distintos [B2].

### 3.2. Seis elementos do CIC

| Elemento | Pergunta aplicada à proposta | Evidência necessária |
|---|---|---|
| Investimento | Há aporte de dinheiro ou bem economicamente avaliável? USDC e uma doação com contrapartida precisam de exame material. | Origem, quantidade e destino da contraprestação; termos da campanha. |
| Formalização | Qual título, contrato ou relação vincula participante e ofertante? A forma digital não afasta o elemento. | Termos, autorizações, contratos, políticas e direitos efetivos. |
| Caráter coletivo | Os interesses econômicos dos participantes estão vinculados ao mesmo empreendimento? | Fluxos de recursos, dependência econômica e relações entre participantes. |
| Benefício econômico esperado | A aquisição é promovida para consumo ou para remuneração/valorização? | Marketing, direitos, modelo de premiação e expectativas criadas. |
| Esforços de empreendedor/terceiros | De quais atividades depende o benefício? Ações pouco expressivas do participante não bastam para afastá-lo. | Responsabilidades da equipe, criadores, governança e participantes. |
| Oferta pública | Como se procura alcançar o público? Uma página pública pode ser relevante, mas não resolve sozinha o enquadramento. | Canais, público-alvo, campanhas e forma de distribuição. |

A automação por smart contract não elimina o exame de esforços humanos, políticas de emissão, seleção de jogos, liquidez, upgrades ou gestão de investimentos. Multisig e timelock são controles de segurança, não prova de ausência de empreendedor.

### 3.3. Matriz brasileira por cenário

Legenda das colunas: **I** investimento; **F** formalização; **C** caráter coletivo; **B** benefício econômico; **E** esforços de terceiros; **O** oferta pública. A avaliação refere-se ao arranjo econômico, não apenas ao token.

| Cenário e requisitos | I | F | C | B | E | O | Defesa, contraponto e condição de aprovação |
|---|---|---|---|---|---|---|---|
| Migração 1:1 — RF-MIG | C | P | C | C | C | C | Continuidade de saldo para uso, sem novo aporte obrigatório, favorece a defesa. A origem do saldo e as novas possibilidades de venda devem ser verificadas. Revisar direitos anteriores/novos, snapshot e comunicação. Risco: moderado. |
| Participação/airdrop — RF-PRE-01/09/10 | C | P | C | C | C | C | Reconhecimento por atividade comprovada favorece uso comunitário. Verificar eventual contraprestação e se a atividade é apenas acessória a investimento. Exigir regras, comprovação e orçamento. Risco: moderado. |
| Compra no swap — RF-SWP | P | P | C | C | C | C | Compra para consumo e ausência de direito patrimonial ajudam. Não afastam expectativa de valorização apoiada na gestão da rede. Examinar oferta, liquidez e discurso de preço. Risco: elevado para revisão. |
| Doação gratificada — RF-PRE-05 | P | P | C | C | C | C | Apoio sem direito a resultados é argumento defensivo. Gratificação proporcional pode funcionar como aquisição econômica de token. Classificar cada campanha antes de divulgar ou receber recursos. Risco: elevado. |
| NFT de conquista sem renda — RF-NFT-03/08 | C | P | C | C | C | C | Credencial por participação, sobretudo intransferível, reforça reconhecimento. Pagamento associado ou benefício financeiro pode alterar o arranjo. Verificar aquisição, direitos e restrições reais. Risco: menor, condicionado. |
| NFT comprável com prêmio por posse — RF-NFT-09; RF-PRE-08 | P | P | C | C | C | C | Benefício de uso não exclui remuneração passiva. Exigir análise da fonte, recorrência e dependência de gestão; não ativar a política sem aprovação jurídica. Risco: elevado. |
| GameFi/aluguel — RF-GAM-06/07/09/12/13 | C | P | C | C | C | C | Pagamento por uso efetivo ou desempenho é distinto de promessa de retorno. Venda com exploração gerida por terceiros pode formar CIC. Separar venda, locação, serviço e premiação. Risco: elevado quando vendidos como fonte de renda. |
| Tesouraria/adapters — RF-TRS; RF-FIA; RF-ADT | C | P | C | C | P | C | Investimento de patrimônio próprio sem direitos aos titulares favorece separação. Origem em doações, vinculação de receitas ou publicidade de valorização exigem exame adicional. Comprovar titularidade e destinação. Risco: elevado se associado à oferta de tokens. |
| Marketplace/escrow — RF-ESC | P | P | C | C | C | C | Preço por entrega concreta e remuneração por trabalho sustentam relação comercial. Não presumir que toda receita é rendimento de investimento. Excluir promessas de resultado e revisar itens de investimento eventualmente listados. Risco: menor para comércio comum, condicionado ao objeto. |

## 4. Estados Unidos — Howey e interpretação de 2026

### 4.1. Bases e atualização

Em **SEC v. W. J. Howey Co., 328 U.S. 293 (1946)**, a Suprema Corte examinou o contrato, transação ou esquema econômico, não apenas o bem vendido [U1]. Para exposição, decompõe-se o teste em quatro componentes: investimento de dinheiro, empreendimento comum, expectativa de lucros e esforços de terceiros. A interpretação SEC de 2026 também o apresenta em três elementos, agrupando os dois últimos; não se trata de testes diferentes [U2, nota 7].

A Release **33-11412 / 34-105020**, publicada no Federal Register em 23/03/2026, com eficácia nessa data, contém interpretação da SEC e orientação correlata da CFTC [U2]. É posição administrativa, não alteração do texto legal nem substituição de precedente judicial. Sua nota 21 declara que substitui o framework do staff de 03/04/2019. Não se usa aqui o documento de 2019 como orientação administrativa vigente.

A seção III diferencia digital commodities, digital collectibles, digital tools, stablecoins e digital securities. Uma credencial ou item de jogo não recebe automaticamente o tratamento de digital tool/collectible: é necessário demonstrar as características descritas na interpretação. A seção III.E ressalva que benefícios não financeiros não retiram a natureza de security de um instrumento que tenha suas características econômicas.

A seção IV.A distingue o ativo não mobiliário do contrato de investimento ao qual pode estar sujeito: são relevantes representações ou promessas do emissor de esforços gerenciais essenciais dos quais o comprador razoavelmente espere lucros. Examina conteúdo, atribuição, momento e canais de comunicação. A análise não se reduz a encontrar uma frase de garantia de retorno. Tampouco se deve equiparar qualquer manutenção técnica ou efeito de rede a esforço gerencial essencial: a própria seção IV.A faz distinções que precisam ser aplicadas aos fatos.

### 4.2. Aplicação dos componentes

| Componente | Aplicação e limites |
|---|---|
| Investimento | A troca por USDC envolve contraprestação econômica; não se limita a dólares em espécie. Migração e distribuições sem pagamento precisam de análise própria, inclusive da seção VII de U2 sobre airdrops cobertos, sem estender sua conclusão automaticamente a premiações, serviços ou doações gratificadas. |
| Empreendimento comum | Examinar comunhão de interesses e a jurisprudência aplicável. Uma mesma blockchain ou um pool AMM não prova, isoladamente, common enterprise; segregação contábil também não o afasta por si. U2, nota 7, confirma a necessidade do elemento. |
| Expectativa de lucros | Investigar ganhos esperados, receitas e valorização ligada às representações da oferta. Uso consumptivo favorece a defesa, mas utilidade misturada a investimento exige exame do conjunto. |
| Esforços de terceiros | Identificar esforços gerenciais essenciais prometidos/representados pelo emissor ou por quem atua em seu nome. Separar gestão empresarial, operação técnica, efeitos de rede e desempenho do usuário; automação e multisig não resolvem a distinção. |

**Oferta pública não é um quinto elemento de Howey.** Primeiro caracteriza-se o instrumento/arranjo; depois se examinam oferta/venda, alcance territorial, registro ou isenção e obrigações aplicáveis. Oferta privada não é sinônimo de ativo não mobiliário. Acesso pela internet não demonstra, sozinho, incidência territorial norte-americana; o jurídico deve verificar público, solicitações, distribuição e transações efetivas.

### 4.3. Matriz norte-americana por cenário

Legenda: **I** investimento; **C** empreendimento comum; **L** expectativa de lucros; **E** esforços gerenciais essenciais de terceiros. São hipóteses documentais sujeitas à jurisprudência e aos fatos da oferta.

| Cenário e requisitos | I | C | L | E | Defesa, contraponto e condição de aprovação |
|---|---|---|---|---|---|
| Migração 1:1 — RF-MIG | C | C | C | C | Ausência de novo pagamento e continuidade de utilidade ajudam, mas não demonstram ausência de contrato associado. Verificar origem dos saldos e representações da migração. Risco: moderado. |
| Participação/airdrop — RF-PRE | C | C | C | C | Conferir se a distribuição efetivamente cabe na seção VII de U2; rótulo airdrop não basta. Documentar contraprestação, atividade exigida e oferta relacionada. Risco: moderado. |
| Compra em USDC — RF-SWP | P | C | C | C | Consumo funcional sem representações de lucro favorece defesa. Gestão de liquidez vinculada a valorização pode contrariá-la. Revisar commonality e comunicações nos termos de IV.A. Risco: elevado para revisão. |
| Doação gratificada — RF-PRE-05 | P | C | C | C | Apoio genuíno difere de aquisição promovida como investimento. Contrapartida proporcional exige separar a liberalidade da compra econômica. Risco: elevado. |
| Conquista sem renda — RF-NFT | C | C | C | C | Credencial funcional pode ser compatível com III.C; confirmar direitos e ausência de arranjo de investimento. Intransferibilidade é evidência auxiliar, não salvo-conduto. Risco: menor, condicionado. |
| NFT pago com prêmio por posse — RF-NFT-09; RF-PRE-08 | P | C | C | C | Examinar contrato associado, origem das distribuições e esforços prometidos. Chamar prêmio de benefício não exclui security. Risco: elevado. |
| Aluguel/GameFi — RF-GAM | C | C | C | C | Uso/locação real não equivale automaticamente a investimento coletivo. Venda com promessa de exploração lucrativa gerida por terceiros é outro arranjo. Exigir avaliação por módulo, termos e campanha. Risco: elevado quando vendido como renda. |
| Tesouraria/adapters — RF-TRS; RF-FIA; RF-ADT | C | C | C | C | Gestão própria sem direitos de participantes ajuda; verificar se foi oferecida como esforço gerencial para gerar lucros aos compradores. Não confundir investimento da entidade com oferta de investimento ao público. Risco: elevado se vinculado à oferta. |
| Comércio/escrow — RF-ESC | P | C | C | C | Compra de entrega e pagamento por trabalho favorecem relação comercial. O objeto vendido pode, contudo, ser security ou parte de esquema de investimento. Verificar catálogo e comunicação. Risco: menor para comércio comum, condicionado. |

Negociação secundária exige análise própria das representações e do contrato associado; não se presume que toda revenda reproduz a oferta inicial ou que a existência de DEX elimina obrigações. As condições de separação do ativo e das promessas estão na seção IV.B de U2 e demandam fatos, não apenas passagem do tempo.

## 5. Defesa da proposta e respostas a objeções

| Argumento defensivo | Objeção relevante | Evidência/limite da resposta |
|---|---|---|
| Há finalidade comunitária e utilidade preexistente. | A utilidade Web2 não prova uso Web3 nem elimina oferta de investimento. | Demonstrar catálogo, entregas, uso e regras; distinguir proposta de operação. |
| Não há direito automático a rendimentos da tesouraria. | Política de prêmios ou publicidade pode criar outra relação econômica. | Termos e fluxos sem repasse patrimonial implícito; examinar RF-NFT-09/RF-PRE-08. |
| O swap usa reservas reais e não garante resgate. | Ainda pode haver expectativa de lucro e dependência da gestão. | Informar perdas, diluição e liquidez; revisar a oferta sem tratar risco como dispensa legal. |
| Prêmios reconhecem participação. | Participação simbólica pode ser acessória a remuneração passiva. | Prova da atividade, proporcionalidade e critérios; não disfarçar holding remunerado como participação. |
| Aluguel remunera uso de um item. | A venda pode promover retorno por exploração gerida pela equipe. | Contratos e utilização reais; separar prestação de uso, aquisição e eventual gestão coletiva. |
| Multisig e segregação reduzem riscos. | Redução de risco técnico não demonstra descentralização jurídica ou econômica. | Mapear quem controla emissão, jogos, receita, liquidez e upgrades; reconhecer dependências. |

A defesa mais consistente é **limitada aos fluxos cuja substância comprove consumo, reconhecimento ou serviço**, sem promessa/representação de ganho derivado de gestão alheia nas condições relevantes. Não se recomenda defender irrestritamente o conjunto atual antes de resolver as premiações por posse, as campanhas proporcionais e o discurso de monetização.

Não basta remover palavras como investimento, rendimento ou renda dos documentos. Se a estrutura econômica permanecer a mesma, a análise deve refletir essa estrutura. Tampouco se propõe alterar retrospectivamente evidências ou ocultar comunicações anteriores.

## 6. Requisitos, dossiê e gate de liberação

A seção [RF-REG](03-requisitos.md#17-conformidade-e-caracterização-regulatória-rf-reg) é a referência normativa de aprovação. Cada fluxo deve apresentar:

- identificação da entidade responsável, ofertantes, intermediários e jurisdições/públicos pretendidos;
- versões dos requisitos, contratos, parâmetros e políticas analisados, com estado proposto/implementado;
- mapa da contraprestação, titularidade e finalidade dos recursos, beneficiários e direitos econômicos;
- termos de aquisição, campanha, aluguel, premiação e risco, incluindo comunicados e materiais promocionais atribuíveis ao ofertante;
- matrizes Brasil/EUA com fatos, contrapontos, conclusão fundamentada e responsável pela revisão;
- parecer profissional aplicável e decisão de governança que registre condições, restrições e pendências;
- evidências técnicas e testes quando houver implementação; ausência atual de testes não deve ser apresentada como aprovação;
- registro de mudanças materiais e nova avaliação para ofertas futuras, preservando o histórico.

O dossiê público deve conter apenas informações apropriadas à divulgação; dados pessoais, segredos e aconselhamento sujeito a sigilo profissional ficam em repositório restrito. Publicar uma conclusão resumida não exige publicar o parecer integral.

### 6.1. Critérios de aceitação documentais e cenários adversos

| Caso | Requisito | Resultado esperado |
|---|---|---|
| Compra de Faísca para bem/serviço descrito | RF-REG-01/02/03 | Evidenciar uso e revisar oferta; não concluir dispensa só por utilidade. |
| NFT pago paga Faísca apenas por posse | RF-REG-04/05 | Identificar benefício passivo e fonte; manter ativação pendente até revisão e decisão. |
| Doação proporcionalmente gratificada | RF-REG-02/04 | Examinar aquisição econômica; não aceitar o nome doação como resposta ao teste. |
| Divulgação de valorização por gestão da equipe | RF-REG-03/04 | Vincular comunicação ao arranjo, revisar conclusões e impedir liberação sem resolver pendências. |
| Jogo exige ação mínima, mas promete retorno | RF-REG-02/04 | Investigar esforços gerenciais essenciais/predominantes; não afastar o teste só pela ação do jogador. |
| Oferta privada nos EUA | RF-REG-01/05 | Separar security de eventual isenção; não importar o elemento brasileiro de oferta pública para Howey. |
| Upgrade muda premiação ou split | RF-REG-06 | Reabrir revisão antes de ativar mudança; manter análise das versões anteriores. |
| Tesouraria investe doações ou receitas próprias | RF-REG-02 | Comprovar titularidade, restrições e ausência/presença de direitos dos participantes; não presumir capital próprio. |
| Nova coleção ou revenda via marketplace | RF-REG-01/05/06 | Avaliar objeto, oferta e eventual contrato associado; não herdar dispensa do módulo anterior. |

Esses casos são critérios para revisão e testes futuros, **não testes de contratos executados**. Quando implementados, os controles técnicos de autorização, bloqueio, segregação e mudanças deverão receber testes positivos e negativos vinculados aos IDs, sem pretender automatizar a conclusão jurídica.

## 7. Pendências e fronteiras regulatórias

Antes de uma oferta real, o jurídico deverá definir o alcance territorial e o regime de registro, isenção ou outra solução aplicável no Brasil e nos EUA, conforme fatos e legislação então vigentes. O documento não presume disponibilidade de isenção ou autorização de operação.

Também permanecem fora da conclusão de enquadramento aqui realizada os regimes de ativos virtuais, pagamentos, custódia, câmbio, prevenção à lavagem de dinheiro, tributação, consumidor, proteção de dados e regras estaduais norte-americanas aplicáveis. Não ser valor mobiliário não significa atividade não regulada. Integrações com stablecoins e produtos RWA exigem avaliação própria; a classificação da Faísca não classifica os ativos de terceiros.

## 8. Fontes e rastreabilidade

Consulta em **24/10/2026**. A hierarquia deve ser preservada: lei e precedente judicial não se confundem com interpretação administrativa ou FAQ do staff.

| Código | Fonte primária e trecho utilizado | Acesso e limite |
|---|---|---|
| B1 | [Lei 6.385/1976, texto consolidado](https://www.planalto.gov.br/ccivil_03/leis/l6385compilada.htm), art. 2º, especialmente IX. | Texto do artigo localizado por indexação da fonte oficial; confirmar atualização antes da oferta. |
| B2 | [Parecer de Orientação CVM 40/2022](https://conteudo.cvm.gov.br/export/sites/cvm/legislacao/pareceres-orientacao/anexos/Pare040.pdf), seções 3, 4 e 4.1. | PDF direto retornou conteúdo binário ilegível no coletor; passagens da seção 4.1 verificadas na indexação oficial. Não se atribui leitura integral do PDF. |
| B3 | [CVM: divulgação do Parecer 40](https://www.gov.br/cvm/pt-br/assuntos/noticias/2022/cvm-divulga-parecer-de-orientacao-sobre-criptoativos-e-o-mercado-de-valores-mobiliarios). | Síntese oficial indexada sobre categorias e atividades sujeitas à regulação; não substitui B1/B2. |
| U1 | [SEC v. Howey, 328 U.S. 293 (1946), GovInfo](https://www.govinfo.gov/app/details/USREPORTS-328/USREPORTS-328-293), pp. 298–301 do julgamento. | Registro oficial e ementa indexada; páginas indicadas são da referência jurisprudencial, não alegação de extração integral do PDF. |
| U2 | [Federal Register, 91 FR 13714–13733, documento 2026-05635](https://www.govinfo.gov/content/pkg/FR-2026-03-23/html/2026-05635.htm), Release 33-11412 / 34-105020, notas 7 e 21; seções II, III.C/III.E, IV e VII. | Versão textual oficial acessível, usada para conferir atualização, distinção ativo/contrato e representações de esforços gerenciais. Acesso direto ao domínio SEC bloqueado com HTTP 403. |

As limitações acima exigem conferência integral das fontes e de mudanças supervenientes pelo responsável jurídico antes da aprovação. Não foram identificados aqui todos os precedentes, normas de oferta ou exceções potencialmente aplicáveis: o escopo é caracterização e condições da defesa, não parecer exaustivo de distribuição de valores mobiliários.

## Changelog

| Data | Versão | Descrição |
|---|---|---|
| 2026-10-24 | 0.1.0 | Análise preliminar Brasil/EUA, matrizes por cenário, defesa condicionada e critérios de conformidade rastreáveis. |

![footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer&animation=twinkling)
