//
//  HomeSliderUIView.swift
//  ios-cw-app
//
//  Created by Hashan on 1/28/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class HomeMainImageUIView: UIView {
    
    private let homeMainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "homeMainImage")
        return imageView
    }()
    
    private let homeMainImageLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "Label"
        return labelView
    }()
    
    private func addGradiant(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeMainImageView)
        addSubview(homeMainImageLabel)
        addGradiant()
        applyConstraints()
    }

    private func applyConstraints(){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        homeMainImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
