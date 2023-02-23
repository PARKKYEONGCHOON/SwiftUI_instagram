//
//  ContentView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var SelectedIndex = 0
    
    var body: some View {
        Group{
            
            if viewModel.userSession == nil{
                LoginView()
            }
            else{
                if let user = viewModel.curretUser {
                    MainTabView(user: user, selectedIndex: $SelectedIndex)
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
