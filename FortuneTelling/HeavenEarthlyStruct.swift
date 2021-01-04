//
//  HeavenEarthlyStruct.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/30.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

struct HeavenEarthly {
    
    var string: String = ""
    
    var backgroundColor: UIColor = .white
    
    var fontColor: UIColor = .white
    // swiftlint:disable all
    mutating func colorSet() {
        
        switch string {
            
        case "甲":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "乙":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "丙":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "丁":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "戊":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "己":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "庚":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "辛":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "壬":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "癸":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "子":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "丑":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "寅":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "卯":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "辰":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "巳":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "午":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "未":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "申":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "酉":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "戌":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "亥":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        default:
            
            return
            
        }
        
    }
    // swiftlint:enable all
    init(string: String) {
        
        self.string = string
        
        colorSet()
        
    }
    
}

struct Heaven {
    
    var string: String = ""
    
    var backgroundColor: UIColor = .white
    
    var fontColor: UIColor = .white
    // swiftlint:disable all
    mutating func colorSet() {
        
        switch string {
            
        case "甲":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "乙":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "丙":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "丁":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "戊":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "己":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "庚":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "辛":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "壬":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "癸":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
        
        default:
            
            return
            
        }
        
    }
    // swiftlint:enable all
    init(string: String) {
        
        self.string = string
        
        colorSet()
        
    }
    
}

struct Earthly {
    
    var string: String = ""
    
    var backgroundColor: UIColor = .white
    
    var fontColor: UIColor = .white
    // swiftlint:disable all
    mutating func colorSet() {
        
        switch string {
        
        case "子":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "孖":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        case "丑":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "寅":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "卯":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WoodColor)!
            
        case "辰":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "巳":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "午":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.FireColor)!
            
        case "未":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "申":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "酉":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.MetalColor)!
            
        case "戌":
            
            backgroundColor = UIColor.assetColor(.YangColor)!
            
            fontColor = UIColor.assetColor(.EarthColor)!
            
        case "亥":
            
            backgroundColor = UIColor.assetColor(.YinColor)!
            
            fontColor = UIColor.assetColor(.WaterColor)!
            
        default:
            
            return
            
        }
        
    }
    // swiftlint:enable all
    init(string: String) {
        
        self.string = string
        
        colorSet()
        
    }
    
}
