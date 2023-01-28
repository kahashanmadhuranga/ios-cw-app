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
        foodDetailsController.tabBarItem.image = UIImage(systemName: "icloud.and.arrow.down.fill")
        wishlistController.tabBarItem.image = UIImage(systemName: "gear")
        
        homeController.title = "Home"
        foodDetailsController.title = "Food"
        wishlistController.title = "Wishlist"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeController, foodDetailsController, wishlistController], animated: true)
    }

}

