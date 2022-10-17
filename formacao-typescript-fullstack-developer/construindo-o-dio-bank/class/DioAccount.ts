export abstract class DioAccount {
  private readonly name: string
  private readonly accountNumber: number
  balance: number = 0
  private currencySymbol : string = 'R$'
  private status: boolean = true

  constructor(name: string, accountNumber: number){
    this.name = name
    this.accountNumber = accountNumber
  }

  getName = (): string => {
    return this.name
  }

  deposit = (value: number, r: boolean = true): void => {
    if(this.validateStatus()){
      this.balance += value
      if ( r === true ) {
        console.log("Depósito realizado:\tR$ " + value.toFixed(2) );
      }
      return;
    }
  }

  withdraw = (value: number): void => {
    if(this.validateStatus() && value <= this.balance){
      this.balance -= value
      console.log("Saque realizado:\tR$ " + value.toFixed(2) );
      return;
    }

    throw new Error('Saldo insuficiente')
  }

  getBalance = (): void => {
    console.log("Saldo atual:\t\t" + this.currencySymbol + " " + this.balance.toFixed(2) )
  }

  protected validateStatus = (): boolean => {
    if (this.status) {
      return this.status
    }

    throw new Error('Conta inválida')
  }
}
