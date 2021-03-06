//
//  HBGTabBarViewController.swift.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

private enum Tab {
    
    case userInput
        
    case record
    
    case about
    
    func controller() -> UIViewController {
        
        var controller: UIViewController
        
        switch self {
            
        case .userInput: controller = UIStoryboard.userInput.instantiateInitialViewController()!
                                    
        case .record: controller = UIStoryboard.record.instantiateInitialViewController()!
            
        case .about: controller = UIStoryboard.about.instantiateInitialViewController()!
            
        }
        
        controller.tabBarItem = tabBarItem()
        
        controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        return controller
        
    }
    
    func tabBarItem() -> UITabBarItem {
        
        switch self {
            
        case .userInput:
            return UITabBarItem(
                title: "資料輸入",
                image: UIImage.init(systemName: "pencil"),
                selectedImage: UIImage.init(systemName: "pencil")
            )
            
        case .record:
            return UITabBarItem(
                title: "歷史紀錄",
                image: UIImage.init(systemName: "doc.plaintext"),
                selectedImage: UIImage.init(systemName: "doc.plaintext")
            )
            
        case .about:
            return UITabBarItem(
                title: "關於",
                image: UIImage.init(systemName: "info.circle"),
                selectedImage: UIImage.init(systemName: "info.circle")
            )
            
        }
    }
}

class HBGTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private let tabs: [Tab] = [.userInput, .record, .about]
    
    var orderObserver: NSKeyValueObservation!
    
    var isExpand: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewControllers = tabs.map({ $0.controller() })
        
        delegate = self
        
    }
    
}
