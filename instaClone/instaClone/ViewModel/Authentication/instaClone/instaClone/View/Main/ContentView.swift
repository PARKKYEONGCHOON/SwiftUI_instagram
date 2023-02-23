//
//  ContentView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            
            if viewModel.userSession == nil{
                LoginView()
            }
            else{
                if let user = viewModel.curretUser {
                    MainTabView(user: user)
                }
            }
            // else show main
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
