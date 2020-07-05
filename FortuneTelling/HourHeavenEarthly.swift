//
//  HourHeavenEarthly.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/29.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class HourHeavenEarthly {
    
    static let shared: HourHeavenEarthly = HourHeavenEarthly()
    
    private init() {}
    
    let heavenData: [String] = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    
    let heavenEarthlyData: [String: [String]] = [
        "子": ["甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬"],
        "丑": ["乙", "丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸"],
        "寅": ["丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲"],
        "卯": ["丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸", "乙"],
        "辰": ["戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙"],
        "巳": ["己", "辛", "癸", "乙", "丁", "己", "辛", "癸", "乙", "丁"],
        "午": ["庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊"],
        "未": ["辛", "癸", "乙", "丁", "己", "辛", "癸", "乙", "丁", "己"],
        "申": ["壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚"],
        "酉": ["癸", "乙", "丁", "己", "辛", "癸", "乙", "丁", "己", "辛"],
        "戌": ["甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬"],
        "亥": ["乙", "丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸"],
        "孖": ["丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲"]
    ]
    // swiftlint:disable all
    func getHourEarthly(birthHour: String) -> String {
        
        switch birthHour {
            
        case "01":
            return "丑"
            
        case "02":
            return "丑"
            
        case "03":
            return "寅"
            
        case "04":
            return "寅"
            
        case "05":
            return "卯"
            
        case "06":
            return "卯"
            
        case "07":
            return "辰"
            
        case "08":
            return "辰"
            
        case "09":
            return "巳"
            
        case "10":
            return "巳"
            
        case "11":
            return "午"
            
        case "12":
            return "午"
            
        case "13":
            return "未"
            
        case "14":
            return "未"
            
        case "15":
            return "申"
            
        case "16":
            return "申"
            
        case "17":
            return "酉"
            
        case "18":
            return "酉"
            
        case "19":
            return "戌"
            
        case "20":
            return "戌"
            
        case "21":
            return "亥"
            
        case "22":
            return "亥"
            
        case "23":
            return "孖"
            
        default:
            return "子"
            
        }
        
    }
    // swiftlint:enable all
    
    func getHourHeaven(birthHourEarthly: String, birthDayHeaven: String) -> String {
        
        var order: Int = 0
        
        for index in 0..<heavenData.count where birthDayHeaven == heavenData[index] {
            
            order = index
            
            break
                
        }
        
        guard let hourHeavenEarthlyTable: [String] = heavenEarthlyData[birthHourEarthly] else { return "查無此值" }
        
        let hourHeaven: String = hourHeavenEarthlyTable[order]
        
        return hourHeaven
        
    }
    
}
