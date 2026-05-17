# language: pt
Funcionalidade: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Contexto:
    Dado que eu estou na tela de finalização de compra (Checkout)

  Esquema do Cenário: Validar preenchimento de campos obrigatórios
    Quando eu preencher o nome <nome>
    E o sobrenome <sobrenome>
    E o país <pais>
    E o endereço <endereco>
    E a cidade <cidade>
    E o CEP <cep>
    E o telefone <telefone>
    E o e-mail <email>
    E clicar no botão "FINALIZAR COMPRA"
    Então o sistema deve exibir a mensagem de alerta <mensagem>

    Exemplos:
      | nome    | sobrenome | pais             | endereco      | cidade     | cep         | telefone      | email             | mensagem                                     |
      | "João"  | "Silva"   | "Brasil"         | "Rua A, 123"  | "São Paulo"| "01000-000" | "11999999999" | "joao@ebac.com"   | "Cadastro concluído com sucesso!"            |
      | ""      | "Silva"   | "Brasil"         | "Rua A, 123"  | "São Paulo"| "01000-000" | "11999999999" | "joao@ebac.com"   | "Favor preencher todos os campos obrigatórios"|
      | "João"  | ""        | "Brasil"         | "Rua A, 123"  | "São Paulo"| "01000-000" | "11999999999" | "joao@ebac.com"   | "Favor preencher todos os campos obrigatórios"|
      | "João"  | "Silva"   | "Reino Unido"    | ""            | "Londres"  | "E1 6AN"    | "44791112345" | "joao@ebac.com"   | "Favor preencher todos os campos obrigatórios"|

  Esquema do Cenário: Validar formato do campo e-mail
    Quando eu preencher todos os campos obrigatórios de faturamento
    E no campo e-mail eu digitar <email_digitado>
    E clicar no botão "FINALIZAR COMPRA"
    Então o sistema deve exibir uma mensagem de erro <mensagem_erro>

    Exemplos:
      | email_digitado       | mensagem_erro                        |
      | "email_sem_arroba"   | "Formato de e-mail inválido."        |
      | "email@semdominio"   | "Formato de e-mail inválido."        |
      | "@teste.com"         | "Formato de e-mail inválido."        |
