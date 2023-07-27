//
//  ViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    
    let blockManager = BlockManager()
    
    private lazy var _headerView = HeaderView()
    
    private lazy var _footerView: FooterView = {
        return FooterView(blockManager: self.blockManager)
    }()

    private lazy var _mainView: UIHostingController<some View> = {
        let hostingController = UIHostingController(
            rootView: BlockedAppListView()
                .environmentObject(self.blockManager)
        )
        hostingController.view.backgroundColor = .clear
        return hostingController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        _setup()
    }
}

// MARK: - Setup
extension MainViewController {
    
    private func _setup() {
        _addChilds()
        _addSubviews()
        _setConstraints()
        _setDelegate()
    }
    
    private func _addChilds() {
        addChild(_mainView)
    }
    
    private func _addSubviews() {
        view.addSubview(_headerView)
        view.addSubview(_mainView.view)
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
            $0.height.equalTo(60)
        }
        
        _mainView.view.snp.makeConstraints {
            $0.top.equalTo(_headerView.snp.bottom)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.bottom.equalTo(_footerView.snp.top).inset(-30)
        }
        
        _footerView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(60)
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

        blockManager.block { result in
            switch result {
            case .success():
                let alertController = UIAlertController(title: "차단 성공", message: "차단했습니다.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alertController, animated: true)
            case .failure(let error):
                let alertController = UIAlertController(title: "차단 실패", message: "차단에 실패했습니다.\n[오류: \(error.localizedDescription)]", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alertController, animated: true)
            }
        }
        
    }
    
    func didTapReleaseButton() {
        
        blockManager.release()
        
        let alertController = UIAlertController(title: "차단 해제", message: "차단이 해제되었습니다.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default))
        present(alertController, animated: true)
        
    }
    
}
