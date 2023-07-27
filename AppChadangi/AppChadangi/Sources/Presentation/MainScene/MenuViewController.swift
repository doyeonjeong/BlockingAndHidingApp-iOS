//
//  MenuViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/27.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setup()
    }
    
}

// MARK: - Setup
extension MenuViewController {
    
    private func _setup() {
        _setUI()
        _addSubviews()
        _setConstraints()
    }
    
    private func _setUI() {
        self.view.applyGradient(colors: [
            UIColor(red: 0.69, green: 0.46, blue: 0.05, alpha: 1.00).cgColor,
            UIColor(red: 0.55, green: 0.07, blue: 0.05, alpha: 1.00).cgColor
        ])
    }
    
    private func _addSubviews() {
        
    }
    
    private func _setConstraints() {
        
    }
    
}

// MARK: - Adctions
extension MenuViewController {
    
}
