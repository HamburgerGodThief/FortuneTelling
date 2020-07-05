//
//  BirthTimePickerVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/5.
//  Copyright © 2020 Hamburger. All rights reserved.
//


import UIKit

protocol BirthTimePickerVCDelegate: AnyObject {
    
    func passSelectedTime(birthTimePickerVC: BirthTimePickerVC)
    
}

class BirthTimePickerVC: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView! {
        
        didSet {
            
            pickerView.delegate = self
            
            pickerView.dataSource = self
            
        }
        
    }
    
    @IBOutlet weak var okBtn: UIButton!
    
    weak var delegate: BirthTimePickerVCDelegate?
    
    let hour: [String] = ["00", "01", "02", "03", "04", "05", "06", "07",
                          "08", "09", "10", "11", "12", "13", "14", "15",
                          "16", "17", "18", "19", "20", "21", "22", "23"]
    
    let minute: [String] = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
                            "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
                            "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
                            "30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
                            "40", "41", "42", "43", "44", "45", "46", "47", "48", "49",
                            "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    
    @IBAction func didTouchOKBtn(_ sender: Any) {
        
        delegate?.passSelectedTime(birthTimePickerVC: self)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        delegate?.passSelectedTime(birthTimePickerVC: self)
        
    }

}

extension BirthTimePickerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return hour.count
            
        } else {
            
            return minute.count
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 50
        
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return 80
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                        
        title.textAlignment = .center
        
        if component == 0 {
            
            title.text = "\(hour[row])時"
            
        } else {
            
            title.text = "\(minute[row])分"
            
        }

        return title

    }

}
