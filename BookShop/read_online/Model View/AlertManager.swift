//
//  AlertManager.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 30/04/2024.
//

import UIKit

class AlertManager {

    private static func showBasicAlert(on vc: UIViewController,title : String,  msg: String?){
       
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style:   .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: -  Show  Validation alerts
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc,title:  "Invalid Email", msg: "Please enter a Valid email. ")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc,title:  "Invalid password", msg: "Please enter a Valid password. ")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc,title:  "Invalid username", msg: "Please enter a Valid username. ")
    }
    
    public static func showInvalidAgeInput(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Age Input", msg: "your age shoudl be between 5 and 100 years old")
    }
}


//MARK: -  Registeration Errors
extension AlertManager {
    
    public static func showRegisterationErrorslAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc,title:  "Unkown Registration Error.", msg: nil)
    }
    
    //this error will be passed by fire base
    public static func showRegistrationErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on:  vc , title: "Registeration Error. ", msg: "\(error.localizedDescription) ")
    }
}
    
    //MARK: -  Login Errors
extension AlertManager {
    
    public static func showSignInErrorslAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc,title:  "login Error.", msg: nil)
    }
    
    //this error will be passed by fire base
    public static func showSignInErrorslAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on:  vc , title: "Login Error. ", msg: "\(error.localizedDescription  ) ")
    }
}
//MARK: - Logout Errors
extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "can't logout now", msg: "try again the error is: \(error.localizedDescription)")
    }
}

//MARK: - Forgot Password Alerts(either sent or no)
extension AlertManager {
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Sending Password Reset", msg: "\(error.localizedDescription)")
    }
    
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reseted Successfully", msg: nil )
    }
}

//MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showUserFetchingError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching User.", msg: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserErrpr(on vc: UIViewController, with error : Error) {
        self.showBasicAlert(on: vc, title: "Unkown Error", msg: nil)
    }
}
