//
//  PostGridView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2,content: {
            ForEach(0 ..< 10, content: { _ in
                NavigationLink(
                    destination: FeedView(),
                    label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
            })
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
