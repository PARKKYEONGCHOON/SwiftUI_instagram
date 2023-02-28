//
//  Comment.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/26.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    var timestampString: String? {
        let formmatter = DateComponentsFormatter()
        formmatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formmatter.maximumUnitCount = 1
        formmatter.unitsStyle = .abbreviated
        return formmatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
}
