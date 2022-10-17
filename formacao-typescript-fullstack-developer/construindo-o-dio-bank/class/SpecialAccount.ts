import { DioAccount } from "./DioAccount"

export class SpecialAccount extends DioAccount {

  constructor(name: string, accountNumber: number){
    super(name, accountNumber)
  }

  deposit = (value: number): void => {
    if(this.validateStatus()){
        this.balance += value + 10
        console.log("Depósito realizado:\tR$ " + value.toFixed(2) + " + bonus de R$ 10.00");
        return;
      }
  }
}
