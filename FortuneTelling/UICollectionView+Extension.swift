//
//  UICollectionView+Extension.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/21.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

extension UICollectionView {

    func hbg_registerCellWithNib(identifier: String, bundle: Bundle?) {

        let nib = UINib(nibName: identifier, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: identifier)
    }
    
}
