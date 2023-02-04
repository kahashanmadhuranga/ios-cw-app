//
//  Food.swift
//  ios-cw-app
//
//  Created by Hashan on 2/3/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import Foundation

struct Food: Codable {
    let _id: String
    let title: String
    let imageUrl: String
    let mainImageUrl: String
    let description: String
    let ingredients: String?
    let nutritions: String?
    let calories: String?
}
