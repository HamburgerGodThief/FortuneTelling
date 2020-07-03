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
    
    @IBOutlet weak var resultCollectionView: UICollectionView! {
        
        didSet {
            
            resultCollectionView.delegate = self
            
            resultCollectionView.dataSource = self
            
            resultCollectionView.hbg_registerCellWithNib(identifier: String(describing: ResultCollectionViewCell.self), bundle: nil)
                        
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
    
    var topLabelData: [HeavenEarthly] = []
    
    var bottomLabelData: [HeavenEarthly] = []
    
    var topTenGod: [String] = []
    
    var bottomTenGod: [String] = []
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.tintColor = .white
        
        title = "Bob Wang (男) 虛歲 56歲"
        
    }
    
    func calculateBirthHeavenEarthly() {
        
        let birthDate = YearHeavenEarthly.shared.timeStringToDate(inputTimeString: birthdayString)
        
        let birthYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate)
        
        let birthMonthHeavenEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: birthDate)
        
        let birthDateWithoutHour = birthdayString.substring(toIndex: birthdayString.length - 6)
        
        guard let birthDayHeavenEarthly = DayHeavenEarthly.shared.getDayHeavenEarthly(year_month_date: birthDateWithoutHour) else { return }
        
        let birthDateHour = birthdayString.substring(fromIndex: birthdayString.length - 5, toIndex: birthdayString.length)
        
        let birthHourEarthly = HourHeavenEarthly.shared.getHourEarthly(birthHour: birthDateHour)
        
        let birthHourHeaven = HourHeavenEarthly.shared.getHourHeaven(birthHourEarthly: birthHourEarthly, birthDayHeaven: birthDayHeavenEarthly.heaven)
        
        topLabelData.append(HeavenEarthly(string: birthHourHeaven))
        
        topLabelData.append(HeavenEarthly(string: birthDayHeavenEarthly.heaven))
        
        topLabelData.append(HeavenEarthly(string: birthMonthHeavenEarthly.heaven))
        
        topLabelData.append(HeavenEarthly(string: birthYearHeavenEarthly.heaven))
        
        bottomLabelData.append(HeavenEarthly(string: birthHourEarthly))
        
        bottomLabelData.append(HeavenEarthly(string: birthDayHeavenEarthly.earthly))
        
        bottomLabelData.append(HeavenEarthly(string: birthMonthHeavenEarthly.earthly))
        
        bottomLabelData.append(HeavenEarthly(string: birthYearHeavenEarthly.earthly))
        
    }
    
    func getTenGod() {
        
        var topTenGodLabel: [String] = []
        
        var bottomTenGodLabel: [String] = []
        
        for index in 0..<topLabelData.count {
            
            if index == 1 {
                
                topTenGodLabel.append("日主")
                
                continue
                
            }
            
            let tenGod = TenGod.shared.getHourEarthly(birthDayHeaven: topLabelData[1].string, targetHeavenEarthly: topLabelData[index].string)
            
            topTenGodLabel.append(tenGod)
            
        }
        
        for index in 0..<bottomLabelData.count {
            
            let tenGod = TenGod.shared.getHourEarthly(birthDayHeaven: topLabelData[1].string, targetHeavenEarthly: bottomLabelData[index].string)
            
            bottomTenGodLabel.append(tenGod)
            
        }
        
        topTenGod = topTenGodLabel
        
        bottomTenGod = bottomTenGodLabel
                
    }
    
//    func getBigTenYears() {
//
//        let test = BigTenYears.shared.getBigTenYearsDate(birthDateString: birthdayString, gender: "男", birthYearHeaven: topLabelData[3].string)
//
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
        calculateBirthHeavenEarthly()
        
        getTenGod()
        
//        getBigTenYears()
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
            
            if indexPath.item < 4 {
                
                item.topLabel.text = topLabelData[indexPath.item].string
                
                item.topLabel.backgroundColor = topLabelData[indexPath.item].backgroundColor
                
                item.topLabel.textColor = topLabelData[indexPath.item].fontColor
                
                item.bottomLabel.text = bottomLabelData[indexPath.item].string
                
                item.bottomLabel.backgroundColor = bottomLabelData[indexPath.item].backgroundColor
                
                item.bottomLabel.textColor = bottomLabelData[indexPath.item].fontColor
                
            } else if indexPath.item == 9 {
                
                item.topLabel.text = topTenGod[0]
                
                item.bottomLabel.text = bottomTenGod[0]
                
            } else if indexPath.item == 10 {
                
                item.topLabel.text = topTenGod[1]
                                
                item.bottomLabel.text = bottomTenGod[1]
                
            } else if indexPath.item == 11 {
                
                item.topLabel.text = topTenGod[2]
                
                item.bottomLabel.text = bottomTenGod[2]
                
            } else if indexPath.item == 12 {
                
                item.topLabel.text = topTenGod[3]
                
                item.bottomLabel.text = bottomTenGod[3]
                
            } else {
                
                item.topLabel.text = "null"
                
                item.bottomLabel.text = "null"
                
            }
            
            
            
            return item
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(collectionView.frame.size.width - 110) / 9
        let height = floor(view.frame.size.height / 3 - 15) / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == titleCollectionView {
        
            let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
            
            guard let datePickerVC = storyboard.instantiateViewController(withIdentifier: "DatePickerVC") as? DatePickerVC else { return }
            
            switch indexPath.item {
            case 4:
                present(datePickerVC, animated: true, completion: nil)
            case 5:
                present(datePickerVC, animated: true, completion: nil)
            case 6:
                present(datePickerVC, animated: true, completion: nil)
            case 7:
                present(datePickerVC, animated: true, completion: nil)
            case 8:
                present(datePickerVC, animated: true, completion: nil)
            default:
                return
            }
            
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
            
            let title: [String] = ["目前時間", "本次大運開始", "下次大運開始"]
        
            cell.titleLbl.text = title[indexPath.row]
            
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