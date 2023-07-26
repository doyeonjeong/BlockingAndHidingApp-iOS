//
//  ViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var _headerView = HeaderView()
    private lazy var _footerView = FooterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        _setup()
    }
}

// MARK: - Setup
extension MainViewController {
    
    private func _setup() {
        _addSubviews()
        _setConstraints()
        _setDelegate()
    }
    
    private func _addSubviews() {
        view.addSubview(_headerView)
        view.addSubview(_footerView)
    }
    
    private func _setDelegate() {
        _headerView.delegate = self
        _footerView.delegate = self
    }
    
    private func _setConstraints() {
        _headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
        
        _footerView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(70)
            $0.left.right.equalToSuperview().inset(30)
        }
    }
}

// MARK: - HeaderViewDelegate
extension MainViewController: HeaderViewDelegate {
    
    func didTapSettingsButton() {
        print(#function)
        // TODO: Show Modal View
    }
}

// MARK: - FooterViewDelegate
extension MainViewController: FooterViewDelegate {
    
    func didTapBlockingButton() {
        print(#function)
        // TODO: Show Alert
    }
}
