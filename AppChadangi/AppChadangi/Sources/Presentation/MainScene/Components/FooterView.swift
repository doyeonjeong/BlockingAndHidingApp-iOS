//
//  FooterView.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit
import SnapKit

protocol FooterViewDelegate: AnyObject {
    func didTapBlockingButton()
}

class FooterView: UIView {
    
    weak var delegate: FooterViewDelegate?
    
    private lazy var _blockingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black.withAlphaComponent(0.25)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("차단하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTapBlocking), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _setup()
    }

}

// MARK: - Setup
extension FooterView {
    
    private func _setup() {
        _addSubviews()
        _setConstraints()
    }
    
    private func _addSubviews() {
        addSubview(_blockingButton)
    }
    
    private func _setConstraints() {
        _blockingButton.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
}

// MARK: - Actions
extension FooterView {
    
    @objc private func didTapBlocking() {
        delegate?.didTapBlockingButton()
    }
    
}
