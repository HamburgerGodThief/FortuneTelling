//
//  TitleViewController.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/9/27.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

protocol titleViewControllerDelegate: AnyObject {
    
    func bigTenYearsData(viewController: TitleViewController)
    
}

class TitleViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.delegate = self
            
            collectionView.dataSource = self
            
            collectionView.hbg_registerCellWithNib(identifier: String(describing: ResultTitleCollectionViewCell.self), bundle: nil)
                        
        }
        
    }

    let itemTitle: [String] = ["生\n時", "生\n日", "生\n月", "生\n年", "大\n運",
                               "流\n年", "流\n月", "流\n日", "流\n時"]
    
    var heaven: [String] = []
    
    var earthly: [String] = []
    
    var tenGodData: [String] = []
    
    var startBigTenAge: Int = 0
    
    let selectedSpecificYear: Int = 1924
    
    let selectedSpecificMonth: Int = 1
    
    func remindAlert(message: String) {
            
        let alertController = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
            
    }
    
    func showAlertMessage(indexPathItem: Int) {
        
        if tenGodData[8] == "" && tenGodData[10] == "" && tenGodData[12] == "" && tenGodData[14] == ""{
            
            remindAlert(message: "請先輸入大運/流年/流月/流日")
            
            return
            
        } else if tenGodData[8] == "" && tenGodData[10] == "" && tenGodData[12] == "" {
            
            remindAlert(message: "請先輸入大運/流年/流月")
            
            return
            
        } else if tenGodData[8] == "" && tenGodData[10] == "" {
            
            remindAlert(message: "請先輸入大運/流年")
            
            return
            
        } else if tenGodData[8] == "" {
            
            remindAlert(message: "請先輸入大運")
            
            return
            
        }
        
    }
    
    func bigTenYearsForTableView(bigTen: BigTenYearsForView, index: Int) {
        
        let bigTenString = DateManager.shared.dateToString(date: bigTen.time)
        
        let solarYear = bigTenString.substring(toIndex: 4)
        
        let solarMonth = bigTenString.substring(fromIndex: 5, toIndex: 7)
        
        let solarDay = bigTenString.substring(fromIndex: 8, toIndex: 10)
        
        let solarTime = bigTenString.substring(fromIndex: 11)
        
        let lunarYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: bigTen.time)
        
        let lunarYear = "\(lunarYearHeavenEarthly.heaven)\(lunarYearHeavenEarthly.earthly)"
        
        let lunarMonthHeaveEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: bigTen.time)
        
        let lunarMonth = "\(lunarMonthHeaveEarthly.heaven)\(lunarMonthHeaveEarthly.earthly)"
        
        let lunarDayHeaven = SpecificDay.shared.getSpecificDayHeaven(selectedDateYYYYMMdd: bigTenString)
        
        let lunarDayEarthly = SpecificDay.shared.getSpecificDayEarthly(selectedDateYYYYMMdd: bigTenString)
        
        let lunarDay = "\(lunarDayHeaven)\(lunarDayEarthly)"
        
        if index == 1 {
            
            UserManager.shared.startBigTenSolarYear = solarYear
            
            UserManager.shared.startBigTenSolarMonth = solarMonth
            
            UserManager.shared.startBigTenSolarDay = solarDay
            
            UserManager.shared.startBigTenTime = solarTime
            
            UserManager.shared.startBigTenLunarYear = lunarYear
            
            UserManager.shared.startBigTenLunarMonth = lunarMonth
            
            UserManager.shared.startBigTenLunarDay = lunarDay
            
        } else {
            
            UserManager.shared.endBigTenSolarYear = solarYear
            
            UserManager.shared.endBigTenSolarMonth = solarMonth
            
            UserManager.shared.endBigTenSolarDay = solarDay
            
            UserManager.shared.endBigTenTime = solarTime
            
            UserManager.shared.endBigTenLunarYear = lunarYear
            
            UserManager.shared.endBigTenLunarMonth = lunarMonth
            
            UserManager.shared.endBigTenLunarDay = lunarDay
            
        }
        
    }
    
    func dataForTableViewSection0(thisBigTen: BigTenYearsForView, nextBigTen: BigTenYearsForView) {
                
        bigTenYearsForTableView(bigTen: thisBigTen, index: 1)
        
        bigTenYearsForTableView(bigTen: nextBigTen, index: 2)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}

extension TitleViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemTitle.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultTitleCollectionViewCell", for: indexPath) as? ResultTitleCollectionViewCell else { return UICollectionViewCell() }
                
        item.titleLbl.text = itemTitle[indexPath.item]
        
        if indexPath.item < 4 {
            
            item.iconBtn.isHidden = true
            
        }
        
        return item
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor(view.frame.size.width - 20) / CGFloat(itemTitle.count)
        
        let height = collectionView.frame.size.height - 6
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                    
        if indexPath.item < 4 {
            
            return
            
        } else if indexPath.item > 4 {
            
            for index in 8..<indexPath.item * 2 {
                
                if tenGodData[index] == "" && index < 10 {
                    
                    remindAlert(message: "請先輸入大運")
                    
                    return
                    
                } else if tenGodData[index] == "" && index < 12 {
                    
                    remindAlert(message: "請先輸入流年")
                    
                    return
                    
                } else if tenGodData[index] == "" && index < 14 {
                    
                    remindAlert(message: "請先輸入流月")
                    
                    return
                    
                } else if tenGodData[index] == "" && index < 16 {
                    
                    remindAlert(message: "請先輸入流日")
                    
                    return
                    
                }
                
            }
            
        }
        
        let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
        
        guard let datePickerVC = storyboard.instantiateViewController(withIdentifier: "DatePickerVC") as? DatePickerVC else { return }
        
        datePickerVC.index = indexPath.row
        
        datePickerVC.birthString = UserManager.shared.birthString
        
        datePickerVC.birthYearHeaven = UserManager.shared.birthYearHeaven
        
        datePickerVC.gender = UserManager.shared.gender
        
        datePickerVC.startBigTenAge = startBigTenAge
        
        datePickerVC.selectedSpecificYear = selectedSpecificYear
        
        datePickerVC.selectedSpecificMonth = selectedSpecificMonth
        
        datePickerVC.delegate = self
        
        present(datePickerVC, animated: true, completion: nil)
        
    }
    
}

extension TitleViewController: DatePickerVCDelegate {
    
    func bigTenYearsData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let startBigTen = viewController.bigTenYearsData[selectedRow + 1]
        
        startBigTenAge = startBigTen.age
        
        if selectedRow + 2 < viewController.bigTenYearsData.count - 1 {
        
            let nextBigTen = viewController.bigTenYearsData[selectedRow + 2]
            
            dataForTableViewSection0(thisBigTen: startBigTen, nextBigTen: nextBigTen)
            
        } else {
            
            bigTenYearsForTableView(bigTen: startBigTen, index: 1)
            
            UserManager.shared.endBigTenSolarYear = ""
            
            UserManager.shared.endBigTenSolarMonth = ""
            
            UserManager.shared.endBigTenSolarDay = ""
            
            UserManager.shared.endBigTenTime = ""
            
            UserManager.shared.endBigTenLunarYear = ""
            
            UserManager.shared.endBigTenLunarMonth = ""
            
            UserManager.shared.endBigTenLunarDay = ""
            
        }
        
        heaven[4] = startBigTen.heaven
        
        earthly[4] = startBigTen.earthly
        
        self.heaven[5] = ""
        
        self.heaven[6] = ""
        
        self.heaven[7] = ""
        
        self.heaven[8] = ""
        
        self.earthly[5] = ""
        
        self.earthly[6] = ""
        
        self.earthly[7] = ""
        
        self.earthly[8] = ""
        
//        specificTimingComment()
//
//        heavenEarthlyData[8] = HeavenEarthly(string: startBigTen.heaven)
//
//        heavenEarthlyData[9] = HeavenEarthly(string: startBigTen.earthly)
//
//        tenGodData[8] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[8].string)
//
//        tenGodData[9] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[9].string)
//
//        for index in 10...17 {
//
//            heavenEarthlyData[index] = HeavenEarthly(string: "")
//
//            tenGodData[index] = ""
//
//        }
//
//        heavenEarthlyCollectionView.reloadData()
//
//        tenGodCollectionView.reloadData()
        
    }
    
    func specificYearData(viewController: DatePickerVC) {
        print("test")
    }
    
    func specificMonthData(viewController: DatePickerVC) {
        print("test")
    }
    
    func specificDayData(viewController: DatePickerVC) {
        print("test")
    }
    
    func specificHourData(viewController: DatePickerVC) {
        print("test")
    }
    
}
