import { SpecialAccount } from './class/SpecialAccount';
import { CompanyAccount } from './class/CompanyAccount'
import { PeopleAccount } from './class/PeopleAccount'

const peopleAccount: PeopleAccount = new PeopleAccount(666, 'Giovani Correa', 1)
console.log(peopleAccount.getName())
peopleAccount.getBalance()
peopleAccount.deposit(100) //Deposita
peopleAccount.getBalance()
peopleAccount.withdraw(30) //Saca
peopleAccount.getBalance()


const companyAccount: CompanyAccount = new CompanyAccount('Digital Innovation One', 2)
console.log("\n"+ companyAccount.getName())
companyAccount.getBalance()
companyAccount.deposit(800)
companyAccount.getBalance()
companyAccount.getLoan(300) //Empréstimo
companyAccount.getBalance()
companyAccount.withdraw(400)
companyAccount.getBalance()

const specialAccount: SpecialAccount = new SpecialAccount('Special Account', 3)
console.log("\n"+ specialAccount.getName())
specialAccount.getBalance()
specialAccount.deposit(150) //Deposito Especial + 10
specialAccount.getBalance()
specialAccount.withdraw(80)
specialAccount.getBalance()
