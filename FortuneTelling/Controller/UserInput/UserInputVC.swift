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
    
    @IBOutlet weak var birthBtn: UIButton!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    var userBirthString: String = ""
    
    func layoutSetting() {
        
        lastNameTextField.textAlignment = .center
        
        lastNameTextField.placeholder = "請輸入姓氏"
        
        firstNameTextField.textAlignment = .center
        
        firstNameTextField.placeholder = "請輸入名字"
        
        birthBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        birthBtn.layer.borderWidth = 1
        
        birthBtn.layer.cornerRadius = 5
        
        calculateBtn.layer.borderColor = UIColor.black.cgColor
        
        calculateBtn.layer.borderWidth = 1
        
        calculateBtn.layer.cornerRadius = calculateBtn.frame.size.height / 2
        
        calculateBtn.tintColor = .black
        
    }
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.barStyle = .black
        
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
        
        fortuneResultVC.birthdayString = userBirthString
        
        navigationController?.pushViewController(fortuneResultVC, animated: true)
        
    }
    
    @IBAction func didTouchBirthBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "UserInput", bundle: nil)
        
        guard let birthPickerVC = storyboard.instantiateViewController(withIdentifier: "BirthPickerVC") as? BirthPickerVC else { return }
        
        birthPickerVC.delegate = self
        
        present(birthPickerVC, animated: true, completion: nil)
        
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

extension UserInputVC: BirthPickerVCDelegate {
    
    func passSelectedBirthday(birthPickerVC: BirthPickerVC) {
        
        let birthday = "\(birthPickerVC.selectedBirth.year) \(birthPickerVC.selectedBirth.month) \(birthPickerVC.selectedBirth.day) \(birthPickerVC.selectedBirth.hour)"
        
        userBirthString = birthPickerVC.selectedBirthString
        
        birthBtn.setTitle(birthday, for: .normal)
        
    }

}
