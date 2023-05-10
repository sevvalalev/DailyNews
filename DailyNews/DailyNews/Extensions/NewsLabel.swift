//
//  NewsLabel.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import Foundation
import UIKit

extension UILabel {
    func setSameFont(withText text: String? = nil) {
        self.font = UIFont(name: "Oranienbaum-Regular", size: 16)
        if let text = text {
            self.text = text
        }
    }
}
