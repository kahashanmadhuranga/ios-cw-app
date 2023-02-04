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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemRed
        imageView.frame.size.width = 50
        imageView.frame.size.height = 50
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
        guard let url = URL(string: model) else {return}
        imageView.sd_setImage(with: url, completed: nil)
        print(model)
    }
}
