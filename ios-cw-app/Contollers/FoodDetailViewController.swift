//
//  FoodDetailViewController.swift
//  ios-cw-app
//
//  Created by Hashan on 1/27/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    weak var delegate: collectionViewTableViewCellDelegate?
    
    private let foodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sliderImg1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wishlistButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .medium)
        button.setImage(UIImage(systemName: "heart", withConfiguration: largeConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.red
        return button
    }()
    
    private let foodTitle: UILabel = {
        let label = UILabel()
        label.text = "Food Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let foodDescription: UILabel = {
        let label = UILabel()
        label.text = "Food for us comes from our relatives, whether they have wings or fins or roots. That is how we consider food. Food has a culture. It has a history. It has a story. It has relationships."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private let nutritionTitle: UILabel = {
        let label = UILabel()
        label.text = "Nutritions"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let nutritionDetails: UILabel = {
        let label = UILabel()
        label.text = "Nutritions details here"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private let caloriesTitle: UILabel = {
        let label = UILabel()
        label.text = "Calories"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let caloriesDetails: UILabel = {
        let label = UILabel()
        label.text = "Calories details here"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private let ingradientsTitle: UILabel = {
        let label = UILabel()
        label.text = "Ingradients"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let ingradientsDetails: UILabel = {
        let label = UILabel()
        label.text = "Ingradients details here"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(foodImage)
        view.addSubview(wishlistButton)
        view.addSubview(foodTitle)
        view.addSubview(foodDescription)
        view.addSubview(nutritionTitle)
        view.addSubview(nutritionDetails)
        view.addSubview(caloriesTitle)
        view.addSubview(caloriesDetails)
        view.addSubview(ingradientsTitle)
        view.addSubview(ingradientsDetails)
        applyConstraints()
    }
    
    private func applyConstraints(){
        let foodImageConstraint = [
            foodImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            foodImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/5*2),
            foodImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        let wishlistButtonConstraint = [
//            wishlistButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            wishlistButton.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 20),
            wishlistButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//            wishlistButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        let foodTitleConstraint = [
            foodTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            foodTitle.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 20),
//            foodTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            foodTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let foodDescriptionConstraint = [
            foodDescription.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            foodDescription.topAnchor.constraint(equalTo: foodTitle.bottomAnchor, constant: 20),
            foodDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let nutritionTitleConstraint = [
            nutritionTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nutritionTitle.topAnchor.constraint(equalTo: foodDescription.bottomAnchor, constant: 20),
            nutritionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let nutritionDetailsConstraint = [
            nutritionDetails.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nutritionDetails.topAnchor.constraint(equalTo: nutritionTitle.bottomAnchor, constant: 5),
            nutritionDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let caloriesTitleConstraint = [
            caloriesTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            caloriesTitle.topAnchor.constraint(equalTo: nutritionDetails.bottomAnchor, constant: 20),
            caloriesTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let caloriesDetailsConstraint = [
            caloriesDetails.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            caloriesDetails.topAnchor.constraint(equalTo: caloriesTitle.bottomAnchor, constant: 5),
            caloriesDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let ingradientsTitleConstraint = [
            ingradientsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ingradientsTitle.topAnchor.constraint(equalTo: caloriesDetails.bottomAnchor, constant: 20),
            ingradientsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let ingradientsDetailsConstraint = [
            ingradientsDetails.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ingradientsDetails.topAnchor.constraint(equalTo: ingradientsTitle.bottomAnchor, constant: 5),
            ingradientsDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(foodImageConstraint)
        NSLayoutConstraint.activate(wishlistButtonConstraint)
        NSLayoutConstraint.activate(foodTitleConstraint)
        NSLayoutConstraint.activate(foodDescriptionConstraint)
        NSLayoutConstraint.activate(nutritionTitleConstraint)
        NSLayoutConstraint.activate(nutritionDetailsConstraint)
        NSLayoutConstraint.activate(caloriesTitleConstraint)
        NSLayoutConstraint.activate(caloriesDetailsConstraint)
        NSLayoutConstraint.activate(ingradientsTitleConstraint)
        NSLayoutConstraint.activate(ingradientsDetailsConstraint)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public func configure(with model: Food){
        guard let url = URL(string: Constants.imageBaseUrl + model.mainImageUrl) else {return}
        foodImage.sd_setImage(with: url, completed: nil)
        foodTitle.text = model.title
        foodDescription.text = model.description
        nutritionDetails.text = model.nutritions
        caloriesDetails.text = model.calories
        ingradientsDetails.text = model.ingredients
    }
    
}
