//
//  ProfileViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
        checkifUserIsFollowed()
        fetchUserstats()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            NotificationViewModel.uploadNotification(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unfollowd() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkifUserIsFollowed(){
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollwed in
            self.user.isFollowed = isFollwed
        }
    }
    
    func fetchUserstats(){
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments{ snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            
            
            COLLECTION_FOLLOWING.document(uid).collection("user-followers").getDocuments{ snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments{ snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                    
                    print("user stats\(self.user.stats)")
                }
            }
        }
    }
}
