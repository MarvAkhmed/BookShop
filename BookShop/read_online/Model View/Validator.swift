//
//  Validator.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 30/04/2024.
//

import Foundation

class Validator {
    
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func  isUsernameValid(forUsername username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRgx = "\\w{4,24}"
        let useranamePred = NSPredicate(format: "SELF MATCHES %@", usernameRgx)
        return useranamePred.evaluate(with: username)
    }
    
    static func isPasswordValid(forPassword password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "[0-9]{4,8}"
//        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password )
    }
    
    static func isAgeValid(forAge age: String) -> Bool {
        if let ageInt = Int(age) {
            return (ageInt >= 5 && ageInt <= 100)
        } else {
            return false
        }
    }
     
}
