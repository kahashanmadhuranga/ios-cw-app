//
//  SearchResultViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 2/4/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {

    public var foods: [Food] = [Food]()
    
    public let foodListTable: UITableView = {
        let table = UITableView()
        table.register(FoodItemTableViewCell.self, forCellReuseIdentifier: FoodItemTableViewCell.identifier)
        table.backgroundColor = .black
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(foodListTable)
        foodListTable.delegate = self
        foodListTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        foodListTable.frame = view.bounds
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc1 = FoodDetailViewController()
        vc1.configure(with: foods[indexPath.row])
        navigationController?.pushViewController(vc1, animated: true)
    }
}

