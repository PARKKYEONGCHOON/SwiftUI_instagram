//
//  TextArea.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/24.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String){
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
            }
            
            TextEditor(text: $text)
                .padding(.horizontal, 0)
                .padding(.vertical, 0)
        }
        .font(.body)
    }
}

/*struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea()
    }
}*/
