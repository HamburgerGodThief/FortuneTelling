//
//  WuXingModel.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//
/*
import Foundation
import UIKit

protocol WuXingModel {
    
    var string: String { get }
    
    var wuXing: String { get }
    
    var fontColor: UIColor? { get }
    
    var backgroundColor: UIColor? { get }
    
    var yinYang: String { get }
    
    var benefit: [String] { get }
    
    var isBenefitedBy: [String] { get }
    
    var damage: [String] { get }
    
    var isDamagedBy: [String] { get }
    
}

enum Heaven: WuXingModel {
    
    case first
    
    case second
    
    case third
    
    case fourth
    
    case fifth
    
    case sixth
    
    case seventh
    
    case eighth
    
    case nineth
    
    case tenth
    
    var string: String {
        
        switch self {
            
        case .first:
            
            return "甲"
            
        case .second:
            
            return "乙"
            
        case .third:
            
            return "丙"
            
        case .fourth:
            
            return "丁"
            
        case .fifth:
            
            return "戊"
            
        case .sixth:
            
            return "己"
            
        case .seventh:
            
            return "庚"
            
        case .eighth:
            
            return "辛"
            
        case .nineth:
            
            return "壬"
            
        case .tenth:
            
            return "癸"
            
        }
        
    }
    
    var wuXing: String {
        
        switch self {
            
        case .first:
            
            return "木"
            
        case .second:
            
            return "木"
            
        case .third:
            
            return "火"
            
        case .fourth:
            
            return "火"
            
        case .fifth:
            
            return "土"
            
        case .sixth:
            
            return "土"
            
        case .seventh:
            
            return "金"
            
        case .eighth:
            
            return "金"
            
        case .nineth:
            
            return "水"
            
        case .tenth:
            
            return "水"
            
        }
        
    }
    
    var fontColor: UIColor? {
        
        switch self {
            
        case .first:
            
            return UIColor.assetColor(.WoodColor)
            
        case .second:
            
            return UIColor.assetColor(.WoodColor)
            
        case .third:
            
            return UIColor.assetColor(.FireColor)
            
        case .fourth:
            
            return UIColor.assetColor(.FireColor)
            
        case .fifth:
            
            return UIColor.assetColor(.EarthColor)
            
        case .sixth:
            
            return UIColor.assetColor(.EarthColor)
            
        case .seventh:
            
            return UIColor.assetColor(.MetalColor)
            
        case .eighth:
            
            return UIColor.assetColor(.MetalColor)
            
        case .nineth:
            
            return UIColor.assetColor(.WaterColor)
            
        case .tenth:
            
            return UIColor.assetColor(.WaterColor)
            
        }
        
    }
    
    var backgroundColor: UIColor? {
        
        switch self {
            
        case .first:
            
            return UIColor.assetColor(.YangColor)
            
        case .second:
            
            return UIColor.assetColor(.YinColor)
            
        case .third:
            
            return UIColor.assetColor(.YangColor)
            
        case .fourth:
            
            return UIColor.assetColor(.YinColor)
            
        case .fifth:
            
            return UIColor.assetColor(.YangColor)
            
        case .sixth:
            
            return UIColor.assetColor(.YinColor)
            
        case .seventh:
            
            return UIColor.assetColor(.YangColor)
            
        case .eighth:
            
            return UIColor.assetColor(.YinColor)
            
        case .nineth:
            
            return UIColor.assetColor(.YangColor)
            
        case .tenth:
            
            return UIColor.assetColor(.YinColor)
            
        }
        
    }
    
    var yinYang: String {
        
        switch self {
            
        case .first:
            
            return "陽"
            
        case .second:
            
            return "陰"
            
        case .third:
            
            return "陽"
            
        case .fourth:
            
            return "陰"
            
        case .fifth:
            
            return "陽"
            
        case .sixth:
            
            return "陰"
            
        case .seventh:
            
            return "陽"
            
        case .eighth:
            
            return "陰"
            
        case .nineth:
            
            return "陽"
            
        case .tenth:
            
            return "陰"
            
        }
        
    }
    
    var benefit: [String] {
        
        switch self {
            
        case .first:
            
            return ["丙", "丁"]
            
        case .second:
            
            return ["丙", "丁"]
            
        case .third:
            
            return ["戊", "己"]
            
        case .fourth:
            
            return ["戊", "己"]
            
        case .fifth:
            
            return ["庚", "辛"]
            
        case .sixth:
            
            return ["庚", "辛"]
            
        case .seventh:
            
            return ["壬", "癸"]
            
        case .eighth:
            
            return ["壬", "癸"]
            
        case .nineth:
            
            return ["甲", "乙"]
            
        case .tenth:
            
            return ["甲", "乙"]
            
        }
        
    }
    
    var isBenefitedBy: [String] {
        
        switch self {
            
        case .first:
            
            return ["壬", "癸"]
            
        case .second:
            
            return ["壬", "癸"]
            
        case .third:
            
            return ["甲", "乙"]
            
        case .fourth:
            
            return ["甲", "乙"]
            
        case .fifth:
            
            return ["丙", "丁"]
            
        case .sixth:
            
            return ["丙", "丁"]
            
        case .seventh:
            
            return ["戊", "己"]
            
        case .eighth:
            
            return ["戊", "己"]
            
        case .nineth:
            
            return ["庚", "辛"]
            
        case .tenth:
            
            return ["庚", "辛"]
            
        }
        
    }
    
    var damage: [String] {
        
        switch self {
            
        case .first:
            
            return ["丙", "丁"]
            
        case .second:
            
            return ["丙", "丁"]
            
        case .third:
            
            return ["戊", "己"]
            
        case .fourth:
            
            return ["戊", "己"]
            
        case .fifth:
            
            return ["庚", "辛"]
            
        case .sixth:
            
            return ["庚", "辛"]
            
        case .seventh:
            
            return ["壬", "癸"]
            
        case .eighth:
            
            return ["壬", "癸"]
            
        case .nineth:
            
            return ["甲", "乙"]
            
        case .tenth:
            
            return ["甲", "乙"]
            
        }
        
    }
    
    var isDamagedBy: [String] {
        
        switch self {
            
        case .first:
            
            return ["丙", "丁"]
            
        case .second:
            
            return ["丙", "丁"]
            
        case .third:
            
            return ["戊", "己"]
            
        case .fourth:
            
            return ["戊", "己"]
            
        case .fifth:
            
            return ["庚", "辛"]
            
        case .sixth:
            
            return ["庚", "辛"]
            
        case .seventh:
            
            return ["壬", "癸"]
            
        case .eighth:
            
            return ["壬", "癸"]
            
        case .nineth:
            
            return ["甲", "乙"]
            
        case .tenth:
            
            return ["甲", "乙"]
            
        }
        
    }
    
}
*/
