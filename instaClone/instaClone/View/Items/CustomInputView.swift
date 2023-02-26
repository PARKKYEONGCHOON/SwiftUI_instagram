//
//  CustomInputView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/26.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            //divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height:  0.75)
                .padding(.bottom, 8)
            
            //
            HStack{
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action){
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
        
    }
}


