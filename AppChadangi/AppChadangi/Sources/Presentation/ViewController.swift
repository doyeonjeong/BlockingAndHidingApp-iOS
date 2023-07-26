//
//  ViewController.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var _helloWorld: UILabel = {
        let label = UILabel()
        label.text = "hello world"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(_helloWorld)
        
        _helloWorld.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            _helloWorld.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            _helloWorld.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

}
