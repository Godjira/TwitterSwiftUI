//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Slava on 17/03/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG:  User session uid: \(self.userSession?.uid)")
    }
    
    func logIn(with email: String, and password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) {result,error in
            if let error = error {
                print("DEBUG: Sign In failed with error: \(error.localizedDescription)")
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: SignIn completed with email: \(email) and pass: \(password)")
        }
        
        
    }
    
    func register(with email: String, _ password: String, _ fullname: String, _ username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to registration with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Registration was succesfull")
            print("DEBUG: User is \(user)")
            
            let userData = ["email": email,
                            "username": username.lowercased(),
                            "fullname": fullname,
                            "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid)
                .setData(userData) { _ in
                    print("DEBUG: User data was upload")
                }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        print("DEBUG: Sign Out")
        
    }
    
}
