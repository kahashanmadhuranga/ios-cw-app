//
//  ViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 1/27/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        
        let homeController = UINavigationController(rootViewController: HomeViewController())
        let foodDetailsController = UINavigationController(rootViewController: FoodDetailViewController())
        let wishlistController = UINavigationController(rootViewController: WishlistViewController())
        
        homeController.tabBarItem.image = UIImage(systemName: "house")
        foodDetailsController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        wishlistController.tabBarItem.image = UIImage(systemName: "gear")
        
        homeController.title = "Home"
        foodDetailsController.title = "Search"
        wishlistController.title = "Settings"
        
        tabBar.tintColor = .label
        
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().tintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Acme-Regular", size: 12) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Acme-Regular", size: 12) as Any], for: .selected)
        
        setViewControllers([homeController, foodDetailsController, wishlistController], animated: true)
    }

}

