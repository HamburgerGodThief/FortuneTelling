//
//  DatePickerVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/22.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

protocol DatePickerVCDelegate: AnyObject {
    
    func bigTenYearsData(viewController: DatePickerVC)
    
}

class DatePickerVC: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView! {
        
        didSet {
            
            pickerView.delegate = self
            
            pickerView.dataSource = self
            
        }
        
    }
    
    weak var delegate: DatePickerVCDelegate?
    
    var pickerViewData: [String] = []
    
    var birthString: String = ""
    
    var gender: String = "男"
    
    var birthYearHeaven: String = "甲"
    
    var index: Int = 0
    
    func bigTenYears() {
        
        let bigTenYearsData = BigTenYears.shared.getBigTenYearsDate(birthDateString: birthString, gender: gender, birthYearHeaven: birthYearHeaven)
        
        pickerViewData = []
        
        for index in 1..<bigTenYearsData.count {
            
            let timeString = BigTenYears.shared.dateToString(date: bigTenYearsData[index].time)
            
            let yearString = timeString.substring(toIndex: 4)
            
            guard let yearInt = Int(yearString) else { return }
            
            let string: String = "\(bigTenYearsData[index].age)歲 \(yearInt)-\(yearInt + 9)"
            
            pickerViewData.append(string)
            
        }
        
        pickerView.reloadAllComponents()
        
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
        
        switch index {
        case 0:
            bigTenYears()
        case 1:
            specificYear()
        case 2:
            specificMonth()
        case 3:
            specificDay()
        default:
            specificHour()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
    }
    
}

extension DatePickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerViewData.count
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
}
