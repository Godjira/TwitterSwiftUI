//
//  ImageUploader.swift
//  TwitterSwiftUI
//
//  Created by Slava on 20/03/2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class ImageUploader {
    
    static func upload(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrlString = imageUrl?.absoluteString else { return }
                completion(imageUrlString)
            }
            
        }
    }
    
}
