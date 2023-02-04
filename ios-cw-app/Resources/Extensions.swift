//
//  Extensions.swift
//  ios-cw-app
//
//  Created by Hashan on 2/3/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func capitalizedFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    func truncate(length: Int) -> String {
        if(self.count > length){
            return self.prefix(upTo: self.index(self.startIndex, offsetBy: length)) + "..."
        }else{
            return self
        }
    }
}

extension UIColor {
    static let customWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
}
