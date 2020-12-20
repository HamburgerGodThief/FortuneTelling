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
    
    var selectedBirth: BirthdayModel = BirthdayModel(year: "2020年", month: "1月", day: "1日")
    
    var selectedYear: String = "1925"
    
    var selectedMonth: String = "01"
    
    var selectedDay: String = "01"
        
    var selectedBirthString: String = ""
    
    let solarManager = SolarDateManager()
    
    let lunarManager = LunarDateManager()
    
    var isSolar: Bool = true
    
    var yearComponent: [String] = []
    
    var monthComponent: [String] = []
    
    var dayComponent: [String] = []
        
    func solarDate() {
        
        yearComponent = []
        
        monthComponent = []
        
        dayComponent = []
                
        for element in solarManager.solarYears() {
            
            yearComponent.append("\(element)年")
            
        }
        
        for element in solarManager.solarMonths() {
            
            monthComponent.append("\(element)月")
            
        }
        
        let targetYear = birthdayPickerView.selectedRow(inComponent: 0) + solarManager.startYear
        
        let targetMonth = birthdayPickerView.selectedRow(inComponent: 1) + 1
        
        let days = solarManager.solarDays(targetYear: targetYear, targetMonth: targetMonth)
        
        for day in 1...days {
            
            dayComponent.append("\(day)日")
            
        }
            
    }
    
    func lunarYears() {
        
        yearComponent = []
        
        for element in solarManager.solarYears() {
            
            yearComponent.append("\(element)年")
            
        }
        
    }
    
    func lunarMonths() {
        
        monthComponent = []
        
        let selectedYear = birthdayPickerView.selectedRow(inComponent: 0) + solarManager.startYear
        
        monthComponent = lunarManager.lunarMonthsText(gregorianYear: selectedYear)
        
    }
    
    func lunarDays() {
        
        dayComponent = []
        
        let selectedYear = birthdayPickerView.selectedRow(inComponent: 0) + solarManager.startYear
        
        let selectedMonths = birthdayPickerView.selectedRow(inComponent: 1)
        
        let lunarMonths = lunarManager.lunarMonths(gregorianYear: selectedYear)
        
        if monthComponent[selectedMonths].count > 2 {
            
            dayComponent = lunarManager.isMaxMonth(month: lunarMonths[selectedMonths], isLeapMonth: true, gregorianYear: selectedYear)
            
        } else {
            
            dayComponent = lunarManager.isMaxMonth(month: lunarMonths[selectedMonths], isLeapMonth: false, gregorianYear: selectedYear)
            
        }
        
    }
    
    func lunarDate() {
        
        lunarYears()
        
        lunarMonths()
        
        lunarDays()
        
    }
    
    func lunarToSolar() -> String {
        
        let selectedYear = birthdayPickerView.selectedRow(inComponent: 0) + solarManager.startYear
        
        let selectedMonthIndex = birthdayPickerView.selectedRow(inComponent: 1)
        
        let lunarMonths = lunarManager.lunarMonths(gregorianYear: selectedYear)
        
        let selectedLunarMonth = lunarMonths[selectedMonthIndex]
        
        let selectedDay = birthdayPickerView.selectedRow(inComponent: 2) + 1
        
        if monthComponent[selectedMonthIndex].count == 3 {
            
            let solarDate = lunarManager.lunarToSolar(gregorianYear: selectedYear, lunarMonth: selectedMonthIndex, isLeapMonth: true, lunarDay: selectedDay)
            
            return "\(solarDate)"
            
        } else {
            
            let solarDate = lunarManager.lunarToSolar(gregorianYear: selectedYear, lunarMonth: selectedLunarMonth, isLeapMonth: false, lunarDay: selectedDay)
            
            return "\(solarDate)"
            
        }
        
    }
    
    func passBirthToPreVC() {
        
        if !isSolar {
            
            selectedBirthString = lunarToSolar()
            
        } else {
            
            selectedBirthString = "\(selectedYear)-\(selectedMonth)-\(selectedDay)"
            
        }
        
        delegate?.passSelectedBirthday(birthPickerVC: self)
        
    }
    
    func defaultYearValue() {
        
        let currentYear = Calendar.current.component(.year, from: Date())
        
        let index = currentYear - 1925
        
        selectedYear = "\(currentYear)"
        
        selectedBirth = BirthdayModel(year: "\(selectedYear)年", month: "1月", day: "1日")
        
        birthdayPickerView.selectRow(index, inComponent: 0, animated: false)
        
    }
    
    @IBAction func didTouchSolarBtn(_ sender: Any) {
        
        isSolar = true
        
        solarDate()
        
        birthdayPickerView.reloadAllComponents()
        
        solarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
        lunarBtn.setTitleColor(.lightGray, for: .normal)
        
        let selectedYear = birthdayPickerView.selectedRow(inComponent: 0)
        
        let selectedMonth = birthdayPickerView.selectedRow(inComponent: 1)
        
        let selectedDay = birthdayPickerView.selectedRow(inComponent: 2)
                
        selectedBirth = BirthdayModel(year: yearComponent[selectedYear], month: monthComponent[selectedMonth], day: dayComponent[selectedDay])
        
    }
    
    @IBAction func didTouchLunarBtn(_ sender: Any) {
        
        isSolar = false
        
        lunarDate()
        
        birthdayPickerView.reloadAllComponents()
        
        solarBtn.setTitleColor(.lightGray, for: .normal)
        
        lunarBtn.setTitleColor(UIColor.assetColor(.MainColor), for: .normal)
        
        let selectedYear = birthdayPickerView.selectedRow(inComponent: 0)
        
        let selectedMonth = birthdayPickerView.selectedRow(inComponent: 1)
        
        let selectedDay = birthdayPickerView.selectedRow(inComponent: 2)
                
        selectedBirth = BirthdayModel(year: yearComponent[selectedYear], month: monthComponent[selectedMonth], day: dayComponent[selectedDay])
        
    }
    
    @IBAction func didTouchOkBtn(_ sender: Any) {
        
        passBirthToPreVC()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        solarDate()
        
        defaultYearValue()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        passBirthToPreVC()
        
        print(selectedBirthString)
                        
    }
    
}

extension BirthPickerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
            
        case 0:
                        
            return yearComponent.count
            
        case 1:
                        
            return monthComponent.count
            
        default:
            
            return dayComponent.count
              
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
            
        case 0:
            
            selectedYear = String(yearComponent[row].prefix(4))
                        
            selectedBirth.year = yearComponent[row]
                                    
            if isSolar {
                
                solarDate()
                
            } else {
                
                lunarDate()
                
                pickerView.reloadComponent(1)
                
            }
                        
            pickerView.reloadComponent(2)
            
        case 1:
                        
            selectedBirth.month = monthComponent[row]
            
            if isSolar {
                
                solarDate()
                
                selectedMonth = monthComponent[row].substring(toIndex: monthComponent[row].length - 1)
                
            } else {
                
                lunarDate()
                
            }
            
            pickerView.reloadComponent(2)
            
        default:
            
            selectedBirth.day = dayComponent[row]
            
            if isSolar {
                                
                selectedDay = dayComponent[row].substring(toIndex: dayComponent[row].length - 1)
                
            }
            
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        switch component {
            
        case 0:
            
            return 120
            
        default:
            
            return 80
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                        
        title.textAlignment = .center
        
        switch component {
            
        case 0:
            
            title.text = yearComponent[row]
            
        case 1:
                        
            title.text = monthComponent[row]
            
        default:
            
            title.text = dayComponent[row]
            
        }

        return title

    }

}
