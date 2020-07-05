//
//  FortuneResultVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class FortuneResultVC: UIViewController {
    
    @IBOutlet weak var titleCollectionView: UICollectionView! {
        
        didSet {
            
            titleCollectionView.delegate = self
            
            titleCollectionView.dataSource = self
            
            titleCollectionView.hbg_registerCellWithNib(identifier: String(describing: ResultTitleCollectionViewCell.self), bundle: nil)
                        
        }
        
    }
    
    @IBOutlet weak var heavenEarthlyCollectionView: UICollectionView! {
        
        didSet {
            
            heavenEarthlyCollectionView.delegate = self
            
            heavenEarthlyCollectionView.dataSource = self
                        
            heavenEarthlyCollectionView.hbg_registerCellWithNib(identifier: String(describing: ResultCollectionViewCell.self), bundle: nil)
                        
        }
        
    }
    
    @IBOutlet weak var tenGodCollectionView: UICollectionView! {
           
           didSet {
               
               tenGodCollectionView.delegate = self
               
               tenGodCollectionView.dataSource = self
                           
               tenGodCollectionView.hbg_registerCellWithNib(identifier: String(describing: ResultCollectionViewCell.self), bundle: nil)
                           
           }
           
       }
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.delegate = self
            
            tableView.dataSource = self
            
            tableView.hbg_registerCellWithNib(identifier: String(describing: FortuneResultTableViewCell.self), bundle: nil)
            
            tableView.hbg_registerCellWithNib(identifier: String(describing: FortuneCommentTableViewCell.self), bundle: nil)
            
            tableView.rowHeight = UITableView.automaticDimension
            
            tableView.estimatedRowHeight = 180
                        
        }
        
    }
    
    var birthdayString: String = ""
    
    var gender: String = "男"
    
    var navTitle: String = ""
    
    var heavenEarthlyData: [HeavenEarthly] = []
        
    var tenGodData: [String] = []
        
    var lunarYear: [String] = ["", "", ""]
    
    var lunarMonth: [String] = ["", "", ""]
    
    var lunarDay: [String] = ["", "", ""]
    
    var year: [String] = ["", "", ""]
    
    var month: [String] = ["", "", ""]
    
    var day: [String] = ["", "", ""]
    
    var time: [String] = ["", "", ""]
    
    var startBigTenAge: Int = 0
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.tintColor = .white
        
        title = navTitle
        
    }
    
    func showRemindAlert(message: String) {
            
        let alertController = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
            
    }
    
    func calculateBirthHeavenEarthly() {
        
        let birthDate = DateManager.shared.stringToDate(dateStr: birthdayString)
                
        let birthYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate)
        
        let birthMonthHeavenEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: birthDate)
        
        let birthDateWithoutHour = birthdayString.substring(toIndex: birthdayString.length - 6)
        
        guard let birthDayHeavenEarthly = DayHeavenEarthly.shared.getDayHeavenEarthly(year_month_date: birthDateWithoutHour) else { return }
        
        let birthDateHour = birthdayString.substring(fromIndex: birthdayString.length - 5, toIndex: birthdayString.length - 3)
        
        let birthHourEarthly = HourHeavenEarthly.shared.getHourEarthly(birthHour: birthDateHour)
        
        let birthHourHeaven = HourHeavenEarthly.shared.getHourHeaven(birthHourEarthly: birthHourEarthly, birthDayHeaven: birthDayHeavenEarthly.heaven)
        
        heavenEarthlyData.append(HeavenEarthly(string: birthHourHeaven))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthHourEarthly))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthDayHeavenEarthly.heaven))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthDayHeavenEarthly.earthly))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthMonthHeavenEarthly.heaven))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthMonthHeavenEarthly.earthly))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthYearHeavenEarthly.heaven))
        
        heavenEarthlyData.append(HeavenEarthly(string: birthYearHeavenEarthly.earthly))
        
        for _ in 0...9 {
            
            heavenEarthlyData.append(HeavenEarthly(string: ""))
            
        }
        
    }
    
    func getBirthTenGod() {
        
        var tenGodLabel: [String] = ["", "", "", "", "", "", "", "", "",
                                     "", "", "", "", "", "", "", "", ""]
                
        for index in 0...7 {
            
            if index == 2 {
                
                tenGodLabel[2] = "日主"
                
                continue
                
            }
            
            let tenGod = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[index].string)
            
            tenGodLabel[index] = tenGod
            
        }
        
        tenGodData = tenGodLabel
        
    }
    
    func nowSolarDataForTableViewSection0() {
        
        let now = DateManager.shared.dateToString(date: Date())
        
        year[0] = now.substring(toIndex: 4)
        
        month[0] = now.substring(fromIndex: 5, toIndex: 7)
        
        day[0] = now.substring(fromIndex: 8, toIndex: 10)
        
        time[0] = now.substring(fromIndex: 11)
        
    }
    
    func dataForTableViewSection0(thisBigTen: BigTenYearsForView, nextBigTen: BigTenYearsForView) {
        
        nowSolarDataForTableViewSection0()
        
        let thisTime = DateManager.shared.dateToString(date: thisBigTen.time)
        
        year[1] = thisTime.substring(toIndex: 4)
        
        month[1] = thisTime.substring(fromIndex: 5, toIndex: 7)
        
        day[1] = thisTime.substring(fromIndex: 8, toIndex: 10)
        
        time[1] = thisTime.substring(fromIndex: 11)
        
        let nextTime = DateManager.shared.dateToString(date: nextBigTen.time)
        
        year[2] = nextTime.substring(toIndex: 4)
        
        month[2] = nextTime.substring(fromIndex: 5, toIndex: 7)
        
        day[2] = nextTime.substring(fromIndex: 8, toIndex: 10)
        
        time[2] = nextTime.substring(fromIndex: 11)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
        calculateBirthHeavenEarthly()
        
        getBirthTenGod()
        
        nowSolarDataForTableViewSection0()
        
        tableView.reloadData()
                        
    }
    
}

extension FortuneResultVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == titleCollectionView {
            
            return 9
            
        } else {
            
            return 18
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == titleCollectionView {
        
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultTitleCollectionViewCell", for: indexPath) as? ResultTitleCollectionViewCell else { return UICollectionViewCell() }
            
            let title: [String] = ["生\n時", "生\n日", "生\n月", "生\n年", "大\n運", "流\n年", "流\n月", "流\n日", "流\n時"]
                    
            item.titleLbl.text = title[indexPath.item]
            
            if indexPath.item < 4 {
                
                item.iconBtn.isHidden = true
                
            }
            
            return item
            
        } else {
            
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as? ResultCollectionViewCell else { return UICollectionViewCell() }
            
            if collectionView == heavenEarthlyCollectionView {
                
                item.lbl.text = heavenEarthlyData[indexPath.item].string
                
                item.lbl.textColor = heavenEarthlyData[indexPath.item].fontColor
                
                item.backgroundColor = heavenEarthlyData[indexPath.item].backgroundColor
                    
            } else {
                
                item.lbl.text = tenGodData[indexPath.item]
                
                item.lbl.font = UIFont.systemFont(ofSize: 26, weight: .regular)
                
                if indexPath.item == 2 {
                    
                    item.lbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
                    
                }
                
            }
            
            return item
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor(view.frame.size.width - 20) / 9

        if collectionView == titleCollectionView {
        
            let height = collectionView.frame.size.height - 6
            
            return CGSize(width: width, height: height)
        
        } else {
            
            let height = floor((collectionView.frame.size.height - 7) / 2)

            return CGSize(width: width, height: height)

        }
        
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
        
        if collectionView == titleCollectionView {
        
            let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
            
            guard let datePickerVC = storyboard.instantiateViewController(withIdentifier: "DatePickerVC") as? DatePickerVC else { return }
            
            datePickerVC.index = indexPath.row
            
            datePickerVC.birthString = birthdayString
            
            datePickerVC.birthYearHeaven = heavenEarthlyData[6].string
            
            datePickerVC.gender = gender
            
            datePickerVC.startBigTenAge = startBigTenAge
            
            datePickerVC.delegate = self
            
            present(datePickerVC, animated: true, completion: nil)
            
        }
        
    }
    
}

extension FortuneResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerView = UINib(nibName: "FortuneResultTableHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? FortuneResultTableHeaderView else { return nil }
        
        if section == 0 {
            
            headerView.sectionTitleLbl.text = "流年流月流日流時"
            
        } else {
            
            headerView.sectionTitleLbl.text = "五行合生剋"
            
        }
                
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 3
            
        } else {
        
            return 3
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FortuneResultTableViewCell", for: indexPath) as? FortuneResultTableViewCell else { return UITableViewCell() }
            
            let title: [String] = ["目前時間", "本次大運", "下次大運"]
        
            cell.titleLbl.text = title[indexPath.row]
            
            cell.yearLbl.text = year[indexPath.row]
            
            cell.monthLbl.text = month[indexPath.row]
            
            cell.dayLbl.text = day[indexPath.row]
            
            cell.timeLbl.text = time[indexPath.row]
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FortuneCommentTableViewCell", for: indexPath) as? FortuneCommentTableViewCell else { return UITableViewCell() }
            
            let area: [String] = ["本命區塊", "動態區塊", "比較區塊"]
            
            let heavenly: String = "天干丁生己克癸"
            
            let heavenlyComment: String = "比星一。食星一。官破一。"
            
            let earthly: String = "天干丁生己克癸"
            
            let earthlyComment: String = "比星一。食星一。官破一。"
            
            cell.areaLbl.text = area[indexPath.row]
            
            cell.heavenlyLbl.text = heavenly
            
            cell.heavenlyComment.text = heavenlyComment
            
            cell.earthlyLbl.text = earthly
            
            cell.earthlyComment.text = earthlyComment
            
            return cell
        }
        
    }

}

extension FortuneResultVC: DatePickerVCDelegate {
    
    func bigTenYearsData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let startBigTen = viewController.bigTenYearsData[selectedRow + 1]
        
        startBigTenAge = startBigTen.age
        
        let nextBigTen = viewController.bigTenYearsData[selectedRow + 2]
        
        dataForTableViewSection0(thisBigTen: startBigTen, nextBigTen: nextBigTen)
        
        tableView.reloadData()
        
        heavenEarthlyData[8] = HeavenEarthly(string: startBigTen.heaven)
        
        heavenEarthlyData[9] = HeavenEarthly(string: startBigTen.earthly)
        
        tenGodData[8] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[8].string)
        
        tenGodData[9] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[9].string)
        
        for index in 10...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
        
    }
    
    func specificYearData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let selectedAge = viewController.startBigTenAge + selectedRow
        
        let birthDate = DateManager.shared.stringToDate(dateStr: birthdayString)
        
        let heaven = SpecificYear.shared.getSpecificYearHeaven(birthDate: birthDate, age: selectedAge)
        
        let earthly = SpecificYear.shared.getSpecificYearEarthly(birthDate: birthDate, age: selectedAge)
        
        heavenEarthlyData[10] = HeavenEarthly(string: heaven)
        
        heavenEarthlyData[11] = HeavenEarthly(string: earthly)
        
        tenGodData[10] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[10].string)
        
        tenGodData[11] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[11].string)
        
        for index in 12...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
    }
    
    func specificMonthData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let earthly = SpecificMonth.shared.getSpecificMonthEarthly(selectedMonthIndex: selectedRow)
        
        let heaven = SpecificMonth.shared.getSpecificMonthHeaven(specificMonthEarthly: earthly, specificYearHeaven: heavenEarthlyData[10].string)
        
        heavenEarthlyData[12] = HeavenEarthly(string: heaven)
        
        heavenEarthlyData[13] = HeavenEarthly(string: earthly)
        
        tenGodData[12] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[12].string)
        
        tenGodData[13] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[13].string)
        
        for index in 14...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
        
    }
    
    func specificDayData(viewController: DatePickerVC) {
        
        for index in 16...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
    }
    
    func specificHourData(viewController: DatePickerVC) {
        
    }
    
}
