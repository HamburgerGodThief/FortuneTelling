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
    
    var heaven: [String] = []
    
    var earthly: [String] = []
    
    var heavenComment: [String] = ["", "", ""]
    
    var earthlyComment: [String] = ["", "", ""]
        
    var tenGodData: [String] = []
        
    var lunarYear: [String] = ["", "", ""]
    
    var lunarMonth: [String] = ["", "", ""]
    
    var lunarDay: [String] = ["", "", ""]
    
    var year: [String] = ["", "", ""]
    
    var month: [String] = ["", "", ""]
    
    var day: [String] = ["", "", ""]
    
    var time: [String] = ["", "", ""]
    
    var startBigTenAge: Int = 0
    
    var selectedSpecificYear: Int = 1924
    
    var selectedSpecificMonth: Int = 1
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.tintColor = .white
        
        title = navTitle
        
    }
    
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
        
        heaven.append(birthHourHeaven)
        
        heaven.append(birthDayHeavenEarthly.heaven)
        
        heaven.append(birthMonthHeavenEarthly.heaven)
        
        heaven.append(birthYearHeavenEarthly.heaven)
        
        earthly.append(birthHourEarthly)
        
        earthly.append(birthDayHeavenEarthly.earthly)
        
        earthly.append(birthMonthHeavenEarthly.earthly)
        
        earthly.append(birthYearHeavenEarthly.earthly)
        
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
        
        let lunarYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: Date())
        
        lunarYear[0] = "\(lunarYearHeavenEarthly.heaven)\(lunarYearHeavenEarthly.earthly)"
        
        let lunarMonthHeaveEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: Date())
        
        lunarMonth[0] = "\(lunarMonthHeaveEarthly.heaven)\(lunarMonthHeaveEarthly.earthly)"
        
        let lunarDayHeaven = SpecificDay.shared.getSpecificDayHeaven(selectedDateYYYYMMdd: now)
        
        let lunarDayEarthly = SpecificDay.shared.getSpecificDayEarthly(selectedDateYYYYMMdd: now)
        
        lunarDay[0] = "\(lunarDayHeaven)\(lunarDayEarthly)"
        
    }
    
    func bigTenYearsForTableViewSection0(bigTen: BigTenYearsForView, index: Int) {
        
        let bigTenString = DateManager.shared.dateToString(date: bigTen.time)
        
        year[index] = bigTenString.substring(toIndex: 4)
        
        month[index] = bigTenString.substring(fromIndex: 5, toIndex: 7)
        
        day[index] = bigTenString.substring(fromIndex: 8, toIndex: 10)
        
        time[index] = bigTenString.substring(fromIndex: 11)
        
        let lunarYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: bigTen.time)
        
        lunarYear[index] = "\(lunarYearHeavenEarthly.heaven)\(lunarYearHeavenEarthly.earthly)"
        
        let lunarMonthHeaveEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: bigTen.time)
        
        lunarMonth[index] = "\(lunarMonthHeaveEarthly.heaven)\(lunarMonthHeaveEarthly.earthly)"
        
        let lunarDayHeaven = SpecificDay.shared.getSpecificDayHeaven(selectedDateYYYYMMdd: bigTenString)
        
        let lunarDayEarthly = SpecificDay.shared.getSpecificDayEarthly(selectedDateYYYYMMdd: bigTenString)
        
        lunarDay[index] = "\(lunarDayHeaven)\(lunarDayEarthly)"
        
    }
    
    func dataForTableViewSection0(thisBigTen: BigTenYearsForView, nextBigTen: BigTenYearsForView) {
        
        nowSolarDataForTableViewSection0()
        
        bigTenYearsForTableViewSection0(bigTen: thisBigTen, index: 1)
        
        bigTenYearsForTableViewSection0(bigTen: nextBigTen, index: 2)
        
    }
    
    func birthComment(heaven: [String], earthly: [String]) {
        
        let heavenMatchComment = MatchComment.shared.birthHeavenMatchStr(targetHeaven: heaven)
        
        let earthlyMatchComment = MatchComment.shared.birthEarthlyMatchStr(targetEarthly: earthly)
        
        let restHeavenAfterMatch = MatchComment.shared.restElementAfterBirthHeavenMatch(targetHeaven: heaven)
        
        let restEarthlyAfterMatch = MatchComment.shared.restElementAfterBirthEarthlyMatch(targetEarthly: earthly)
        
        let heavenBenefitComment = BenefitComment.shared.heavenCalculateStr(targetHeaven: restHeavenAfterMatch[0])
        
        let earthlyBenefitComment = BenefitComment.shared.earthlyCalculateStr(targetEarthly: restEarthlyAfterMatch[0])
        
        let restHeavenAfterBenefit = BenefitComment.shared.restHeavenAfterCalculate(targetHeaven: restHeavenAfterMatch[0])
        
        let restEarthlyAfterBenefit = BenefitComment.shared.restEarthlyAfterCalculate(targetEarthly: restEarthlyAfterMatch[0])
        
        let heavenDamageComment = DamageComment.shared.heavenCalculateStr(targetHeaven: restHeavenAfterBenefit)
        
        let earthlyDamageComment = DamageComment.shared.earthlyCalculateStr(targetEarthly: restEarthlyAfterBenefit)
        
        let restHeavenAfterDamage = DamageComment.shared.restHeavenAfterCalculate(targetHeaven: restHeavenAfterBenefit)
        
        let restEarthlyAfterDamage = DamageComment.shared.restEarthlyAfterCalculate(targetEarthly: restEarthlyAfterBenefit)
                        
        let heavenMatchStr = combineCommentStr(strAry: heavenMatchComment)
        
        let earthlyMatchStr = combineCommentStr(strAry: earthlyMatchComment)
        
        let heavenBenefitStr = combineCommentStr(strAry: heavenBenefitComment)
        
        let earthlyBenefitStr = combineCommentStr(strAry: earthlyBenefitComment)
        
        let heavenDamageStr = combineCommentStr(strAry: heavenDamageComment)
        
        let earthlyDamageStr = combineCommentStr(strAry: earthlyDamageComment)
        
        let remainingHeavenStr = combineCommentStr(strAry: restHeavenAfterDamage)
        
        let remainingEarthlyStr = combineCommentStr(strAry: restEarthlyAfterDamage)
        
        var tempAry: [String] = [heavenMatchStr, heavenBenefitStr, heavenDamageStr, remainingHeavenStr]
        
        var tempStr: String = ""
        
        for element in tempAry where element != "" {
            
            tempStr += element + ", "
        
        }
        
        tempStr = tempStr.trimmingCharacters(in: CharacterSet(charactersIn: ", "))
        
        heavenComment[0] = tempStr
        
        tempAry = [earthlyMatchStr, earthlyBenefitStr, earthlyDamageStr, remainingEarthlyStr]
        
        tempStr = ""
        
        for element in tempAry where element != "" {
                            
                tempStr += element + ", "
            
        }
        
        tempStr = tempStr.trimmingCharacters(in: CharacterSet(charactersIn: ", "))
        
        earthlyComment[0] = tempStr
        
        for _ in 0...4 {
            
            self.heaven.append("")
            
            self.earthly.append("")
            
        }
        
    }
    
    func specificTimingComment() {
        
        let heavenBirthMatchComment = MatchComment.shared.birthHeavenMatchStr(targetHeaven: heaven)
        
        let earthlyBirthMatchComment = MatchComment.shared.birthEarthlyMatchStr(targetEarthly: earthly)
        
        let heavenMatchComment = MatchComment.shared.heavenMatchCalculateStr(targetHeaven: heaven)
        
        let earthlyMatchComment = MatchComment.shared.earthlyMatchCalculateStr(targetEarthly: earthly)
        
        let restHeavenAfterMatch = MatchComment.shared.restHeavenAfterMatchCalculate(targetHeaven: heaven)
        
        let restEarthlyAfterMatch = MatchComment.shared.restEarthlyAfterMatchCalculate(targetEarthly: earthly)
        
        let heavenBenefitComment = BenefitComment.shared.heavenCalculateStr(targetHeaven: restHeavenAfterMatch)
        
        let earthlyBenefitComment = BenefitComment.shared.earthlyCalculateStr(targetEarthly: restEarthlyAfterMatch)
        
        let restHeavenAfterBenefit = BenefitComment.shared.restHeavenAfterCalculate(targetHeaven: restHeavenAfterMatch)
        
        let restEarthlyAfterBenefit = BenefitComment.shared.restEarthlyAfterCalculate(targetEarthly: restEarthlyAfterMatch)
        
        let heavenDamageComment = DamageComment.shared.heavenCalculateStr(targetHeaven: restHeavenAfterBenefit)
        
        let earthlyDamageComment = DamageComment.shared.earthlyCalculateStr(targetEarthly: restEarthlyAfterBenefit)
        
        let restHeavenAfterDamage = DamageComment.shared.restHeavenAfterCalculate(targetHeaven: restHeavenAfterBenefit)
        
        let restEarthlyAfterDamage = DamageComment.shared.restEarthlyAfterCalculate(targetEarthly: restEarthlyAfterBenefit)
        
        let heavenBirthMatchStr = combineCommentStr(strAry: heavenBirthMatchComment)
        
        let earthlyBirthMatchStr = combineCommentStr(strAry: earthlyBirthMatchComment)
                        
        let heavenMatchStr = combineCommentStr(strAry: heavenMatchComment)
        
        let earthlyMatchStr = combineCommentStr(strAry: earthlyMatchComment)
        
        let heavenBenefitStr = combineCommentStr(strAry: heavenBenefitComment)
        
        let earthlyBenefitStr = combineCommentStr(strAry: earthlyBenefitComment)
        
        let heavenDamageStr = combineCommentStr(strAry: heavenDamageComment)
        
        let earthlyDamageStr = combineCommentStr(strAry: earthlyDamageComment)
        
        let remainingHeavenStr = combineCommentStr(strAry: restHeavenAfterDamage)
        
        let remainingEarthlyStr = combineCommentStr(strAry: restEarthlyAfterDamage)
        
        var tempAry: [String] = [heavenBirthMatchStr, heavenMatchStr, heavenBenefitStr, heavenDamageStr, remainingHeavenStr]
        
        var tempStr: String = ""
        
        for element in tempAry where element != "" {
            
            tempStr += element + ", "
        
        }
        
        tempStr = tempStr.trimmingCharacters(in: CharacterSet(charactersIn: ", "))
        
        heavenComment[1] = tempStr
        
        tempAry = [earthlyBirthMatchStr, earthlyMatchStr, earthlyBenefitStr, earthlyDamageStr, remainingEarthlyStr]
        
        tempStr = ""
        
        for element in tempAry where element != "" {
                            
                tempStr += element + ", "
            
        }
        
        tempStr = tempStr.trimmingCharacters(in: CharacterSet(charactersIn: ", "))
        
        earthlyComment[1] = tempStr
        
    }
    
    func combineCommentStr(strAry: [String]) -> String {
        
        var result: String = ""
        
        for index in 0..<strAry.count {
            
            if index == strAry.count - 1 {
                
                result += strAry[index]
                
            } else {
                
                result += strAry[index] + ", "
                
            }
            
        }
        
        return result
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
        calculateBirthHeavenEarthly()
        
        getBirthTenGod()
        
        nowSolarDataForTableViewSection0()
        
        birthComment(heaven: heaven, earthly: earthly)
        
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
            
            datePickerVC.birthString = birthdayString
            
            datePickerVC.birthYearHeaven = heavenEarthlyData[6].string
            
            datePickerVC.gender = gender
            
            datePickerVC.startBigTenAge = startBigTenAge
            
            datePickerVC.selectedSpecificYear = selectedSpecificYear
            
            datePickerVC.selectedSpecificMonth = selectedSpecificMonth
            
            datePickerVC.delegate = self
            
            present(datePickerVC, animated: true, completion: nil)
            
        }
        
    }
    
}

extension FortuneResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 80
            
        }
        
        return UITableView.automaticDimension
        
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
            
            cell.lunarYearLbl.text = lunarYear[indexPath.row]
            
            cell.lunarMonthLbl.text = lunarMonth[indexPath.row]
            
            cell.lunarDayLbl.text = lunarDay[indexPath.row]
            
            cell.yearLbl.text = year[indexPath.row]
            
            cell.monthLbl.text = month[indexPath.row]
            
            cell.dayLbl.text = day[indexPath.row]
            
            cell.timeLbl.text = time[indexPath.row]
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FortuneCommentTableViewCell", for: indexPath) as? FortuneCommentTableViewCell else { return UITableViewCell() }
            
            let area: [String] = ["本命區塊", "動態區塊", "比較區塊"]
                        
            let heavenlyComment: String = "比星一。食星一。官破一。"
                                    
            cell.areaLbl.text = area[indexPath.row]
            
            cell.heavenCommentLbl.text = heavenComment[indexPath.row]
            
            cell.heavenTenGodComment.text = heavenlyComment
            
            cell.earthlyCommentLbl.text = earthlyComment[indexPath.row]
            
            cell.earthlyTenGodComment.text = heavenlyComment
            
            return cell
        }
        
    }

}

extension FortuneResultVC: DatePickerVCDelegate {
    
    func bigTenYearsData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let startBigTen = viewController.bigTenYearsData[selectedRow + 1]
        
        startBigTenAge = startBigTen.age
        
        if selectedRow + 2 < viewController.bigTenYearsData.count - 1 {
        
            let nextBigTen = viewController.bigTenYearsData[selectedRow + 2]
            
            dataForTableViewSection0(thisBigTen: startBigTen, nextBigTen: nextBigTen)
            
        } else {
            
            bigTenYearsForTableViewSection0(bigTen: startBigTen, index: 1)
            
            lunarYear[2] = ""
            
            lunarMonth[2] = ""
            
            lunarDay[2] = ""
            
            year[2] = ""
            
            month[2] = ""
            
            day[2] = ""
            
            time[2] = ""
            
        }
        
        heaven[4] = startBigTen.heaven
        
        earthly[4] = startBigTen.earthly
        
        specificTimingComment()
        
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
        
        let birthYear = Int(birthdayString.substring(toIndex: 4))
        
        selectedSpecificYear = birthYear! + selectedAge - 1
        
        let birthDate = DateManager.shared.stringToDate(dateStr: birthdayString)
        
        let heaven = SpecificYear.shared.getSpecificYearHeaven(birthDate: birthDate, age: selectedAge)
        
        let earthly = SpecificYear.shared.getSpecificYearEarthly(birthDate: birthDate, age: selectedAge)
        
        self.heaven[5] = heaven
        
        self.earthly[5] = earthly
        
        specificTimingComment()
        
        heavenEarthlyData[10] = HeavenEarthly(string: heaven)
        
        heavenEarthlyData[11] = HeavenEarthly(string: earthly)
        
        tenGodData[10] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[10].string)
        
        tenGodData[11] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[11].string)
        
        for index in 12...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
        tableView.reloadData()
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
    }
    
    func specificMonthData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        selectedSpecificMonth = 1 + selectedRow
        
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
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let selectedDate: String = "\(selectedSpecificYear)-\(viewController.pickerViewData[selectedRow])"
        
        let heaven = SpecificDay.shared.getSpecificDayHeaven(selectedDateYYYYMMdd: selectedDate)
        
        let earthly = SpecificDay.shared.getSpecificDayEarthly(selectedDateYYYYMMdd: selectedDate)
        
        heavenEarthlyData[14] = HeavenEarthly(string: heaven)
        
        heavenEarthlyData[15] = HeavenEarthly(string: earthly)
        
        tenGodData[14] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[14].string)
        
        tenGodData[15] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[15].string)
        
        for index in 16...17 {
            
            heavenEarthlyData[index] = HeavenEarthly(string: "")
            
            tenGodData[index] = ""
            
        }
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
        
    }
    
    func specificHourData(viewController: DatePickerVC) {
        
        let selectedRow = viewController.pickerView.selectedRow(inComponent: 0)
        
        let earthly = SpecificHour.shared.getSpecificHourEarthly(selectedHourIndex: selectedRow)
        
        let heaven = SpecificHour.shared.getSpecificHourHeaven(specificHourEarthly: earthly, specificDayHeaven: heavenEarthlyData[14].string)
        
        heavenEarthlyData[16] = HeavenEarthly(string: heaven)
        
        heavenEarthlyData[17] = HeavenEarthly(string: earthly)
        
        tenGodData[16] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[16].string)
        
        tenGodData[17] = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[17].string)
        
        heavenEarthlyCollectionView.reloadData()
        
        tenGodCollectionView.reloadData()
        
    }
    
}
