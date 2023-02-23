//
//  UserStartView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text(title)
                .font(.system(size: 15))
        }
        //.frame(width: 80, alignment: .center)
    }
}

struct UserStartView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}
