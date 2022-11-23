//
//  Contact.swift
//  ContactList
//
//  Created by Вячеслав Горбатенко on 23.11.2022.
//

struct Contact {
    let name: String
    let surname: String
    
    var fullName: String {
        name + " " + surname
    }
    
    var phoneNumber: String {
        "+7" + " " +
        "(9" + String(Int.random(in: 10...99)) + ") " +
        String(Int.random(in: 100...999)) + "-" +
        String(Int.random(in: 10...99)) + "-" +
        String(Int.random(in: 10...99))
    }
    
    var email: String {
        name.lowercased() + "_" + surname.lowercased() + "@yandex.ru"
    }
}
