//
//  UserInputVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class UserInputVC: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView! {
        
        didSet {
            
            logoImg.image = UIImage.asset(.Logo_36px_UserInput)
            
        }
        
    }
    
    @IBOutlet weak var lastNameTextField: UITextField!
        
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    
    @IBOutlet weak var birthBtn: UIButton!
    
    @IBOutlet weak var birthTimeBtn: UIButton!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var testBtn: UIButton!
    
    var userBirthDate: String = ""
    
    var userBirthTime: String = ""
    
    func layoutSetting() {
        
        lastNameTextField.textAlignment = .center
        
        lastNameTextField.placeholder = "請輸入姓氏"
        
        birthBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        birthBtn.layer.borderWidth = 1
        
        birthBtn.layer.cornerRadius = 5
        
        birthTimeBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        birthTimeBtn.layer.borderWidth = 1
        
        birthTimeBtn.layer.cornerRadius = 5
        
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
    
    func showRemindAlert() {
            
        let alertController = UIAlertController(title: "錯誤",
                                                message: "您有資料尚未填寫",
                                                preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
            
    }
    
    func showInfoCheckAlert() {
        
        var gender: String = "女"
        
        guard let name = lastNameTextField.text else { return }
                
        guard let birthDate = birthBtn.titleLabel?.text else { return }
        
        guard (birthTimeBtn.titleLabel?.text) != nil else { return }
        
        if genderSegControl.selectedSegmentIndex == 0 {
            
            gender = "男"
            
        }
        
        let alertController = UIAlertController(title: "請確認資料", message: "姓名:\(name)\n性別:\(gender)\n出生時間:\(birthDate) \(userBirthTime)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)

        let defaultAction = UIAlertAction(title: "送出", style: .default, handler: {[weak self] (_) -> Void in
            
            guard let strongSelf = self else { return }
            
            let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
            
            guard let fortuneResultVC = storyboard.instantiateViewController(withIdentifier: "FortuneResultVC") as? FortuneResultVC else { return }
            
            strongSelf.tabBarController?.tabBar.isHidden = true
            
            fortuneResultVC.birthdayString = "\(strongSelf.userBirthDate) \(strongSelf.userBirthTime)"
            
            fortuneResultVC.gender = gender
            
            fortuneResultVC.navTitle = "\(name) (\(gender)) \(strongSelf.userBirthDate) \(strongSelf.userBirthTime)"
            
            StorageManager.shared.create(name: name, gender: gender, solarBirth: fortuneResultVC.birthdayString)
            
            UserManager.shared.userName = name
            
            UserManager.shared.gender = gender
            
            UserManager.shared.birthString = "\(strongSelf.userBirthDate) \(strongSelf.userBirthTime)"
            
            strongSelf.navigationController?.pushViewController(fortuneResultVC, animated: true)
            
        })
        
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func didTouchCalculateBtn(_ sender: Any) {
        
        if lastNameTextField.text == "" || birthBtn.titleLabel?.text == "出生年月日" || birthTimeBtn.titleLabel?.text == "出生時辰" {
        
            showRemindAlert()
            
            return
            
        }
        
        showInfoCheckAlert()
        
    }
    
    @IBAction func didTouchBirthBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "UserInput", bundle: nil)
        
        guard let birthPickerVC = storyboard.instantiateViewController(withIdentifier: "BirthPickerVC") as? BirthPickerVC else { return }
        
        birthPickerVC.delegate = self
        
        present(birthPickerVC, animated: true, completion: nil)
        
    }
    
    @IBAction func didTouchBirthTimeBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "UserInput", bundle: nil)
        
        guard let birthTimePickerVC = storyboard.instantiateViewController(withIdentifier: "BirthTimePickerVC") as? BirthTimePickerVC else { return }
        
        birthTimePickerVC.delegate = self
        
        present(birthTimePickerVC, animated: true, completion: nil)
        
    }
    
    @IBAction func testBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "FortuneResult", bundle: nil)
        
        guard let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        
        navigationController?.pushViewController(resultVC, animated: true)
                
//        present(resultVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        layoutSetting()
        
        navConfigure()
        
        testBtn.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
    }
    
}

extension UserInputVC: BirthPickerVCDelegate {
    
    func passSelectedBirthday(birthPickerVC: BirthPickerVC) {
        
        let birthday = "\(birthPickerVC.selectedBirth.year) \(birthPickerVC.selectedBirth.month) \(birthPickerVC.selectedBirth.day)"
        
        userBirthDate = birthPickerVC.selectedBirthString
        
        birthBtn.setTitle(birthday, for: .normal)
        
    }

}

extension UserInputVC: BirthTimePickerVCDelegate {
    
    func passSelectedTime(birthTimePickerVC: BirthTimePickerVC) {
        
        let selectedHour = birthTimePickerVC.hour[birthTimePickerVC.pickerView.selectedRow(inComponent: 0)]
        
        let selectedMin = birthTimePickerVC.minute[birthTimePickerVC.pickerView.selectedRow(inComponent: 1)]
        
        userBirthTime = "\(selectedHour):\(selectedMin)"
        
        birthTimeBtn.setTitle(userBirthTime, for: .normal)
        
    }

}
