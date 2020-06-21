//
//  FortuneResultCollectionViewCell.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/21.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class FortuneResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var iconBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLbl.numberOfLines = 0
        
        iconBtn.isEnabled = false
        
    }

}
