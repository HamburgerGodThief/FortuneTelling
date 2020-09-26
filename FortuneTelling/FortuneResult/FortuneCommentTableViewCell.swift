//
//  FortuneCommentTableViewCell.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/22.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class FortuneCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var areaLbl: UILabel!
    
    @IBOutlet weak var heavenCommentLbl: UILabel!
    
    @IBOutlet weak var heavenTenGodComment: UILabel!
    
    @IBOutlet weak var earthlyCommentLbl: UILabel!
    
    @IBOutlet weak var earthlyTenGodComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
