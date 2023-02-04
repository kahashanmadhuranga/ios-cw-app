//
//  FoodItemTableViewCell.swift
//  ios-cw-app
//
//  Created by Hashan on 2/4/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {
    
    static let identifier = "FoodItemTableViewCell"
    
    private let foodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let foodTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let foodDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(foodImage)
        contentView.addSubview(foodTitle)
        contentView.addSubview(foodDescription)
        contentView.backgroundColor = .black
        
        applyConstraints();
    }
    
    private func applyConstraints(){
        let foodImageConstraints = [
            foodImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            foodImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            foodImage.widthAnchor.constraint(equalToConstant: 130),
            foodImage.heightAnchor.constraint(equalToConstant: 130)
        ]
        
        let foodTitleConstraints = [
            foodTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            foodTitle.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 10),
            foodTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        let foodDescriptionConstraints = [
            foodDescription.topAnchor.constraint(equalTo: foodTitle.bottomAnchor, constant: 10),
            foodDescription.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 10),
            foodDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(foodImageConstraints)
        NSLayoutConstraint.activate(foodTitleConstraints)
        NSLayoutConstraint.activate(foodDescriptionConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: Food){
        guard let url = URL(string: Constants.imageBaseUrl + model.imageUrl) else {return}
        foodImage.sd_setImage(with: url, completed: nil)
        foodTitle.text = model.title.truncate(length: 50)
        foodDescription.text = model.description.truncate(length: 150)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
