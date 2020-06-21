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
    
    @IBAction func didTouchCalculateBtn(_ sender: Any) {
        
        print("計算中")
        
    }
    
    @objc func birthValueChanged() {
                
        datePicker.reloadAllComponents()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        layoutSetting()
        
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
        return "年"
    }
    
}
