//
//  NotificationCellViewModel.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/27.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    var timestampString: String {
        let formmatter = DateComponentsFormatter()
        formmatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formmatter.maximumUnitCount = 1
        formmatter.unitsStyle = .abbreviated
        return formmatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(notification: Notification){
        self.notification = notification
        checkifUserIsFollowed()
        fetNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        
        UserService.follow(uid: notification.uid) { _ in
            NotificationViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollowd() {
        //guard let uid = user.id else { return }
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkifUserIsFollowed(){
        //guard !user.isCurrentUser else { return }
        //guard let uid = user.id else { return }
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollwed in
            self.notification.isFollowed = isFollwed
        }
    }
    
    func fetNotificationPost(){
        guard let postId = notification.postId else { return }
        
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser(){
        COLLECTION_USERS.document(notification.uid).getDocument{ snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
}
