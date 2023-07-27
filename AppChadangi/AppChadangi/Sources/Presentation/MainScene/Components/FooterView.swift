//
//  FooterView.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit
import SnapKit
import Combine

private enum ButtonState {
    case empty
    case blocked
    case unblocked
}

protocol FooterViewDelegate: AnyObject {
    func didTapBlockingButton()
    func didTapReleaseButton()
}

class FooterView: UIView {
    
    let blockManager: BlockManager
    
    weak var delegate: FooterViewDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var _blockingButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("차단하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        return button
    }()
    
    private lazy var _releaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1.00, green: 0.64, blue: 0.03, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("차단해제", for: .normal)
        button.titleLabel?.textColor = UIColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.00)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTapRelease), for: .touchUpInside)
        return button
    }()
    
    init(frame: CGRect = .zero, blockManager: BlockManager) {
        self.blockManager = blockManager
        super.init(frame: frame)
        _setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup
extension FooterView {
    
    private func _setup() {
        _addSubviews()
        _setConstraints()
        _addObserver()
    }
    
    private func _addSubviews() {
        addSubview(_blockingButton)
        addSubview(_releaseButton)
    }
    
    private func _setConstraints(_ state: ButtonState = .empty) {
        _blockingButton.snp.removeConstraints()
        _releaseButton.snp.removeConstraints()

        switch state {
        case .empty:
            _prepareEmptyState()
        case .blocked:
            _prepareBlockedState()
        case .unblocked:
            _prepareUnblockedState()
        }
    }

    private func _prepareEmptyState() {
        _blockingButton.backgroundColor = UIColor(red: 0.39, green: 0.39, blue: 0.40, alpha: 0.6)
        _blockingButton.titleLabel?.textColor = UIColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.00)
        _blockingButton.isEnabled = false
        _blockingButton.isHidden = false
        _releaseButton.isHidden = true
        _blockingButton.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }

    private func _prepareBlockedState() {
        _blockingButton.isHidden = true
        _releaseButton.isHidden = false
        _releaseButton.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }

    private func _prepareUnblockedState() {
        _blockingButton.backgroundColor = UIColor(red: 0.72, green: 0.06, blue: 0.03, alpha: 1.00)
        _blockingButton.titleLabel?.textColor = .white
        _blockingButton.isEnabled = true
        _blockingButton.isHidden = false
        _releaseButton.isHidden = true
        _blockingButton.addTarget(self, action: #selector(didTapBlocking), for: .touchUpInside)
        _blockingButton.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
    private func _addObserver() {
        blockManager.$isEmpty
            .combineLatest(blockManager.$isBlocked)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] isEmpty, isBlocked in
                if isEmpty {
                    _setConstraints(.empty)
                } else if isBlocked {
                    _setConstraints(.blocked)
                } else {
                    _setConstraints(.unblocked)
                }
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - Actions
extension FooterView {
    
    @objc private func didTapBlocking() {
        delegate?.didTapBlockingButton()
    }
    
    @objc private func didTapRelease() {
        delegate?.didTapReleaseButton()
    }
    
}
