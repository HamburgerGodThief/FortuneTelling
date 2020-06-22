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
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = .systemTeal
        
        title = "歷史紀錄"
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
    }
    
}

extension RecordVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as? RecordTableViewCell else { return UITableViewCell() }
        
        cell.namelbl.text = "程弘棋"
                
        cell.genderlbl.text = "[男]"
        
        cell.birthlbl.text = "1993年 5月 10日 13:20"
        
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
