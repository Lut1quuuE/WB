//
//  main.swift
//  Bank
//
//  Created by Ramazan Nazaev on 13.07.2024.
//

import Foundation

class Account {
    let id: String
    let owner: String
    private(set) var balance: Double
    
    init(id: String, owner: String, initialBalance: Double) {
        self.id = id
        self.owner = owner
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) -> Bool {
        if amount <= balance {
            balance -= amount
            return true
        } else {
            return false
        }
    }
    
    func display() {
        print("ID: \(id), Владелец: \(owner), Баланс: \(balance)")
    }
}

class Bank {
    private var accounts: [Account] = []
    
    func addAccount(account: Account) {
        accounts.append(account)
    }
    
    func deposit(to accountId: String, amount: Double) {
        if let account = accounts.first(where: { $0.id == accountId }) {
            account.deposit(amount: amount)
        } else {
            print("Аккаунт с ID: \(accountId) не найден")
        }
    }
    
    func transfer(from fromAccountId: String, to toAccountId: String, amount: Double) {
        guard let fromAccount = accounts.first(where: { $0.id == fromAccountId }) else {
            return
        }
        
        guard let toAccount = accounts.first(where: { $0.id == toAccountId }) else {
            return
        }
        
        if fromAccount.withdraw(amount: amount) {
            toAccount.deposit(amount: amount)
        } else {
            print("Недостаточно средств на аккаунте с ID \(fromAccountId).")
        }
    }
    
    func displayAllAccounts() {
        for account in accounts {
            account.display()
        }
    }
}

func main() {
    let bank = Bank()

    let account1 = Account(id: "001", owner: "Вася", initialBalance: 1000)
    let account2 = Account(id: "002", owner: "Саша", initialBalance: 500)
    let account3 = Account(id: "003", owner: "Катя", initialBalance: 200)

    bank.addAccount(account: account1)
    bank.addAccount(account: account2)
    bank.addAccount(account: account3)

    print("Баланс аккаунтов до переводов:")
    bank.displayAllAccounts()

    bank.deposit(to: "001", amount: 200)
    bank.transfer(from: "001", to: "002", amount: 300)
    
    bank.deposit(to: "002", amount: 150)
    bank.transfer(from: "002", to: "003", amount: 1000)

    print("\nБаланс аккаунтов после переводов:")
    bank.displayAllAccounts()
}
main()
