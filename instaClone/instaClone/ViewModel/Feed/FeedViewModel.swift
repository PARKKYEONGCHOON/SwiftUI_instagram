//
//  FeedViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPost()
        //getPost()
        //onepost()
    }
    
    func fetchPost(){
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            print("Feed View doc\(documents)")
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            print("Feed View post\(self.posts)")
        }
    }
    
    func getPost() {
        Firestore.firestore().collection("posts").getDocuments { snapshot, error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else { return } // document들을 가져옴

            let users = documents.compactMap({ try? $0.data(as: Post.self) }) // User 구조체로 전부 매핑
            
            print("get Feed View post\(users)")
        }
    }
    
    func onepost(){
        Firestore.firestore().collection("posts").document("qPvi9wrAIngvJxDziCLt4s1bMbr2").getDocument { snapshot, error in
                        guard let userData = try? snapshot?.data(as: Post.self) else { return } // 매핑(FirebaseFirestoreSwift 라이브러리를 추가해야 사용가능)
                        print("\(userData)")
                        
                    }
    }
}
