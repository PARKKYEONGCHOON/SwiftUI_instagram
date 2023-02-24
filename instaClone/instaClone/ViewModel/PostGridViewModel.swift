//
//  PostGridViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/24.
//

import SwiftUI
import Firebase

enum PostGridConfiguration {
    case explore
    case profile(String)
    //case hashtag(String)
}

class PostGridviewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts(){
        Firestore.firestore().collection("posts").getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            print("\(documents)")
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            print("\(self.posts)")
        }
    }
    
    func fetchUserPosts(forUid uid: String){
        Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            print("\(documents)")
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            
            print("\(self.posts)")
        }
    }
    
    
}
