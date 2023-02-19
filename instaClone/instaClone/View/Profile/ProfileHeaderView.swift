//
//  ProfileHeaderView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 14) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing, 32)
                
            }
            
            //name
            Text("User")
                .font(.system(size: 15,weight: .semibold))
                .padding([.leading, .top])
            
            Text("Korea")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            
            HStack {
                
                Spacer()
                
                //button
                ProfileActionButtonView()
                
                Spacer()
            }.padding(.top)
            
            
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
