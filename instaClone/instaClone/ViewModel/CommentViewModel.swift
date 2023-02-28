//
//  CommentViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/26.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post){
        self.post = post
        fetchComment()
    }
    
    
    
    func uploadComment(commnetText: String) {
        guard let user = AuthViewModel.shared.curretUser else { return }
        guard let postId = post.id else { return }
        let data:[ String: Any] = ["username": user.username,
                    "profileImage": user.profileImageUrl,
                    "uid": user.id ?? "",
                    "timestamp": Timestamp(date: Date()),
                    "postOwnerUid": post.ownerUid,
                    "commentText": commnetText]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }
        }
        
    }
    
    func fetchComment() {
        guard let postId = post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
            
            
            NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
    
}
