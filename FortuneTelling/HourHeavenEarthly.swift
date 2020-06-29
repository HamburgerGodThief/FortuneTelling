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
    
    let earthlyData: [String: String] = ["00:00": "子", "01:00": "丑", "03:00": "寅",
                                         "05:00": "卯", "07:00": "辰", "09:00": "巳",
                                         "11:00": "午", "13:00": "未", "15:00": "申",
                                         "17:00": "酉", "19:00": "戌", "21:00": "亥", "23:00": "孖"]
    
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
    
    func getHourEarthly(birthHour: String) -> String {
        
        guard let hourEarthly: String = earthlyData[birthHour] else { return "查無此值"}
        
        return hourEarthly
    }
    
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
