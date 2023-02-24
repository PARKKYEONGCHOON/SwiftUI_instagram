//
//  FeedCell.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    //let viewMoel.post: Post
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLikes ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            //user
            HStack{
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36,height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading,.bottom], 8)
            
            // Image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 350)
                .clipped()
                
            
            // button
            HStack(spacing: 16){
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heartfill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20,height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                })
                
                Button(action: {
                    
                }, label: {
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
            Text(viewModel.likeString)
                .font(.system(size: 14,weight: .semibold))
                .padding(.leading, 4)
                .padding(.bottom, 1)
            
            // caption
            
            HStack{
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text("\(viewModel.post.caption)")
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

/*struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}*/
