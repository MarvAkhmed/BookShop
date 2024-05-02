//
//  ForgotPasswordController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 28/04/2024.
//

import UIKit

class ForgotPasswordController: UIViewController {

    private let headerView = AuthHeaderView(title: "forgot password", subtitle: "reset your passwrd")
    private let emailTextFiled = CustomTextField(fieldType: .email)
    private let resetPasswordButton = CustomButton(title: "Sign Up",hasBackGround: true ,fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgottenPassword), for: .touchUpInside)
    }
    
    //MARK: - UI Setup
    private func setUpUI() {
        view.addSubview(headerView)
        view.addSubview(emailTextFiled)
        view.addSubview(resetPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFiled.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 266),
            
            emailTextFiled.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11  ),
            emailTextFiled.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailTextFiled.heightAnchor.constraint(equalToConstant: 55),
            emailTextFiled.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextFiled .bottomAnchor, constant: 22  ),
            resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
        //MARK: - reset password controller
    @objc private func didTapForgottenPassword() {
        let email = self.emailTextFiled.text ?? ""
        if !Validator.isValidEmail(for:  email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        AuthService.shared.forgotPass(with: email) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }else {
                AlertManager.showPasswordResetSent(on: self)
            }
            
        }
    }

}
