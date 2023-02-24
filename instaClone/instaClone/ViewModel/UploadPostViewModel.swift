//
//  UploadPostViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/24.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestorCompletion){
        guard let user = AuthViewModel.shared.curretUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                            "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUrl": user.id as Any,
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String : Any]
            
            
            
            Firestore.firestore().collection("posts").addDocument(data: data, completion: completion) 
            
            
        }
        
    }
    
}
