//
//  DatePickerVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/22.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView! {
        
        didSet {
            
            pickerView.delegate = self
            
            pickerView.dataSource = self
            
        }
        
    }
    
    var birthString: String = ""
    
    func bigTenYears() {
        
        
    }
    
    func specificYear() {
        
    }
    
    func specificMonth() {
        
    }
    
    func specificDay() {
        
    }
    
    func specificHour() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension DatePickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 10
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "年"
    }
    
}
