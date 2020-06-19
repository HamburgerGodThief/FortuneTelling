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
    
    case fortuneResult
        
    case record
    
    func controller() -> UIViewController {
        
        var controller: UIViewController
        
        switch self {
            
        case .userInput: controller = UIStoryboard.userInput.instantiateInitialViewController()!
            
        case .fortuneResult: controller = UIStoryboard.fortuneResult.instantiateInitialViewController()!
                        
        case .record: controller = UIStoryboard.record.instantiateInitialViewController()!
            
        }
        
        controller.tabBarItem = tabBarItem()
        
        controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        return controller
        
    }
    
    func tabBarItem() -> UITabBarItem {
        
        switch self {
            
        case .userInput:
            return UITabBarItem(
                title: nil,
                image: UIImage.asset(.Icons_36px_UserInput_Normal),
                selectedImage: UIImage.asset(.Icons_36px_UserInput_Selected)
            )
            
        case .fortuneResult:
            return UITabBarItem(
                title: nil,
                image: UIImage.asset(.Icons_36px_FortuneResult_Normal),
                selectedImage: UIImage.asset(.Icons_36px_FortuneResult_Selected)
            )
            
        case .record:
            return UITabBarItem(
                title: nil,
                image: UIImage.asset(.Icons_36px_Record_Normal),
                selectedImage: UIImage.asset(.Icons_36px_Record_Selected)
            )
            
        }
    }
}

class HBGTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private let tabs: [Tab] = [.userInput, .fortuneResult, .record]
    
    var orderObserver: NSKeyValueObservation!
    
    var isExpand: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewControllers = tabs.map({ $0.controller() })
        
        delegate = self
        
    }
    
}
