//
//  Extensions.swift
//  ios-cw-app
//
//  Created by Hashan on 2/3/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import Foundation

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
