//
//  LoginController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 28/04/2024.
//

import UIKit

class LoginController: UIViewController {

    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign In to your account")
    
    private let emailTextField = CustomTextField(fieldType:  .email)
    private let passwordField = CustomTextField(fieldType:  .password)
    
    private let signInButton = CustomButton(title: "Sign In",hasBackGround: true ,fontSize: .big )
    private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize:  .small)
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.view.backgroundColor = .white

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.signInButton.addTarget( self, action: #selector(self.didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget( self, action: #selector(didTapNewUserButton), for: .touchUpInside)
        self.forgotPasswordButton.addTarget( self, action: #selector(didTapForgottenPasswordButton), for: .touchUpInside)
        //                self.didTapNewUserButton()
    }
    //MARK: - Selectors
    @objc private func didTapSignIn() {
        let loginRequest = LoginUserRequest(
            email: self.emailTextField.text ?? "",
            password: self.passwordField.text ?? ""
        )
        
        print(self.emailTextField)
        print("email1: \(loginRequest.email)")
        
        if !Validator.isValidEmail(for: loginRequest.email) {
            print("email: \(loginRequest.email)")
            AlertManager.showInvalidEmailAlert(on: self)
            
            return
        }

        if !Validator.isPasswordValid(forPassword: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        
        AuthService.shared.signIn(with: loginRequest) { error in
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    @objc private func didTapNewUserButton () {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgottenPasswordButton () {
       let vc =  ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true )
    }
    
 
     
    //MARK: - UI Setup
    private func setUpUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
    
            self.emailTextField.topAnchor.constraint(equalTo:   headerView .bottomAnchor, constant: 22),
            self.emailTextField.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            self.emailTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),

            self.passwordField.topAnchor.constraint(equalTo:   emailTextField.bottomAnchor, constant: 12),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView  .centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 45),
            self.passwordField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo:   passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo:   signInButton.bottomAnchor, constant: 11),
            self.newUserButton.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 45),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo:   newUserButton   .bottomAnchor, constant: 6),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
}

