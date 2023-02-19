//
//  FeedCell.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading){
            
            //user
            HStack{
                Image(systemName: "house")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36,height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("user")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading,.bottom], 8)
            
            // Image
            Image(systemName: "heart")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 350)
                .clipped()
                
            
            // button
            HStack(spacing: 16){
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                })
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                })
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            
            //likes
            Text(" 3likes")
                .font(.system(size: 14,weight: .semibold))
                .padding(.leading, 4)
                .padding(.bottom, 1)
            
            // caption
            
            HStack{
                Text("dasdaad").font(.system(size: 14, weight: .semibold))
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 4)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 4)
                .padding(.top, 1)
                
                
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
