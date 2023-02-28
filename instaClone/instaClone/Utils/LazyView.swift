//
//  LazyView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/28.
//

import SwiftUI

struct LazyView<Content: View>: View{
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
