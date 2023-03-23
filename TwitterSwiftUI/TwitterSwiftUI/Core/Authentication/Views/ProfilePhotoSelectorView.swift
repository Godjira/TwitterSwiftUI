//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Slava on 19/03/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create your account", title2: "Add a profile photo")
            
            Spacer()
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 240, height: 240)
                        .clipShape(Circle())
                    
                } else {
                    VStack {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .offset(y: -12)
                        Text("Select photo")
                            .font(.title)
                            .offset(y: -4)
                    }
                    .frame(width: 240, height: 240)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                    
                }
            }
            .shadow(radius: 10)
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage,
                   content: {
                ImagePicker(selectedImage: $selectedImage)
            })
            
            
            Spacer()
            
            if let selectedImage = selectedImage {
                Button {
                    authVM.uploadProfileImage(selectedImage)
                } label: {
                    HStack {
                        Spacer()
                        Text("Continue")
                        Spacer()
                    }

                }
                .padding()
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
                .padding()
            }
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage )
    }
    
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
