![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=Smartcontracts%20%E2%80%94%20Uniswap%20v4%20Hooks&fontSize=36&fontAlignY=35&animation=twinkling)

![visitors](https://visitor-badge.laobi.icu/badge?page_id=Rede-ENois.smartcontracts.readme)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
![Language: Portuguese](https://img.shields.io/badge/Language-Portuguese-brightgreen.svg)
![Status](https://img.shields.io/badge/Status-Ongoing-yellow)
[![GitHub Issues](https://img.shields.io/github/issues/Rede-ENois/smartcontracts)](https://github.com/Rede-ENois/smartcontracts/issues)

# É-Nóis — Smart Contracts (Uniswap v4 Hooks)

Este módulo é a implementação de hooks **Uniswap v4** da Rede É-Nóis, construída
sobre o template oficial [`v4-template`](https://github.com/uniswapfoundation/v4-template)
**já ajustado para uso**: as convenções do projeto (layout de diretórios,
regras de segurança, documentação e testes) estão aplicadas — basta implementar
a lógica do hook.

## O que já vem pronto

| Elemento | Caminho | Descrição |
|---|---|---|
| Hook de exemplo | [`contracts/Counter.sol`](contracts/Counter.sol) | Demonstra `beforeSwap()` e `afterSwap()` com contadores por pool. |
| Testes | [`scripts/contracts/tests/`](scripts/contracts/tests/README.md) | Ambiente pré-configurado: PoolManager, tokens mock e liquidez de teste (`forge test`). |
| Scripts de operação | [`scripts/contracts/`](scripts/contracts/README.md) | Deploy do hook via CREATE2, criação de pool, liquidez e swap. |
| Deployers | `scripts/contracts/tests/utils/Deployers.sol` | Resolve Permit2, PoolManager, PositionManager e SwapRouter (local ou canonical). |

## Começando

O hook de exemplo [`Counter.sol`](contracts/Counter.sol) demonstra os callbacks
`beforeSwap()` e `afterSwap()`. A suíte de testes
[`Counter.t.sol`](scripts/contracts/tests/Counter.t.sol) já pré-configura o
PoolManager v4, tokens de teste e liquidez inicial — use-a como referência ao
escrever seu próprio hook.

### Requisitos

- [Foundry](https://book.getfoundry.sh/) **stable** (nightly pode apresentar
  incompatibilidades). Atualize com:

```bash
foundryup
```

- Instale as dependências e rode a suíte:

```bash
forge install
forge test
```

### Atualizando a partir do template upstream

O template é mantido ativamente pela Uniswap Foundation. Para trazer
atualizações de dependências, scripts e helpers:

```bash
git remote add uniswap-hook https://github.com/uniswapfoundation/v4-template
git fetch uniswap-hook
git merge uniswap-hook/main <BRANCH> --allow-unrelated-histories
```

## Desenvolvimento local

Além dos testes unitários (recomendado!), hooks só podem ser deployados e
exercitados localmente via [Anvil](https://book.getfoundry.sh/anvil/). Os
scripts em [`scripts/contracts/`](scripts/contracts/README.md) deployam hooks,
criam pools, fornecem liquidez e executam swaps — tanto no Anvil local quanto
em redes de produção.

### Executando localmente com Anvil

1. Suba o Anvil (ou faça fork de uma chain específica):

```bash
anvil
# ou
anvil --fork-url <SUA_RPC_URL>
```

2. Execute os scripts:

```bash
forge script scripts/contracts/00_DeployHook.s.sol \
    --rpc-url http://localhost:8545 \
    --private-key <PRIVATE_KEY> \
    --broadcast
```

### Executando via RPC (transações reais)

> **Importante:** evite armazenar a chave privada em `.env` ou passá-la na linha
> de comando. Use `--account` para selecionar a chave do keystore do `cast`.

<details>
<summary>Se ainda não importou sua chave para o keystore</summary>

1. Importe a chave:

```bash
cast wallet import <NOME_DA_CHAVE> --interactive
```

2. Informe a chave privada e defina uma senha quando solicitado. Saída esperada:

```
`<NOME_DA_CHAVE>` keystore was saved successfully. Address: <SEU_ENDERECO>
```

> **Aviso:** use `history -c` para limpar o histórico do shell.

</details>

Execute os scripts:

```bash
forge script scripts/contracts/00_DeployHook.s.sol \
    --rpc-url <SUA_RPC_URL> \
    --account <NOME_DA_CHAVE> \
    --sender <SEU_ENDERECO> \
    --broadcast
```

A senha da carteira será solicitada interativamente.

### Ajustes necessários antes de rodar

1. Atualize os endereços `token0` e `token1` em
   [`scripts/contracts/base/BaseScript.sol`](scripts/contracts/base/BaseScript.sol)
   para os tokens da rede alvo (Sepolia, mainnet etc.).
2. Atualize `token0Amount` e `token1Amount` em
   `01_CreatePoolAndAddLiquidity.s.sol` conforme a liquidez desejada.
3. Idem em `02_AddLiquidity.s.sol` para provisões adicionais.
4. Ajuste `amountIn` e `amountOutMin` em `03_Swap.s.sol` para o swap desejado.
5. Após o deploy do hook, configure `hookContract` em `BaseScript.sol` com o
   endereço minerado (o `PoolKey` dos scripts seguintes depende dele).

### Verificando o contrato do hook

```bash
forge verify-contract \
  --rpc-url <URL> \
  --chain <CHAIN_NAME_OU_ID> \
  --verifier <PROVEDOR_DE_VERIFICACAO> \   # geralmente etherscan
  --verifier-api-key <API_KEY> \           # --etherscan-api-key se etherscan
  --constructor-args <ARGS_ABI_ENCODED> \
  --num-of-optimizations <OPTIMIZER_RUNS> \
  <ENDERECO_DO_CONTRATO> \
  contracts/Counter.sol:Counter \
  --watch
```

## Troubleshooting

<details>

#### Permission denied no `forge install`

Erro de autenticação SSH com o GitHub ao instalar dependências. Resolva
[configurando suas chaves SSH no GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
ou [adicionando-as ao ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

#### Falhas em testes com fork do Anvil

Algumas versões do Foundry limitam o tamanho do bytecode a ~25 KB. Ajuste com:

```bash
anvil --code-size-limit 40000
```

#### Falhas no deploy do hook

Geralmente flags incorretos ou salt minerado errado:

1. Confira se os flags estão consistentes:
   - `getHookCalls()` retorna os flags corretos;
   - `flags` passados ao `HookMiner.find(...)`.
2. Confira a mineração do salt:
   - **forge test**: o *deployer* de `new Hook{salt: salt}(...)` e de
     `HookMiner.find(deployer, ...)` deve ser o mesmo — `address(this)`. Com
     `vm.prank`, é o endereço do prank.
   - **forge script**: o deployer deve ser o CREATE2 Proxy
     `0x4e59b44847b379578588920cA78FbF26c0B4956C`. Se o Anvil não tiver o
     deployer CREATE2, seu Foundry pode estar desatualizado — rode `foundryup`.

</details>

## Recursos adicionais

- [Documentação Uniswap v4](https://docs.uniswap.org/contracts/v4/overview)
- [v4-periphery](https://github.com/uniswap/v4-periphery)
- [v4-core](https://github.com/uniswap/v4-core)
- [v4-by-example](https://v4-by-example.org)

## Changelog

| Data | Versão | Descrição |
|---|---|---|
| 2026-10-24 | 1.0.0 | README em português: merge do template upstream contextualizado como implementação ajustada para uso (paths `contracts/`, `scripts/contracts/`, `scripts/contracts/tests/`). |

![footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer&animation=twinkling)
