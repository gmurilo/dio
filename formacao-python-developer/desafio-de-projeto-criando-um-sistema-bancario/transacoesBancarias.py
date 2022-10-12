import datetime
class Lancamento:
    def __init__(self, valor, operacao) :
        horario = datetime.datetime.now()
        self._horario = horario
        self._valor = valor
        self._operacao = operacao

    def getvalor(self):
        if ( self._operacao == "Saque" ) :
            return self._valor * -1
        else:
            return self._valor

    def get(self):
        return f"{self._operacao} realizado em {self._horario} no valor de R$ {self._valor}"
    
class MovimentacaoBancaria:
    def __init__(self, agencia, conta):
        self._agencia = agencia
        self._conta = conta
        self._saldo = 0
        self._limiteDiario = 1500
        self._limiteSaque = 500
        self._lancamentos = []
    
    def deposito(self, valor):
        if ( valor <= 0 ) : 
            print( f"Você não pode fazer o depósito de valores negativos.\n" )
        else:
            self._saldo += valor
            print( f"Depósito realizado com sucesso\n" )
            lancamento = Lancamento(valor,"Depósito")
            self._lancamentos.append( lancamento )
            
    def saque(self, valor):
        if ( valor > self._saldo ) :
            print( f"Seu saldo é insuficiente para realizar esta operação,\nO valor disponível na sua conta é %.2f" % self._saldo )
        elif( valor > self._limiteDiario ):
            print( f"Seu saque ultrapassa seu limite de diário.\nSeu limite diário disponível é de R$ %.2f\n" % self._limiteDiario )
        elif( valor > self._limiteSaque ):
            print( f"Seu saque ultrapassa seu limite de saque.\nSeu limite de saque é de R$ %.2f\n" % self._limiteSaque )
        else:
            self._saldo -= valor
            self._limiteDiario -= valor
            lancamento = Lancamento(valor,"Saque")
            self._lancamentos.append( lancamento )
            print( f"Saque realizado com sucesso\nSeu novo saldo é: %.2f\n" % self._saldo )
  
    def extrato(self):
        if ( self._lancamentos.count == 0 ) :
            print( f"Nenhuma operação realizada até o momento.\n" )
        else:  
            saldo = 0;
            for lancamento in self._lancamentos:
                saldo += lancamento.getvalor()
                print( lancamento.get() )
            print( "Seu saldo final é de R$ %.2f" % saldo )
menu = " [d] Depósito\n [s] Saque\n [e] Extrato\n [q] Sair\n"
movimentacaoBancaria = MovimentacaoBancaria('0001', '99999-9')
while True:
    opcao = input(menu)
    if ( opcao == 'd' ):
        valor = input("Digite o valor à ser depositado\n")
        movimentacaoBancaria.deposito( float(valor) )
    elif( opcao == 's'):
        valor = input("Digite o valor à ser sacado\n")
        movimentacaoBancaria.saque( float(valor) )
    elif( opcao == 'e'):
        movimentacaoBancaria.extrato()
    elif( opcao == 'q'):
        break;
    else:
        print("Opção indisponível, tente uma das opções à baixo:")
        print( menu )