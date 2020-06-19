//
//  UIImage+Extension.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

// swiftlint:disable identifier_name

enum ImageAsset: String {
    
    // Tab icon
    case Icons_36px_UserInput_Normal
    case Icons_36px_UserInput_Selected
    
    case Icons_36px_FortuneResult_Normal
    case Icons_36px_FortuneResult_Selected
    
    case Icons_36px_Record_Normal
    case Icons_36px_Record_Selected
    
}

// swiftlint:enable identifier_name

extension UIImage {

    static func asset(_ asset: ImageAsset) -> UIImage? {

        return UIImage(named: asset.rawValue)
        
    }
}
