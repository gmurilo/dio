menu = "======================\nComandos disponíveis:\n[d] Depositar\n[s] Sacar\n[e] Extrato\n[v] Saldo\n[q] Sair\n======================\n"
saldo = float( 0 )
limiteSaque = float( 500 )
limiteTotal = float( 1500 )
numero_saques = int( 0 )
extrato = []
while True:
    opcao = input(menu)
    if ( opcao == 'd' ): #Realiza o deposito
        valor = float( input("Digite o valor à ser depositado: ") )
        if ( valor <= 0 ) :
            print( f"Você está informando um valor de depósito inválido!")
            continue
        print( f"Depósito de R$ %.2f realizado com sucesso!" % valor)
        saldo += valor
        extrato.append( "Depósito: R$ %.2f" % valor)
    elif( opcao == 's'): #Realiza o saque
        valor = float( input("Digite o valor à ser sacado: ") )
        if ( saldo <= 0 or saldo < valor ): # Você não possui saldo
            print( f"Você não possui saldo suficiente para realizar esse saque.\nSeu saldo é de R$ %.2f" % saldo)
            continue
        elif( ( limiteTotal - valor ) < 0 ) :
            print( f"O seu limite diário foi excedido!")
            continue
        elif ( valor > limiteSaque  ) :
            print( f"Você não pode sacar valores maiores que R$ %.2f!" % limiteSaque )
        elif ( valor <= 0 ) :
            print( f"Você não pode sacar valores negativos!")
        else:
            saldo -= valor
            limiteTotal -= valor
            extrato.append( "Saque: R$ %.2f" % valor)
            print( "Saque realizado com sucesso!")
    elif( opcao == 'e'): #Imprime o extrato
        for operacao in extrato :
            print( operacao )
    elif( opcao == 'v'): #Imprime o saldo disponível
        print( "Seu saldo disponível é de R$ %.2f" % saldo)
    elif( opcao == 'q'): #Sai do programa
        break;
    else:
        print("Opção indisponível, tente uma das opções à baixo:")
        print( menu )