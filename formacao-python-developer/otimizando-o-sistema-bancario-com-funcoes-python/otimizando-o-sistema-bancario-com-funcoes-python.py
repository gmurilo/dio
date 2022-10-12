from ctypes import sizeof
import textwrap
import re
saldo = float( 0 )
limiteSaque = float( 500 )
limiteTotal = float( 1500 )
numero_saques = int( 0 )
extrato = []
clientes = {}
contas = []
n_conta = int( 0 )
def menu():
    comandos = (
        "[d]\tDepositar",
        "[s]\tSacar",
        "[e]\tExtrato",
        "[b]\tSaldo",
        "[c]\tCadastrar Cliente",
        "[lc]\tListar Clientes",
        "[pc]\tProcurar Cliente",
        "[a]\tCadastrar Conta",
        "[la]\tListar Contas",
        "[pa]\tProcurar Conta",
        "[q]\tSair"
    )
    return input( textwrap.dedent( "\n".join(comandos) ) + "\n" )

def depositar( ):
    global saldo
    global extrato
    ret = bool(0)
    valor = float( input(f"Digite o valor à ser depositado: ") )
    if ( valor <= 0 ) :
        print( f"Você está informando um valor de depósito inválido!")
    else: 
        print( f"Depósito de R$ %.2f realizado com sucesso!" % valor)
        saldo += valor
        extrato.append( f"Depósito: R$ %.2f" % valor)
        ret = bool(1)
    return ret

def sacar( ):
    global saldo
    global extrato
    global limiteSaque
    global limiteTotal
    valor = float( input(f"Digite o valor à ser sacado: ") )
    ret = bool(0)
    if ( saldo <= 0 or saldo < valor ): # Você não possui saldo
        print( f"Você não possui saldo suficiente para realizar esse saque.\nSeu saldo é de R$ %.2f" % saldo)
    elif( ( limiteTotal - valor ) < 0 ) :
        print( f"O seu limite diário foi excedido!\nSeu limite atual é de R$ %.2f." % limiteTotal )
    elif ( valor > limiteSaque  ) :
        print( f"Você não pode sacar valores maiores que R$ %.2f!" % limiteSaque )
    elif ( valor <= 0 ) :
        print( f"Você não pode sacar valores negativos!")
    else:
        saldo -= valor
        limiteTotal -= valor
        extrato.append( f"Saque: R$ %.2f" % valor)
        print( f"Saque realizado com sucesso!")
        ret = bool(1)
    return ret

def ver_extrato():
    global extrato
    if ( extrato.count == 0 ): 
        print( f"Não existem operações realizadas!")
    for operacao in extrato :
        print( operacao )

def sonumero(n):
    return re.sub(r"[^0-9]", '', n )

def inserir_cliente(cpf = ''):
    print( "========= Cadastro de cliente =========")
    while True:
        if ( len(cpf) != 11 ) :
            cpf_numerico = sonumero( input("CPF:\t") )
        else:
            cpf_numerico = sonumero(cpf)
            print( f"CPF:\t {cpf}")
        if ( clientes.get( cpf_numerico ) ) :
            print( f"O cliente com CPF {cpf} já está cadastrado.\nInforme outro cpf ou pressione q para sair." )
            continue
        elif ( len( cpf_numerico ) != 11 ) :
            print( f"CPF {cpf} inválido.\nInforme outro cpf ou pressione q para sair." )
            continue
        elif( cpf == 'q' ) :
            return bool(0)
        else:
            nome = input("Nome:\t")
            nascimento = input("Nascimento:\t")
            endereco = {"uf": '', "cidade": '', "bairro": '', "logradouro": '', "nro": ''}
            print( "Endereço:")
            endereco["uf"] = input("UF:\t")
            endereco["cidade"] = input("Cidade:\t")
            endereco["bairro"] = input("Bairro:\t")
            endereco["logradouro"] = input("Logradouro:\t")
            endereco["nro"] = input("Número:\t")
            clientes[cpf_numerico] = {
                "nome": nome,
                "nascimento": nascimento,
                "cpf": cpf,
                "endereco": endereco,
                "contas": []
            }
            print(f"Cliente com cpf {cpf} cadastrado com sucesso.")
            return bool(1)

def listar_clientes():
    global clientes
    if ( len(clientes.items()) == 0 ): 
        print( f"Não existem clientes cadastrados!")
    for cliente in clientes :
        print( clientes[cliente] )

def procurar_cliente():
    global clientes
    cpf = input("Informe o cpf à ser localizado: ")
    cliente = {}
    if ( cpf == 'q' ) :
        return bool(0)
    else: 
        cpf = re.sub(r"[^0-9]", '', cpf )
        if ( len(cpf) != 11 ) : 
            print("CPF Inválido.\nPressione q para abortar.\n")
            return procurar_cliente()
        cliente = clientes.get(cpf) 
        if ( cliente ) :
            print( cliente)
        else:
            print( "Cliente não localizado.")    
        
def inserir_conta(cpf = ''):
    global clientes
    global n_conta
    while True:
        print( "========= Cadastro de conta ========= ")    
        #Verifica se o cliente existe
        if ( len(cpf) != 11 ) :
            cpf = sonumero( input("CPF - Cliente:\t") )
        else:
            cpf = sonumero(cpf)
            print( f"CPF - Cliente:\t{cpf}")
        if ( clientes.get(cpf) ) :
            agencia = '0001'
            n_conta += 1
            conta = '{:0>5}'.format( n_conta )
            contas.append(
                {
                    "cpf": cpf,
                    "conta": conta,
                    "agencia": agencia
                }
            )
            clientes[cpf]['contas'].append(
                {
                    "agencia": agencia,
                    "conta": conta
                }
            )
            print( f"Conta cadastrada com sucesso conta: {conta}\tagência: {agencia}.")
            input("Pressione qualquer tecla para sair do cadastro")
            break
        else:
            r = input( "Cliente não localizado.\nO que deseja fazer ? i/q/o\n[i] Inserir cliente.\n[q] Sair\n[o] Tentar outro cpf.\n")
            if( r == 'i') :
                inserir_cliente(cpf)
            elif( r == 'q'):
                break
            elif( r == 'o'):
                continue

def listar_contas():
    global contas
    if ( contas.count == 0 ): 
        print( f"Não existem contas cadastradas!")
        return bool(0)
    print("============== Lista de Contas ==============")
    i = 0
    for conta in contas :
        if ( i > 0 ) :
            print( "\n")
        print( f"Agência:\t{conta['agencia']}\nC/C:\t\t{conta['conta']}\nCPF:\t\t{conta['cpf']}" )
        i += 1
    input("=============================================\n")
        
def procurar_conta():
    return bool(1)

def main():
    while True:
        opcao = menu()
        if ( opcao == 'd' ): #Realiza o deposito
            depositar()
        elif( opcao == 's'): #Realiza o saque
            sacar()
        elif( opcao == 'e'): #Imprime o extrato
            ver_extrato()
        elif( opcao == 'v'): #Imprime o saldo disponível
            print( f"Seu saldo disponível é de R$ %.2f" % saldo)
        elif( opcao == 'c'): #Inserir cliente
            inserir_cliente()
        elif( opcao == 'lc'): #Listar clientes
            listar_clientes()
        elif( opcao == 'pc'): #Procurar cliente
            procurar_cliente()
        elif( opcao == 'a'): #Inserir conta
            inserir_conta()
        elif( opcao == 'la'): #Listar contas
            listar_contas()
        elif( opcao == 'pa'): #Procurar conta
            procurar_conta()
        elif( opcao == 'q'): #Sai do programa
            break;
        else:
            print( f"Opção indisponível, tente uma das opções à baixo:")
main()