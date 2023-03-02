//
//  Constans.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/23.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("user-followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("user-following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
