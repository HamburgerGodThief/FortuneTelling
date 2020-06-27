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
            
            tableView.hbg_registerCellWithNib(identifier: String(describing: FortuneCommentTableViewCell.self), bundle: nil)
            
            tableView.rowHeight = UITableView.automaticDimension
            
            tableView.estimatedRowHeight = 180
                        
        }
        
    }
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        title = "Bob Wang (男) 虛歲 56歲"
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
    }
    
}

extension FortuneResultVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FortuneResultCollectionViewCell", for: indexPath) as? FortuneResultCollectionViewCell else { return UICollectionViewCell() }
        
        let title: [String] = ["生\n時", "生\n日", "生\n月", "生\n年", "大\n運", "流\n年", "流\n月", "流\n日", "流\n時",
                               "壬\n戌", "戊\n申", "丙\n午", "丁\n未", "庚\n子", "甲\n辰", "乙\n亥", "辛\n巳", "乙\n未",
                               "壬\n戌", "戊\n申", "丙\n午", "丁\n未", "庚\n子", "甲\n辰", "乙\n亥", "辛\n巳", "乙\n未"]
                
        item.titleLbl.text = title[indexPath.item]
        
        switch indexPath.item {
        case 4:
            item.iconBtn.isHidden = false
        case 5:
            item.iconBtn.isHidden = false
        case 6:
            item.iconBtn.isHidden = false
        case 7:
            item.iconBtn.isHidden = false
        case 8:
            item.iconBtn.isHidden = false
        default:
            item.iconBtn.isHidden = true
        }
        
        return item
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(collectionView.frame.size.width - 110) / 9
        let height = floor(collectionView.frame.size.height - 15) / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
