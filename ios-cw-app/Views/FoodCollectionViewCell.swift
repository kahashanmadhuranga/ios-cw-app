//
//  FoodCollectionViewCell.swift
//  ios-cw-app
//
//  Created by Hashan on 2/3/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit
import SDWebImage

class FoodCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FoodCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center;
        return label
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private func addGradiant() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.locations = [0.3, 0.9]
        gradientLayer.frame = bounds
        return gradientLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.addSubview(imageView)
        view.layer.addSublayer(addGradiant())
        view.addSubview(title)
        
        addSubview(view)
        applyConstraints()
    }
    
    private func applyConstraints(){
        let titleConstraint = [
            title.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            title.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(titleConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        view.frame = contentView.bounds
    }
    
    public func configure(with model: Food){
        guard let url = URL(string: Constants.imageBaseUrl + model.imageUrl) else {return}
        imageView.sd_setImage(with: url, completed: nil)
        title.text = model.title.truncate(length: 15)
    }
}
