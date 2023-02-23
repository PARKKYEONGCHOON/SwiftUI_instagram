//
//  instaCloneApp.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/14.
//

import SwiftUI
import Firebase

@main
struct instaCloneApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
            //LoginView().environmentObject(AuthViewModel())
        }
    }
}
