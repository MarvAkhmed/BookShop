//
//  CustomTextField.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 29/04/2024.
//

import UIKit

class CustomTextField: UITextField {
    
     enum CustomTextFieldType {
        case email
        case username
        case password
        case confirmPassword
        case age
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch  authFieldType {
        case .email:
            self.placeholder = "Email adress"
            self.keyboardType = .emailAddress
            self.textContentType =   .emailAddress
        case .username:
            self.placeholder = "username"
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .confirmPassword:
            self.placeholder = "rewrite your password"
        case .age:
            self.placeholder = "Age"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
