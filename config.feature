# language: pt
Funcionalidade: Configurar produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Contexto:
    Dado que eu mudei para a página de um produto variável

  Cenário: Configuração válida de produto
    Quando eu selecionar a cor "Orange"
    E o tamanho "S"
    E definir a quantidade como 2
    E clicar no botão "COMPRAR"
    Então o produto deve ser inserido com sucesso no carrinho

  Esquema do Cenário: Validar obrigatoriedade de campos
    Quando eu selecionar a cor <cor>
    E o tamanho <tamanho>
    E definir a quantidade como <quantidade>
    E clicar no botão "COMPRAR"
    Então o sistema deve exibir uma mensagem de alerta <mensagem>

    Exemplos:
      | cor      | tamanho | quantidade | mensagem                                       |
      | ""       | "M"     | 1          | "A seleção de cor é obrigatória."              |
      | "Blue"   | ""      | 1          | "A seleção de tamanho é obrigatória."          |
      | "Red"    | "XL"    | 0          | "A quantidade deve ser de no mínimo 1 produto."|

  Cenário: Limitar quantidade máxima por venda
    Quando eu tentar definir a quantidade como 11
    Então o sistema deve bloquear a quantidade e mantê-la em no máximo 10 produtos por venda

  Cenário: Voltar ao estado original ao limpar
    Dado que eu selecionei a cor "Orange"
    E o tamanho "S"
    E defini a quantidade como 5
    Quando eu clicar no botão "Limpar"
    Então as seleções de cor e tamanho devem ser desmarcadas
    E a quantidade deve voltar ao estado original padrão
