//
//  UIStoryborad+Extension.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/19.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

private struct StoryboardCategory {

    static let main = "Main"
    
    static let userInput = "UserInput"

    static let fortuneResult = "FortuneResult"

    static let record = "Record"
    
}

extension UIStoryboard {

    static var main: UIStoryboard { return hBG_Storyboard(name: StoryboardCategory.main) }

    static var userInput: UIStoryboard { return hBG_Storyboard(name: StoryboardCategory.userInput) }

    static var fortuneResult: UIStoryboard { return hBG_Storyboard(name: StoryboardCategory.fortuneResult) }

    static var record: UIStoryboard { return hBG_Storyboard(name: StoryboardCategory.record) }

    private static func hBG_Storyboard(name: String) -> UIStoryboard {

        return UIStoryboard(name: name, bundle: nil)
        
    }
    
}
