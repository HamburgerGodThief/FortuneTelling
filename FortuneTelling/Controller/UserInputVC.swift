//
//  UserInputVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class UserInputVC: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    
    @IBOutlet weak var birthTextField: UITextField!
    
    @IBOutlet weak var birthSegControl: UISegmentedControl! {
        
        didSet {
            
            birthSegControl.addTarget(self, action: #selector(birthValueChanged), for: .valueChanged)
            
        }
        
    }
    
    @IBOutlet weak var datePicker: UIPickerView! {
        
        didSet {
            
            datePicker.delegate = self
            
            datePicker.dataSource = self
            
        }
    }
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    func layoutSetting() {
        
        lastNameTextField.textAlignment = .center
        
        lastNameTextField.placeholder = "請輸入姓氏"
        
        firstNameTextField.textAlignment = .center
        
        firstNameTextField.placeholder = "請輸入名字"
        
        birthTextField.textAlignment = .center
        
        birthTextField.placeholder = "請在下方選擇生辰"
        
        birthTextField.isUserInteractionEnabled = false
        
        calculateBtn.layer.borderColor = UIColor.black.cgColor
        
        calculateBtn.layer.borderWidth = 1
        
        calculateBtn.layer.cornerRadius = calculateBtn.frame.size.height / 2
        
        calculateBtn.tintColor = .black
        
    }
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = .systemTeal
        
        title = "資料輸入"
        
    }
    
    func solarToLunar(year: Int, month: Int, day: Int) -> String {

        //初始化公曆日曆

        let solarCalendar = Calendar.init(identifier: .gregorian)

        var components = DateComponents()

        components.year = year

        components.month = month

        components.day = day

        components.hour = 12

        components.minute = 0

        components.second = 0

        components.timeZone = TimeZone.init(secondsFromGMT: 60 * 60 * 8)

        let solarDate = solarCalendar.date(from: components)

         

        //初始化農曆日曆

        let lunarCalendar = Calendar.init(identifier: .chinese)

        //日期格式和輸出

        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "zh_CN")

        formatter.dateStyle = .medium

        formatter.calendar = lunarCalendar

        return formatter.string(from: solarDate!)

    }
    
    @IBAction func didTouchCalculateBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
        guard let fortuneResultVC = storyboard.instantiateViewController(withIdentifier: "FortuneResultVC") as? FortuneResultVC else { return }
        
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.pushViewController(fortuneResultVC, animated: true)
        
    }
    
    @objc func birthValueChanged() {
                
        datePicker.reloadAllComponents()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        layoutSetting()
        
        navConfigure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
    }
    
}

extension UserInputVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 4
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 10
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "2000年"
    }
    
}
