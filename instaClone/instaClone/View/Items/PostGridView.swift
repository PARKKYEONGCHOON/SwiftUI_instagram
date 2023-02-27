//
//  PostGridView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridviewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridviewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2,content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
            }
        })
    }
}

/*struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}*/
