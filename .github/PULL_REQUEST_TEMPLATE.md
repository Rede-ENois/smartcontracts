<!--
Obrigado pela contribuição! Preencha as seções abaixo.
Mantenha o foco no "porquê" da mudança, não apenas no "o quê".
-->

## Resumo

<!-- Descreva a mudança e a motivação. Referencie issues: Closes #123 -->

## Tipo de mudança

- [ ] Correção de bug
- [ ] Nova funcionalidade
- [ ] Refatoração (sem mudança de comportamento)
- [ ] Documentação
- [ ] Segurança
- [ ] Otimização de gas
- [ ] Outro: <!-- descreva -->

## Como testar

<!-- Passos para reproduzir/validar, comandos, scripts forge, etc. -->

## Checklist

- [ ] Compila sem warnings: `forge build --sizes`
- [ ] Testes passam: `forge test -vvv`
- [ ] Formatação aplicada: `forge fmt`
- [ ] Novos contratos/funções possuem NatSpec e testes (caminho feliz + revert)
- [ ] Bugfix acompanha teste de regressão que falha sem a correção
- [ ] Nenhum segredo/chave privada incluído no diff
- [ ] Documentação atualizada (README, REQUIREMENTS, comentários) se aplicável

## Checklist de segurança (obrigatório se tocar contratos que movem valor)

- [ ] Controle de acesso revisado (modifiers, roles)
- [ ] Reentrância avaliada (checks-effects-interactions / guards)
- [ ] Hook flags e mineração de salt consistentes (hooks Uniswap v4)
- [ ] Validação de inputs externos e tratamento de erros

## Observações

<!-- Riscos, decisões de design, follow-ups, screenshots -->
