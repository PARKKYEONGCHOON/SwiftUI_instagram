//
//  NotificationView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var viewModel = NotificationViewModel()
    
    
    
    
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
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
