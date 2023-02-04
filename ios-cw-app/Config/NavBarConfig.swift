//
//  NavBarConfig.swift
//  ios-cw-app
//
//  Created by Hashan on 2/4/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import Foundation
import UIKit

struct NavBarConfig {
    static func config(){
        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .done, target: self, action: nil)
        let wishlistButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: nil)
        
        let uiViewController = UIViewController();
        
        uiViewController.navigationItem.rightBarButtonItems = [userButton, wishlistButton]
        uiViewController.navigationController?.navigationBar.tintColor = .white
        uiViewController.navigationController?.navigationBar.barTintColor = .clear
    }
}
