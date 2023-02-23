//
//  UserCell.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack{
            //image
                //Image(systemName: "person")
            KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            
            
            //VStack -> username, fullname
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}


