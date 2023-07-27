//
//  UIView+Extension.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit

extension UIView {
    func applyGradient(colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}
