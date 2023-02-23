//
//  SearchView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            // search Bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            // grid/User View
            ZStack{
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                }
                else{
                    PostGridView()
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
