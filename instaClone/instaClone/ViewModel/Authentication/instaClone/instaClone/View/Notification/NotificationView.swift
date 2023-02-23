//
//  NotificationView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct NotificationView: View {
    
    
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(0 ..< 20) { _ in
                    NotificationCell()
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
