//
//  WishlistViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 1/27/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    private var foods: [Food] = [Food]()

        private let foodListTable: UITableView = {
            let table = UITableView()
            table.register(WishlistItemTableViewCell.self, forCellReuseIdentifier: WishlistItemTableViewCell.identifier)
            table.backgroundColor = .black
            table.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(foodListTable)
            foodListTable.delegate = self
            foodListTable.dataSource = self
            
            navbarConfig()
            fetchData()
        }
        
        private func navbarConfig(){
            title = "Wishlist"
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.barTintColor = .clear
            let textAttributes = [
                NSAttributedString.Key.foregroundColor:UIColor.white,
                NSAttributedString.Key.font:UIFont(name: "Acme-Regular", size: 20)
            ]
            navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            foodListTable.frame = view.bounds
        }
        
        private func fetchData() {
            APICaller.shared.getAllFoods{ [weak self] result in
                switch result {
                case .success(let foods):
                    self?.foods = foods
                    DispatchQueue.main.async {
                        self?.foodListTable.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = foodListTable.dequeueReusableCell(withIdentifier: WishlistItemTableViewCell.identifier, for: indexPath) as? WishlistItemTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = FoodDetailViewController()
//        vc.configure(with: foods[indexPath.row])
//        navigationController?.pushViewController(vc, animated: true)
//        print("clicked")
//    }
}
