//
//  FeedCellVIewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/24.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        
        let label = post.likes == 1 ? "like" : "likes"
        
        return "\(post.likes) \(label)"
    }
    
    var timestampString: String {
        let formmatter = DateComponentsFormatter()
        formmatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formmatter.maximumUnitCount = 1
        formmatter.unitsStyle = .abbreviated
        return formmatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post){
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user_likes")
                    .document(uid).setData([:]) { _ in
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                        
                        NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                        
                        self.post.didLikes = true
                        self.post.likes += 1
                    }
            }
    }
    
    func unlike(){
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLikes = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId)
            .getDocument{ snapshot, _ in
                guard let didLike = snapshot?.exists else { return }
                self.post.didLikes = didLike
            }
    }
}
