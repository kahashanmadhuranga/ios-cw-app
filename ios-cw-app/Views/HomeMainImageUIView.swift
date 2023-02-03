//
//  HomeSliderUIView.swift
//  ios-cw-app
//
//  Created by Hashan on 1/28/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class HomeMainImageUIView: UIView {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "homeMainImage")
        return image
    }()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Health Requires Healthy Foods"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Acme-Regular", size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center;
        return label
    }()
    
    private func addGradiant(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImage)
        addGradiant()
        addSubview(logo)
        addSubview(title)
        applyConstraints()
    }

    private func applyConstraints(){
        let logoConstraints = [
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.heightAnchor.constraint(equalToConstant: 150),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -20)
        ]
        
        let homeMainLabelConstraints = [
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ]
        
        NSLayoutConstraint.activate(homeMainLabelConstraints)
        NSLayoutConstraint.activate(logoConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
