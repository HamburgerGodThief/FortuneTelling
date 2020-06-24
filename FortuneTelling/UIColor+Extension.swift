//
//  UIColor+Extension.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/24.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

// swiftlint:disable identifier_name

enum ColorAsset: String {
    
    case MainColor
    
}

// swiftlint:enable identifier_name

extension UIColor {

    static func assetColor(_ color: ColorAsset) -> UIColor? {

        return UIColor(named: color.rawValue)
        
    }
}
