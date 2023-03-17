//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Slava on 14/03/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        // parent container
        VStack {
            
            AuthHeaderView(title1: "Hello.", title2: "Welkome back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)

            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset password")
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }

            }
            Button {
                authVM.logIn(with: email, and: password)
            } label: {
                Text("Sing In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.top)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()

            NavigationLink {
                RegistrationView()
                    .environmentObject(authVM)
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have account?")
                        .font(.footnote)
                    Text("Sing Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
