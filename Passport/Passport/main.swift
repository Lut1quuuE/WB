//
//  main.swift
//  Passport
//
//  Created by Ramazan Nazaev on 13.07.2024.
//

import Foundation

class Passport {
    let series: String
    let number: String
    let dateOfIssue: String
    
    init(series: String, number: String, dateOfIssue: String) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        print("Был выпущен паспорт: \(series) \(number)")
    }
    
    deinit {
        print("Паспорт \(series) \(number) был удален")
    }
}

class Person {
    let fullName: String
    let age: Int
    let passport: Passport
    
    init(fullName: String, age: Int, passport: Passport) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print("Человек: \(fullName) был создан")
    }
    deinit {
        print("Человек: \(fullName) был удален")
    }
}

func checkCreatingAndClearing() {
    print("Создание Паспорта и Человека")
    var passport: Passport = Passport(series: "1234", number: "567890", dateOfIssue: "22.01.2000")
    var person: Person = Person(fullName: "Ramazan", age: 25, passport: passport)
    
    print("Паспорт: \(passport.series) \(passport.number) принадлежит \(person.fullName)")
    print("Удаление паспорта и человека")
}
checkCreatingAndClearing()

