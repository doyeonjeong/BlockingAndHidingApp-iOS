//
//  UIView+Extension.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit

extension UIView {
    func applyGradient(colos: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colos
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}
