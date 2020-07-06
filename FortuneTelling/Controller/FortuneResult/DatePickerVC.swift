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
    
    func specificYearData(viewController: DatePickerVC)
    
    func specificMonthData(viewController: DatePickerVC)
    
    func specificDayData(viewController: DatePickerVC)
    
    func specificHourData(viewController: DatePickerVC)
    
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
    
    var index: Int = 4
    
    var bigTenYearsData: [BigTenYearsForView] = []
    
    var startBigTenAge: Int = 0
    
    var selectedSpecificYear: Int = 1924
    
    var selectedSpecificMonth: Int = 1
    
    func bigTenYears() {
        
        bigTenYearsData = BigTenYears.shared.getBigTenYearsDate(birthDateString: birthString, gender: gender, birthYearHeaven: birthYearHeaven)
        
        pickerViewData = []
        
        for index in 1..<bigTenYearsData.count {
            
            let timeString = BigTenYears.shared.dateToString(date: bigTenYearsData[index].time)
            
            let yearString = timeString.substring(toIndex: 4)
            
            guard let yearInt = Int(yearString) else { return }
            
            let string: String = "\(bigTenYearsData[index].age)歲    \(yearInt)-\(yearInt + 9)"
            
            pickerViewData.append(string)
            
        }
        
        pickerView.reloadAllComponents()
        
    }
    
    func specificYear() {
        
        pickerViewData = []
        
        let birthDate = DateManager.shared.stringToDate(dateStr: birthString)
        
        for index in 0...9 {
            
            let specificYearString = SpecificYear.shared.getSpecificYears(birthDate: birthDate, selectedStartAge: startBigTenAge + index)
            
            pickerViewData.append(specificYearString)
            
        }
        
        pickerView.reloadAllComponents()
        
    }
    
    func specificMonth() {
        
        pickerViewData = []
        
        let specificMonthForPickerView = SpecificMonth.shared.getSpecificMonth()
        
        pickerViewData = specificMonthForPickerView
        
        pickerView.reloadAllComponents()
        
    }
    
    func specificDay() {
        
        let startSpecificDay = SpecificDay.shared.getSpecificDayString(specificYear: selectedSpecificYear, specificMonth: selectedSpecificMonth)
        
        var nextYear = selectedSpecificYear
        
        var nextMonth = selectedSpecificMonth + 1
        
        if nextMonth == 13 {
            
            nextYear += 1
            
            nextMonth = 1
            
        }

        let nextSpecificDay = SpecificDay.shared.getSpecificDayString(specificYear: nextYear, specificMonth: nextMonth)

        let allOption = SpecificDay.shared.getAllOptionsSpecificDay(startSpecificDay: startSpecificDay, endSpecificDay: nextSpecificDay)

        pickerViewData = []

        pickerViewData = allOption

        pickerView.reloadAllComponents()
        
    }
    
    func specificHour() {
        
        pickerViewData = []
        
        let specificHourForPickerView = SpecificHour.shared.getSpecificHour()
        
        pickerViewData = specificHourForPickerView

        pickerView.reloadAllComponents()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        switch index {
            
        case 4:
            
            bigTenYears()
        
        case 5:
        
            specificYear()
        
        case 6:
            
            specificMonth()
        
        case 7:
        
            specificDay()
        
        default:
        
            specificHour()
        
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        switch index {
            
        case 4:
            
            delegate?.bigTenYearsData(viewController: self)
            
        case 5:
            
            delegate?.specificYearData(viewController: self)
            
        case 6:
            
            delegate?.specificMonthData(viewController: self)

        case 7:
            
            delegate?.specificDayData(viewController: self)

        default:
            
            delegate?.specificHourData(viewController: self)

        }
        
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
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 40
        
    }
    
}
