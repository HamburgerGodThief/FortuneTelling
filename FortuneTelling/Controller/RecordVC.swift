//
//  RecordVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.delegate = self
            
            tableView.dataSource = self
            
            tableView.hbg_registerCellWithNib(identifier: String(describing: RecordTableViewCell.self), bundle: nil)
            
            tableView.rowHeight = UITableView.automaticDimension
            
            tableView.estimatedRowHeight = 180
                        
        }
        
    }
    
    var userRecord: [UserRecord] = []
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.barStyle = .black
        
        title = "歷史紀錄"
        
    }
    
    func fetchRecord() {
        
        userRecord = StorageManager.shared.read()
        
        for element in userRecord {
            
            let birthDate = DateManager.shared.stringToDate(dateStr: element.solarBirth!)
            
            let birthString = DateManager.shared.dateToString(date: birthDate)
            
            element.solarBirth = birthString
            
        }
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        fetchRecord()
        
    }
    
}

extension RecordVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userRecord.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as? RecordTableViewCell else { return UITableViewCell() }
        
        guard let lastname = userRecord[indexPath.row].lastname else { return UITableViewCell() }
        
        guard let firstname = userRecord[indexPath.row].firstname else { return UITableViewCell() }
        
        guard let gender = userRecord[indexPath.row].gender else { return UITableViewCell() }
        
        guard let birthString = userRecord[indexPath.row].solarBirth else { return UITableViewCell() }
        
        let year = birthString.substring(toIndex: 4)
        
        let month = birthString.substring(fromIndex: 5, toIndex: 7)
        
        let day = birthString.substring(fromIndex: 8, toIndex: 10)
        
        let time = birthString.substring(fromIndex: 11)
        
        cell.namelbl.text = "\(lastname)\(firstname)"
                
        cell.genderlbl.text = "[\(gender)]"
        
        cell.birthlbl.text = "陽曆  \(year)年  \(month)月  \(day)日  \(time)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //使用Navigator 跳轉至命盤結果
        
        let storyboard = UIStoryboard(name: "FortuneResult", bundle: nil)
        guard let fortuneResultVC = storyboard.instantiateViewController(withIdentifier: "FortuneResultVC") as? FortuneResultVC else { return }
        
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.pushViewController(fortuneResultVC, animated: true)
        
    }

}
