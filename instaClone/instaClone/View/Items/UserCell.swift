//
//  UserCell.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            //image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            
            
            //VStack -> username, fullname
            VStack(alignment: .leading){
                Text("User")
                    .font(.system(size: 14, weight: .semibold))
                Text("Person")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
