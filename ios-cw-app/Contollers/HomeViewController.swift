//
//  HomeViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 1/27/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

enum Sections: Int {
    case TopFood = 0
    case AllFood = 1
}

class HomeViewController: UIViewController {
    
    private let sectionHeaders = ["Top Foods", "All Foods"]
    
    private let homeDescription: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .black
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HomeMainImageUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        configNavBar()
    }
    
    private func configNavBar() {
        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .done, target: self, action: nil)
        let wishlistButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [userButton, wishlistButton]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.section {
        case Sections.TopFood.rawValue:
            APICaller.shared.getTopFoods{ result in
                switch result {
                case .success(let food):
                    cell.configure(with: food)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.AllFood.rawValue:
            APICaller.shared.getAllFoods{ result in
                switch result {
                case .success(let food):
                    cell.configure(with: food)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont(name: "Acme-Regular", size: 25)
        header.textLabel?.textColor = .white
        header.textLabel?.textAlignment = .center
        header.textLabel?.text = header.textLabel?.text?.capitalizedFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
