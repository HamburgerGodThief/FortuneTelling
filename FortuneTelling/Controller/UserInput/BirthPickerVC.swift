//
//  BirthPickerVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/22.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class BirthPickerVC: UIViewController {
    
    @IBOutlet weak var birthdayPickerView: UIPickerView!
    
    @IBOutlet weak var solarBtn: UIButton! {
        
        didSet {
            
            solarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
            
        }
        
    }
    
    @IBOutlet weak var lunarBtn: UIButton! {
        
        didSet {
                
            lunarBtn.setTitleColor(.lightGray, for: .normal)
                
        }
        
    }
    
    @IBOutlet weak var okBtn: UIButton!
    
    @IBAction func didTouchSolarBtn(_ sender: Any) {
        
        solarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
        lunarBtn.setTitleColor(.lightGray, for: .normal)
        
    }
    
    @IBAction func didTouchLunarBtn(_ sender: Any) {
        
        solarBtn.setTitleColor(.lightGray, for: .normal)
        
        lunarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
    }
    
    @IBAction func didTouchOkBtn(_ sender: Any) {
        
        //傳值回去上一個VC
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
