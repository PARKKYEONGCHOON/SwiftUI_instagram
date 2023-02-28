//
//  EditProfileViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/28.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User){
        self.user = user
    }
    
    func saveUserBio(_ bio: String){
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
            
        }
    }
}
