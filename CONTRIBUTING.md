![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=Contribuindo&fontSize=36&fontAlignY=35&animation=twinkling)

![visitors](https://visitor-badge.laobi.icu/badge?page_id=Rede-ENois.smartcontracts.contributing)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
![Language: Portuguese](https://img.shields.io/badge/Language-Portuguese-brightgreen.svg)
![Status](https://img.shields.io/badge/Status-Ongoing-yellow)
[![GitHub Issues](https://img.shields.io/github/issues/Rede-ENois/smartcontracts)](https://github.com/Rede-ENois/smartcontracts/issues)

# Contribuindo — É-Nóis Smart Contracts

Obrigado por contribuir com os smart contracts da Rede É-Nóis. Este guia explica
como reportar problemas, sugerir melhorias e enviar Pull Requests.

## Como pedir ajuda ou reportar

Use os [templates de issue](.github/ISSUE_TEMPLATE) adequados:

- **Dúvida / Suporte** — perguntas de uso, configuração de ambiente, dúvidas
  sobre os hooks ou scripts.
- **Sugestão** — ideias de funcionalidades, melhorias de UX/DX, otimizações.
- **Proposta de Correção** — bugs reproduzíveis, com ou sem correção sugerida.

> **Segurança:** se o problema envolver vulnerabilidade de segurança em
> contrato (funds em risco, controle de acesso, reentrância), **não** abra uma
> issue pública. Entre em contato diretamente com os mantenedores.

## Fluxo de contribuição

1. **Fork** o repositório e crie uma branch a partir de `main`:

   ```bash
   git checkout -b feat/minha-mudanca
   ```

2. **Instale as dependências** e valide o ambiente:

   ```bash
   forge install
   forge build
   forge test
   ```

3. **Implemente** seguindo as convenções abaixo.

4. **Commits** no padrão [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/):

   ```
   feat: adiciona contagem por pool no afterSwap
   fix: corrige flags do hook na mineração do salt
   docs: atualiza README com novo script
   ```

5. **Abra o Pull Request** preenchendo o template — descreva o *porquê* da
   mudança, não apenas o *o quê*.

## Convenções de código

- Solidity `^0.8.24` com `pragma` explícito no topo de cada arquivo.
- Licença `SPDX-License-Identifier: GPL-3.0-only` nos contratos do projeto.
- **NatSpec** (`/// @notice`, `/// @dev`, `@param`, `@return`) em funções
  externas/public e contratos.
- `custom errors` ao invés de `require` com strings longas.
- Eventos para toda mutação de estado relevante.
- `uint256` ao invés de `uint`; constantes em `UPPER_SNAKE_CASE`; funções em
  `camelCase`; contratos e eventos em `PascalCase`.
- Um contrato por arquivo; nome do arquivo = nome do contrato.
- Cache de storage em loops, `calldata` em parâmetros external, `unchecked`
  apenas quando o overflow for impossível por design.

## Testes

- Todo contrato novo ou modificado precisa de testes em
  `scripts/contracts/tests/` (espelhando a estrutura existente).
- Cubra caminho feliz, casos de borda, controle de acesso e reverts esperados.
- Antes do PR, execute localmente:

  ```bash
  forge fmt            # formatação
  forge build --sizes  # compilação e tamanho (limite 24KB, EIP-170)
  forge test -vvv      # suíte completa
  ```

- Bugfixes devem vir acompanhados de teste de regressão que falha sem a
  correção.

## Segurança — regras inegociáveis

- **Nunca** commite chaves privadas, seeds, RPC keys ou qualquer segredo.
  Use o keystore do `cast` (`cast wallet import`) e `--account` nos scripts.
- Não exponha segredos em issues, PRs, logs ou screenshots.
- Contratos que movem valor exigem checklist de segurança no PR
  (reentrância, controle de acesso, validação de hook flags).
- Ao mexer em hooks Uniswap v4, verifique flags e mineração de salt —
  ver a seção *Troubleshooting* do [README](README.md).

## Revisão de PRs

Os mantenedores revisam considerando: corretude, segurança, testes, gas,
aderência às convenções e clareza da descrição. PRs pequenos e focados são
revisados mais rápido que refactors amplos.

## Licença

Ao contribuir, você concorda que suas contribuições são licenciadas sob a
[GPLv3](LICENSE), a mesma licença do projeto.

![footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer&animation=twinkling)
