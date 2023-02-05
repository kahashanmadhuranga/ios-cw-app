//
//  LoginViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 2/5/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    internal let loginView = LoginUIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        let loginViewConstraints = [
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            loginView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/5*4)
        ]
        
        NSLayoutConstraint.activate(loginViewConstraints)
    }
    
    @objc func login(){
        print("----btn click----")
        let vc = MainTabBarViewController()
    }

}
