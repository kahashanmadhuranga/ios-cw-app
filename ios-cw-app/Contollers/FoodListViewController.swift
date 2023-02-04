//
//  FoodListViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 2/4/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController {
    
    private var foods: [Food] = [Food]()

    private let foodListTable: UITableView = {
        let table = UITableView()
        table.register(FoodItemTableViewCell.self, forCellReuseIdentifier: FoodItemTableViewCell.identifier)
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
        title = "Food Listing"
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

extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = foodListTable.dequeueReusableCell(withIdentifier: FoodItemTableViewCell.identifier, for: indexPath) as? FoodItemTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
