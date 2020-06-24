//
//  BirthPickerVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/22.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

protocol BirthPickerVCDelegate: AnyObject {
    
    func passSelectedBirthday(birthPickerVC: BirthPickerVC)
    
}

class BirthPickerVC: UIViewController {
    
    @IBOutlet weak var birthdayPickerView: UIPickerView! {
        
        didSet {
            
            birthdayPickerView.delegate = self
            
            birthdayPickerView.dataSource = self
            
        }
        
    }
    
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
    
    weak var delegate: BirthPickerVCDelegate?
    
    var selectedBirth: BirthdayModel = BirthdayModel(year: "1911", month: "1", day: "1", hour: "00:00-01:00 早子")
    
    let solarManager = SolarDateManager()
    
    @IBAction func didTouchSolarBtn(_ sender: Any) {
        
        solarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
        lunarBtn.setTitleColor(.lightGray, for: .normal)
        
        birthdayPickerView.reloadAllComponents()
        
    }
    
    @IBAction func didTouchLunarBtn(_ sender: Any) {
        
        solarBtn.setTitleColor(.lightGray, for: .normal)
        
        lunarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
        birthdayPickerView.reloadAllComponents()
        
    }
    
    @IBAction func didTouchOkBtn(_ sender: Any) {
        
        delegate?.passSelectedBirthday(birthPickerVC: self)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        delegate?.passSelectedBirthday(birthPickerVC: self)
        
        print(selectedBirth)
        
    }
    
}

extension BirthPickerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 4
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
            
        case 0:
            
            let years = solarManager.solarYears()
            
            return years.count
            
        case 1:
            
            let months = solarManager.solarMonths()
            
            return months.count
            
        case 2:
            
            let targetYear = pickerView.selectedRow(inComponent: 0) + solarManager.startYear
            
            let targetMonth = pickerView.selectedRow(inComponent: 1) + 1
            
            let days = solarManager.solarDays(targetYear: targetYear, targetMonth: targetMonth)
            
            return days
            
        default:
            
            let hours = solarManager.solarHours()
            
            return hours.count
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
            
        case 0:
            
            let years = solarManager.solarYears()
            
            selectedBirth.year = "\(years[row])"
                        
            pickerView.reloadComponent(2)
            
        case 1:
            
            let month = solarManager.solarMonths()
            
            selectedBirth.month = "\(month[row])"
            
            pickerView.reloadComponent(2)
            
        case 2:
            
            let targetYear = pickerView.selectedRow(inComponent: 0) + solarManager.startYear
            
            let targetMonth = pickerView.selectedRow(inComponent: 1) + 1
            
            let numberOfDays = solarManager.solarDays(targetYear: targetYear, targetMonth: targetMonth)
            
            var days: [String] = []
            
            for index in 1...numberOfDays {
                
                days.append("\(index)")
                
            }
            
            selectedBirth.day = days[row]
            
        default:
            
            let hour = solarManager.solarHours()
            
            selectedBirth.hour = "\(hour[row])"
            
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 120
        case 1:
            return 50
        case 2:
            return 50
        default:
            return 180
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                        
        title.textAlignment = .center
        
        switch component {
            
        case 0:
            
            let years = solarManager.solarYears()
            
            title.text = "\(years[row])年"
            
        case 1:
            
            let months = solarManager.solarMonths()
            
            title.text = "\(months[row])月"
            
        case 2:
            
            let targetYear = pickerView.selectedRow(inComponent: 0) + solarManager.startYear
            
            let targetMonth = pickerView.selectedRow(inComponent: 1) + 1
            
            let numberOfDays = solarManager.solarDays(targetYear: targetYear, targetMonth: targetMonth)
            
            var days: [String] = []
            
            for index in 1...numberOfDays {
                
                days.append("\(index)")
                
            }
            
            title.text = "\(days[row])號"
            
        default:
            
            let hours = solarManager.solarHours()
                        
            title.text = hours[row]
            
        }

        return title

    }

}
