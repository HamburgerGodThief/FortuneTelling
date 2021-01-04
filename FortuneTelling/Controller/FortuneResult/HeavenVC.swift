//
//  HeavenVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/9/27.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class HeavenVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.delegate = self
            
            collectionView.dataSource = self
            
            collectionView.hbg_registerCellWithNib(identifier: String(describing: ResultCollectionViewCell.self), bundle: nil)
                        
        }
        
    }
    
    var heaven: [Heaven] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}

extension HeavenVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return heaven.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as? ResultCollectionViewCell else { return UICollectionViewCell() }
                    
        item.lbl.text = heaven[indexPath.item].string
        
        item.lbl.textColor = heaven[indexPath.item].fontColor
        
        item.backgroundColor = heaven[indexPath.item].backgroundColor
        
        return item
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor(view.frame.size.width - 20) / CGFloat(heaven.count)
            
        let height = floor(collectionView.frame.size.height - 6)

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
    
}
