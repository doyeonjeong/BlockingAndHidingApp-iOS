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

    override func viewDidLoad() {
        super.viewDidLoad()
        _setup()
    }

}

extension MainViewController {
    private func _setup() {
        _addSubviews()
        _setConstraints()
        _setDelegate()
    }
    
    private func _addSubviews() {
        view.addSubview(_headerView)
    }
    
    private func _setDelegate() {
        _headerView.delegate = self
    }
    
    private func _setConstraints() {
        _headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
    }
}

extension MainViewController: HeaderViewDelegate {
    
    func didTapSettingsButton() {
        // TODO: Modal View lPresentationStyle = .pageSheet
    }
    
}
