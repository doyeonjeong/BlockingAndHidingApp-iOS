//
//  MenuViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/27.
//

import UIKit
import SnapKit
import StoreKit

final class MenuViewController: UIViewController {
    
    private lazy var _contactButton: UIView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark.circle")
        imageView.tintColor = .white.withAlphaComponent(0.75)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        
        let label = UILabel()
        label.text = "문제가 있나요?"
        label.textColor = .white.withAlphaComponent(0.75)
        label.textAlignment = .right
        label.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .trailing
        stackView.sizeToFit()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self._mailToMe))
        stackView.addGestureRecognizer(tapGesture)
        
        return stackView
    }()
    
    private lazy var _menuListTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        return tableView
    }()
    
    private lazy var _controlSwitch: UISwitch = {
        let swicth: UISwitch = UISwitch()
        swicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        swicth.isOn = true
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)
        return swicth
    }()
    
    private var _isAlertAuthorization: Bool = false
    
    private let _appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    
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
            UIColor(red: 0.99, green: 0.65, blue: 0.04, alpha: 1.00).cgColor,
            UIColor(red: 0.85, green: 0.11, blue: 0.07, alpha: 1.00).cgColor
        ])
    }
    
    private func _addSubviews() {
        view.addSubview(_contactButton)
        view.addSubview(_menuListTableView)
    }
    
    private func _setConstraints() {
        
        _contactButton.snp.makeConstraints {
            $0.top.right.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(50)
        }
        
        _menuListTableView.snp.makeConstraints {
            $0.top.equalTo(_contactButton.snp.bottom).offset(16)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 1:
            _openSetting()
            break
        case 2:
            _openAppStoreReview(appId: "6455080663")
            break
        default:
            break
        }
    }
    
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.attributedText = makeAttributedText(title: "App Version")
            content.secondaryAttributedText = makeAttributedText(title: _appVersion, size: 16, weight: .light)
            content.prefersSideBySideTextAndSecondaryText = true
        case 1:
            content.attributedText = makeAttributedText(title: "앱 숨기기 모드")
            cell.accessoryView = _controlSwitch
        case 2:
            content.attributedText = makeAttributedText(title: "스크린 타임 권한 설정")
        case 3:
            content.attributedText = makeAttributedText(title: "앱 평가하기")
        default:
            content.text = ""
            content.textProperties.color = .white
        }
        
        content.textProperties.color = .black
        cell.contentConfiguration = content
        return cell
    }
    
}

// MARK: - Actions
extension MenuViewController {
    
    @objc private func _mailToMe() {
        let email = "debby_@kakao.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    private func _openSetting() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func _openAppStoreReview(appId: String) {
        let url = "itms-apps://itunes.apple.com/app/" + appId;
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}

extension MenuViewController {
    
    private func makeAttributedText(title: String = "", size: CGFloat = 18, weight: UIFont.Weight = .regular) -> NSAttributedString? {
        return NSAttributedString(string: title, attributes: [
            .font: UIFont.systemFont(ofSize: size, weight: weight),
            .foregroundColor: UIColor.white,
        ])
    }
    
    @objc func onClickSwitch(sender: UISwitch) {
        print(#function)
    }
    
}
