//
//  FortuneResultTableViewCell.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/21.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class FortuneResultTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var lunarYearLbl: UILabel!
    
    @IBOutlet weak var lunarMonthLbl: UILabel!
    
    @IBOutlet weak var lunarDayLbl: UILabel!
    
    @IBOutlet weak var yearLbl: UILabel!
    
    @IBOutlet weak var monthLbl: UILabel!
    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
