//
//  SearchViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            
        }
    }
    
    func filleredUsers(_ query: String) -> [User] {
        let lowerscasedQuery = query.lowercased()
        
        return users.filter({ $0.fullname.lowercased().contains(lowerscasedQuery) || $0.username.lowercased().contains(lowerscasedQuery) })
    }
}
