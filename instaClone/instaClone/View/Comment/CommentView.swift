//
//  CommentView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/26.
//

import SwiftUI

struct CommentView: View {
    
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            
            //commentCell
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 24){
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                            
                    }
                }
            }.padding(.top)
            
            //input
            CustomInputView(inputText: $commentText, action: uploadComment)
            
        }
    }
    
    func uploadComment(){
        viewModel.uploadComment(commnetText: commentText)
        commentText = ""
    }
}

