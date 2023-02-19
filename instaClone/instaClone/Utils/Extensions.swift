//
//  Extensions.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/19.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
