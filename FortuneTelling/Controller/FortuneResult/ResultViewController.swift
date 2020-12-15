//
//  ResultViewController.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/9/27.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleContainerView: UIView!
    
    @IBOutlet weak var heavenContainerView: UIView!
    
    var titleVC: TitleViewController!
    
    var heavenVC: HeavenVC!
    
    var navTitle: String = ""
    
    var heavenData: [Heaven] = []
    
    var earthlyData: [Earthly] = []
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.tintColor = .white
        
        title = navTitle
        
    }
    
    func calculateBirthHeavenEarthly() {
        
        let birthStr = UserManager.shared.birthString
        
        let birthDate = DateManager.shared.stringToDate(dateStr: birthStr)
                
        let birthYearHeavenEarthly = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate)
        
        let birthMonthHeavenEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: birthDate)
        
        let birthDateWithoutHour = birthStr.substring(toIndex: birthStr.length - 6)
        
        guard let birthDayHeavenEarthly = DayHeavenEarthly.shared.getDayHeavenEarthly(year_month_date: birthDateWithoutHour) else { return }
        
        let birthDateHour = birthStr.substring(fromIndex: birthStr.length - 5, toIndex: birthStr.length - 3)
        
        let birthHourEarthly = HourHeavenEarthly.shared.getHourEarthly(birthHour: birthDateHour)
        
        let birthHourHeaven = HourHeavenEarthly.shared.getHourHeaven(birthHourEarthly: birthHourEarthly, birthDayHeaven: birthDayHeavenEarthly.heaven)
        
        heavenData.append(Heaven(string: birthHourHeaven))
        
        earthlyData.append(Earthly(string: birthHourEarthly))
        
        heavenData.append(Heaven(string: birthDayHeavenEarthly.heaven))
        
        earthlyData.append(Earthly(string: birthDayHeavenEarthly.earthly))
        
        heavenData.append(Heaven(string: birthMonthHeavenEarthly.heaven))
        
        earthlyData.append(Earthly(string: birthMonthHeavenEarthly.earthly))
        
        heavenData.append(Heaven(string: birthYearHeavenEarthly.heaven))
        
        earthlyData.append(Earthly(string: birthYearHeavenEarthly.earthly))
        
//        for _ in 0...9 {
//
//            heavenEarthlyData.append(HeavenEarthly(string: ""))
//
//        }
        
    }
    /*
    func getBirthTenGod() {
        
        var tenGodLabel: [String] = ["", "", "", "", "", "", "", "", "",
                                     "", "", "", "", "", "", "", "", ""]
        
        let birthDayHeaven
        
        for index in 0...7 {
            
            if index == 2 {
                
                tenGodLabel[2] = "日\n主"
                
                continue
                
            }
            
            let tenGod = TenGod.shared.getTenGod(birthDayHeaven: heavenEarthlyData[2].string, targetHeavenEarthly: heavenEarthlyData[index].string)
            
            tenGodLabel[index] = tenGod
            
        }
        
        tenGodData = tenGodLabel
        
    }
    */
    
    private func configureChildVC(childVC: UIViewController, containerView: UIView) {
        
        addChild(childVC)
        
        containerView.addSubview(childVC.view)
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            childVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
    }
    
    private func setupChildViewControllers() {
        
        let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
        
        guard let titleVC = storyboard.instantiateViewController(withIdentifier: "TitleViewController") as? TitleViewController else { return }
        
        self.titleVC = titleVC
        
        configureChildVC(childVC: titleVC, containerView: titleContainerView)
        
        guard let heavenVC = storyboard.instantiateViewController(withIdentifier: "HeavenVC") as? HeavenVC else { return }
        
        self.heavenVC = heavenVC
        
        configureChildVC(childVC: heavenVC, containerView: heavenContainerView)
        
    }
    
    func transferDataToChildVC() {
        
        heavenVC.heaven = heavenData
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
        calculateBirthHeavenEarthly()
        
        setupChildViewControllers()
        
        transferDataToChildVC()
        
    }
    
}
