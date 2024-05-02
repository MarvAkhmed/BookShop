//
//  SignUpController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 28/04/2024.
//

import UIKit

class RegisterController: UIViewController {

    private let headerView = AuthHeaderView(title: "Sign Up", subtitle: "create your account")
    
    private let usernameTextField = CustomTextField(fieldType: .username)
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let confirmPasswordTextField = CustomTextField(fieldType: .confirmPassword)
    private let ageTextField = CustomTextField(fieldType: .age)
    
    private let signUpButton = CustomButton(title: "Sign Up", hasBackGround: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Alreade have an account? Sign In.",  fontSize: .med)
    
    private let checkBox = CheckBox()
    
   

  
    private let   writers_label : UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 70))
        label.text = "iam a writer and ready to take the test"
        label.textAlignment = .left
        label.font.withSize(10)
        label.textColor = .darkGray
        return label
    
    }()
    private let termsTextView: UITextView = {
        let textView = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you aknowlage that you have read our Privacy Policy.")
        
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacypolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue ]
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.termsTextView.delegate = self
        self.setUpUI()
    
        
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        checkBox.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped))
        checkBox.addGestureRecognizer(gesture)
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    //TODO: - combine should be used to check the password confermation

    //MARK: - UI Setup
    private func setUpUI() {
         
        self.view.addSubview(headerView)
        
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(confirmPasswordTextField)
        self.view.addSubview(ageTextField)
        
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        self.view.addSubview(checkBox)
        self.view.addSubview(writers_label)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        writers_label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 200),
            
            self.usernameTextField.topAnchor.constraint(equalTo:   headerView.bottomAnchor, constant: 12),
            self.usernameTextField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameTextField.heightAnchor.constraint(equalToConstant: 45),
            self.usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.emailTextField.topAnchor.constraint(equalTo:   usernameTextField.bottomAnchor, constant: 22),
            self.emailTextField.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            self.emailTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),

            self.passwordTextField.topAnchor.constraint(equalTo:   emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.centerXAnchor.constraint(equalTo: headerView  .centerXAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            self.passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.confirmPasswordTextField.topAnchor.constraint(equalTo:   passwordTextField.bottomAnchor, constant: 12),
            self.confirmPasswordTextField.centerXAnchor.constraint(equalTo: headerView  .centerXAnchor),
            self.confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 45),
            self.confirmPasswordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.ageTextField.topAnchor.constraint(equalTo:   confirmPasswordTextField.bottomAnchor, constant: 12),
            self.ageTextField.centerXAnchor.constraint(equalTo: headerView  .centerXAnchor),
            self.ageTextField.heightAnchor.constraint(equalToConstant: 45),
            self.ageTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),

            self.termsTextView.topAnchor.constraint(equalTo:   signUpButton.bottomAnchor, constant: 11),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo:   termsTextView.bottomAnchor, constant: 6),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView .centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.checkBox.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 14),
            self.checkBox.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.checkBox.widthAnchor.constraint(equalToConstant: 20),
            self.checkBox.heightAnchor.constraint(equalToConstant: 20),
            
            
            self.writers_label.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 12),
            self.writers_label.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 5)
            
            
            
        ])
    }
    //MARK: - Selectors
    
    @objc private func didTapSignUpButton() {
        let registerRequest = RegisterUserRequest(
                                                  username: self.usernameTextField.text ?? "",
                                                  email: self.emailTextField.text ?? "",
                                                  password: self.passwordTextField.text ?? "",
                                                  age: self.ageTextField.text ?? ""
        )
        
        //check validation of new user's info
        if !Validator.isUsernameValid(forUsername: registerRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validator.isValidEmail(for: registerRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }

        if !Validator.isPasswordValid(forPassword: registerRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        if !Validator.isAgeValid(forAge: registerRequest.age) {
            AlertManager.showInvalidAgeInput(on: self)
        }
        
     
        
        AuthService.shared.registerUser(with: registerRequest) { [weak self] wasRegistred, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, error: error)
                  return
            }
            if wasRegistred && checkBox.isChecked{
                if let sceneDelegate = self.view.window?.windowScene?.delegate
                    as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            }
            let checkBox = CheckBox()
            if !checkBox.isChecked {
                print("--DEBUG: should navigate to the writers screen to complete registeration")
            } else {
                AlertManager.showRegisterationErrorslAlert(on: self)
            }
        }
    }
      
    @objc private func didTapSignInButton() {
        self.navigationController?.popViewController(animated: true)
    }
 
    @objc private func checkBoxTapped() {
        self.checkBox.toogle()
    }

}
extension RegisterController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.scheme == "terms" {
            self.showViewControllerWeb(with: "https://policies.google.com/terms?hl=en-US")
        }else if URL.scheme == "privacy" {
            self.showViewControllerWeb(with: "https://policies.google.com/privacy?hl=en-US")
            
        }
        return true
    }
    
    private func showViewControllerWeb (with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav =  UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
}

