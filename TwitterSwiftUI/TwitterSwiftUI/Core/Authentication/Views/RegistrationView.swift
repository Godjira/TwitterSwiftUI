//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Slava on 14/03/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack {
            NavigationLink(destination: ProfilePhotoSelectorView()
                .environmentObject(authVM),
                           isActive: $authVM.didAuthenticateUser) {
                
            }

            
            AuthHeaderView(title1: "Get started.", title2: "Create new account")
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 text: $username)
                CustomInputField(imageName: "person",
                                 placeholderText: "Full name",
                                 text: $fullname)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                authVM.register(with: email, password, fullname, username)
            } label: {
                Text("Sing Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.top)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss() 
            } label: {
                Text("Already have account?")
                    .font(.footnote)
                Text("Sing Ip")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
