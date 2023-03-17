//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Slava on 04/03/2023.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(viewModel)
            }
        }
    }
}
