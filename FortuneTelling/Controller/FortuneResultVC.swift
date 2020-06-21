//
//  FortuneResultVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class FortuneResultVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.delegate = self
            
            collectionView.dataSource = self
            
            collectionView.hbg_registerCellWithNib(identifier: String(describing: FortuneResultCollectionViewCell.self), bundle: nil)
                        
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.delegate = self
            
            tableView.dataSource = self
            
            tableView.hbg_registerCellWithNib(identifier: String(describing: FortuneResultTableViewCell.self), bundle: nil)
            
            tableView.rowHeight = UITableView.automaticDimension
            
            tableView.estimatedRowHeight = 180
                        
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}

extension FortuneResultVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FortuneResultCollectionViewCell", for: indexPath) as? FortuneResultCollectionViewCell else { return UICollectionViewCell() }
        
        item.backgroundColor = .yellow
        
        item.titleLbl.text = "生\n年"
        
        return item
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(collectionView.frame.size.width - 110) / 9
        let height = floor(collectionView.frame.size.height - 15) / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
        
        headerView.backgroundColor = .systemTeal
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 3
            
        } else {
        
            return 20
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FortuneResultTableViewCell", for: indexPath) as? FortuneResultTableViewCell else { return UITableViewCell() }
        
        let title: [String] = ["目前時間", "本次大運開始", "下次大運開始"]
        
        if indexPath.section == 0 {
        
            cell.titleLbl.text = title[indexPath.row]
            
        }
        
        return cell
        
    }

}
