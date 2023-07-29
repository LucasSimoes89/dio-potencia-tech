
saldo = 0
extrato = ""
LIMITE_SAQUES = 3
saques = 0

menu = "Menu\n1 Sacar \n2 Depositar \n3 Extrato \n4 Finalizar\n"

while True:
    opcao = input(menu)

    if opcao == "1":
        qtidade_saques = saques >= LIMITE_SAQUES

        if qtidade_saques:
            print("Operação inválida. Excedeu o limite de saques diários\n")
            continue

        valor = float(input("Digite o valor do saque: "))

        sem_saldo = valor > saldo
        valor_limite_saque = valor > 500

        if sem_saldo:
            print("Operação inválida. Saldo insuficiente para saque\n")
        elif valor_limite_saque:
            print("Operação inválida. Excedeu o valor limite para saque\n")
        elif valor > 0:
            saldo -= valor
            saques += 1
            extrato += f'Saque R$ {valor:.2f}\n'
            print("Saque realizado com sucesso\n")
        else:
            print("Operação inválida. Valor informado é inválido\n")

    elif opcao == "2":
        valor = float(input("Digite o valor do depósito: "))
        if valor > 0:
            saldo += valor
            extrato += f'Depósito R$ {valor:.2f}\n'
        else:
            print("Valor informado é inválido.\n")

    elif opcao == "3":
        print("EXTRATO BANCÁRIO")
        if extrato:
            print(extrato)
            print(f'Saldo = R$ {saldo:.2f}')
        else:
            print("Sem movimentações\n")
    elif opcao == "4":
        print("Sessão finalizada")
        break
    else:
        print("Operação inválida. Digite novamente a opção desejada\n")