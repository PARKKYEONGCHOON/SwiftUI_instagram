//
//  NotificationCell.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("dasdaad").font(.system(size: 14, weight: .semibold))
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    
            }
            else{
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14,weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
