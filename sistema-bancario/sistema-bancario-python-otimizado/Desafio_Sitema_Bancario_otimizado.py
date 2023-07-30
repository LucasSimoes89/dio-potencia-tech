# Variáveis globais

LIMITE_SAQUES = 3 # limite de saques diários
usuarios = {} # dicionário de usuários cadastrados
agencia = "0001"
conta = 0
contas_cadastradas = {} # dicionário de contas cadastradas

# define função de saque
def saque(conta, valor=0.0, limite=500):
    # define variáveis de controle de saldo e limite de saques diários
    sem_saldo = valor > conta['Saldo']
    valor_limite_saque = valor > limite

    # verifica se há saldo na conta e se não ultrapassou limite de saques diários
    if sem_saldo:
        print("Operação inválida. Saldo insuficiente para saque\n")
    elif valor_limite_saque:
        print("Operação inválida. Excedeu o valor limite para saque\n")
    elif valor > 0:
        conta['Saldo'] -= valor
        conta['Quantidade Saques'] += 1
        conta['Extrato'] += f'Saque R$ {valor:.2f}\n'
        print("Saque realizado com sucesso\n")
        return conta['Saldo'], conta['Quantidade Saques'], conta['Extrato']
    else:
        print("Operação inválida. Valor informado é inválido\n")

# define função de depósito
def deposito(conta, valor=0.0):
    if valor > 0: # garante que valor não é negativo
        # atualiza valores nas informações da conta do usuário
        conta['Saldo'] += valor
        conta['Extrato'] += f'Depósito R$ {valor:.2f}\n'
    else:
        print("Valor informado é inválido.\n")
    return conta['Saldo'], conta['Extrato']

# define função de exibição do extrato da conta selecionada
def extrato_bancario(conta):
    print("EXTRATO BANCÁRIO")
    if conta['Extrato']:
        print(conta['Extrato'])
        print(f"Saldo = R$ {conta['Saldo']:.2f}")
    else:
        print("Sem movimentações\n")

# define função de criação do usuário
def criarUsuario():
    global usuarios

    while True:
        nome = input("Digite o nome do usuário: ")
        data_nascimento = input("Digite a data de nascimento do usuário: ")
        cpf = str(input("Digite o CPF do usuário: "))
        cpf = cpf.replace(".", "", 3)
        cpf = cpf.replace("-", "")
        if cpf in usuarios: # verifica se não existe usuário com mesmo CPF cadastrado
            print("Usuário já cadastrado")
            continue

        endereco = input("Digite o endereço do usuário: ")
        # atualiza informações do usuário na variável de usuários
        usuarios[cpf] = {"Nome": nome, "Data Nascimento": data_nascimento, "Endereço": endereco}
        print("Cadastro realizado com sucesso\n")
        return usuarios

# define função de listar usuários
def listarUsuarios():
    # verifica se há usuários cadastrados, se não chama função de criar usuário
    if len(usuarios) == 0:
        print("Ainda não há usuários disponíveis para abertura de conta\n"
              "Cadastre um novo usuário para abrir uma nova conta\n")
        criarUsuario()
    else:
        print("Lista de usuários cadastrados")
        print("----------------------------------")
        for chave, valor in usuarios.items(): # exibe informações do novo usário criado
            print("Nome:", valor['Nome'], "CPF:", chave, "Data Nascimento:", valor['Data Nascimento'])
            print("Endereço Completo:", valor['Endereço'])
            print("-----------------------------------------------------------------")

# define função de abrir nova conta bancária
def abrirConta():
    global contas_cadastradas
    global conta
    global usuarios
    lista_usuarios = []
    count = 1
    # verifica se há usuários cadastrados, se não chama função de criar usuário
    if len(usuarios) == 0:
        print("Ainda não há usuários disponíveis para abertura de conta\n"
              "Cadastre um novo usuário para abrir uma nova conta\n")
        criarUsuario()
    else: #lista usuários para criação de nova conta
        print("Lista de usuários cadastrados")
        print("----------------------------------")

        for chave, valor in usuarios.items():
            print(count, " - Nome:", valor['Nome'], "CPF:", chave)
            lista_usuarios.append([valor['Nome'], chave])
            count += 1

        selecionar_usuario_nova_conta = int(input("Escolha o usuário para criar a nova conta: "))

        conta += 1
        contas_cadastradas[conta] = {
            "Agencia": agencia, "Conta": conta, "Usuário": lista_usuarios[selecionar_usuario_nova_conta - 1][1]
            , "Saldo": 0.0, "Quantidade Saques": 0, "Extrato": ""
        }

        print("Contra criada com sucesso")
        for chave, valor in contas_cadastradas.items(): # exibe informações da nova conta criada
            print("\nAgencia:", agencia)
            print("Conta", conta)
            print("Saldo", "0.0")
            print("Usuário", lista_usuarios[selecionar_usuario_nova_conta - 1][1] + "\n")

    return contas_cadastradas, conta

menu = """Menu de opções
1 Sacar
2 Depositar 
3 Extrato 
4 Cadastrar Usuario
5 Listar Usuários
6 Abrir Conta
7 Sessão Finalizada\n"""

while True:
    opcao = input(menu)

    if opcao == "1":
        count = 1
        lista_contas = []

        print("Lista de contas cadastradas")
        print('-----------------------------------------------------')
        for chave, valor in contas_cadastradas.items():
            print(count, " - Agencia:", valor['Agencia'], "Conta:", valor['Conta']
                  , "Nome:", valor['Usuário'], "Saldo:", valor['Saldo'])
            lista_contas.append(
                [valor['Agencia'], valor['Conta'], valor['Usuário'], valor['Saldo'], valor['Quantidade Saques']])
            count += 1

        selecionar_conta_saque = int(input("Escolha a conta para realizar um saque: "))

        if lista_contas[0][4] >= LIMITE_SAQUES:
            print("Operação inválida. Excedeu o limite de saques diários\n")
            continue

        valor = float(input("Digite o valor do saque: "))
        saque(contas_cadastradas[selecionar_conta_saque], valor=valor)

    elif opcao == "2":
        count = 1
        lista_contas = []

        print("Lista de contas cadastradas")
        print('-----------------------------------------------------')
        for chave, valor in contas_cadastradas.items():
            print(count, " - Agencia:", valor['Agencia'], "Conta:", valor['Conta']
                  , "Nome:", valor['Usuário'], "Saldo:", valor['Saldo'])
            lista_contas.append(
                [valor['Agencia'], valor['Conta'], valor['Usuário'], valor['Saldo']])
            count += 1

        selecionar_conta_deposito = int(input("Escolha a conta para realizar um depósito: "))

        valor = float(input("Digite o valor do depósito: "))
        deposito(contas_cadastradas[selecionar_conta_deposito], valor=valor)

    elif opcao == "3":
        count = 1
        lista_contas = []

        print("Lista de contas cadastradas")
        print('-----------------------------------------------------')
        for chave, valor in contas_cadastradas.items():
            print(count, " - Agencia:", valor['Agencia'], "Conta:", valor['Conta']
                  , "Nome:", valor['Usuário'], "Saldo:", valor['Saldo'])
            lista_contas.append(
                [valor['Agencia'], valor['Conta'], valor['Usuário'], valor['Saldo']])
            count += 1

        selecionar_conta_extrato = int(input("Escolha a conta para consultar o extrato: "))
        extrato_bancario(contas_cadastradas[selecionar_conta_extrato])

    elif opcao == "4":
        criarUsuario()

    elif opcao == "5":
        listarUsuarios()

    elif opcao == "6":
        abrirConta()

    elif opcao == "7":
        print("Sessão finalizada")
        break
    else:
        print("Operação inválida. Digite novamente a opção desejada\n")



