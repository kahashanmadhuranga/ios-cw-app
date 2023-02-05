//
//  RegisterViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 2/5/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    internal let registerView = RegisterUIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
    }

}
