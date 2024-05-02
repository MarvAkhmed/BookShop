//
//  SceneDelegate.swift
//  read_online   
//
//  Created by marwa awwad mohamed awwad on 28/04/2024.
//

import UIKit
 import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with:  scene)
        self.checkAuthentication()
        

         
        //MARK: - to add user to firebase manually(no need for it anymore)
        //        let userReq = RegisterUserRequest(username: "marwa", email: "marwa@email.com", password: "1234567")
        //        AuthService.shared.registerUser(with: userReq) { wesRegistred, error in
        //            if let error  = error {
        //                print(error.localizedDescription)
        //            }
        //            print("was registred: \(wesRegistred )")
        //        }
        
    }
    //MARK: -
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = ( scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
          
    }
    
    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            self.goToController(with: LoginController())
            
        }else {
            
            self.goToController(with: ProfileController())

        }
    }
    
    
    //MARK: - animation
    private func goToController(with viewController: UIViewController) {
        
        //we are goind to be doing UI work, so better to do it on another thread
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration:  0.25) {
                self?.window?.layer.opacity = 0
            } completion: {[weak self] _ in
                
                
                
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) {
                    self?.window?.layer.opacity =  1
                }
                  
            }

            
        }
    }
}




//
//
//
//
//
//
//
//    var window: UIWindow?
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        
//        let vc = HomeController()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.modalPresentationStyle = .fullScreen
//        window.rootViewController = nav
//        self.window = window
//        window.makeKeyAndVisible()
//        
//        
//    }
//    public func checkAuthentication() {
//        if Auth.auth().currentUser == nil {
//            self.goToController(with: LoginController())
//            
//        }else {
//            self.goToController(with: ProfileController())
//            
//        }
//    }
//    private func goToController(with viewController: UIViewController) {
//        
//        //we are goind to be doing UI work, so better to do it on another thread
//        DispatchQueue.main.async { [weak self] in
//            UIView.animate(withDuration:  0.25) {
//                self?.window?.layer.opacity = 0
//            } completion: {[weak self] _ in
//                
//                
//                
//                let nav = UINavigationController(rootViewController: viewController)
//                nav.modalPresentationStyle = .fullScreen
//                self?.window?.rootViewController = nav
//                
//                UIView.animate(withDuration: 0.25) {
//                    self?.window?.layer.opacity =  1
//                }
//                
//            }
//        }
//        
//    }
//}
