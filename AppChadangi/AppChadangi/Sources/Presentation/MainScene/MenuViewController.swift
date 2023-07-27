//
//  MenuViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/27.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    
    private lazy var _contactButton: UIView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark.circle")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        
        let label = UILabel()
        label.text = "문제가 있나요?"
        label.textColor = .white
        label.textAlignment = .right
        label.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .trailing
        stackView.sizeToFit()
        
        return stackView
    }()
    
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
        view.addSubview(_contactButton)
    }
    
    private func _setConstraints() {
        
        _contactButton.snp.makeConstraints {
            $0.top.right.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(50)
        }
        
    }
    
}

// MARK: - Adctions
extension MenuViewController {
    
}
