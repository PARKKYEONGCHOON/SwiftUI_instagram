//
//  UserListView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filleredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(){
                ForEach(users) { user in
                    NavigationLink(
                        destination: ProfileView(user: user),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}


