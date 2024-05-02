//
//  LoginService.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 30/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    //MARK: - single tone
     public static let shared = AuthService()
     private init() {}
    
    //MARK: - sign Up
    /// a method to register  the uer
    /// - Parameters:
    ///   - userRequest: user's info(email, password, username)
    ///   - completion: a completion of two values...
    ///   - bool: was registered  - determines if the user was registered and saved in the database correctly or no
    ///   - Error?: an optional error if firebase  provides one
    public func registerUser(with userRequest: RegisterUserRequest,
                             completion: @escaping(Bool, Error?) -> Void) {
        
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        let age = userRequest.age
        var checkBox = CheckBox()
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let  resultUser = result?.user  else{
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email,
                    "password": password,
                    "age": age
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
        
    }
    //MARK: - signIn
    public func signIn(with userRequest: LoginUserRequest, completion: @escaping (Error?)->Void) {
        Auth.auth().signIn(
            withEmail: userRequest.email,
            password: userRequest.password
        ) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - sign out
    public func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try  Auth.auth().signOut()
            completion(nil)
        }catch let error {
            completion(error)
        }
    }
    //MARK: - fetch users
    
    
    //MARK: - forgotten passwords logic
    public func forgotPass(with email: String, completion: @escaping  (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
}


