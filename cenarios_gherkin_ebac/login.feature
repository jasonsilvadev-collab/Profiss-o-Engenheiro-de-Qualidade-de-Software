# language: pt
Funcionalidade: Login na plataforma
  Como cliente da EBAC-SHOP
  Quero fazer o login (autenticação) na plataforma
  Para visualizar meus pedidos

  Contexto:
    Dado que eu estou na tela de autenticação da EBAC-SHOP

  Cenário: Autenticação com sucesso
    Quando eu inserir o usuário "cliente.valido@ebac.com.br"
    E a senha "Senha@123"
    E clicar no botão "LOGIN"
    Então eu devo ser direcionado para a tela de checkout

  Esquema do Cenário: Autenticação com dados inválidos
    Quando eu inserir o usuário <usuario>
    E a senha <senha>
    E clicar no botão "LOGIN"
    Então o sistema deve exibir uma mensagem de alerta "Usuário ou senha inválidos"

    Exemplos:
      | usuario                      | senha          |
      | "usuario.invalido@ebac.com"  | "Senha@123"    |
      | "cliente.valido@ebac.com.br" | "SenhaErrada"  |
      | "usuario.inexistente@br.com" | "Nenhuma123"   |
