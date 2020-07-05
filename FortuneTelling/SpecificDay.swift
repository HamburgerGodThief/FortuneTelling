//
//  SpecificDay.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/6.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class SpecificDay {
    
    static let shared: SpecificDay = SpecificDay()
    
    private init() {}
    
    let heavenData: [String] = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    
    let monthEarthlyData: [String] = ["寅", "卯", "辰", "巳", "午", "未",
                                      "申", "酉", "戌", "亥", "子", "丑"]
    
    let specificMonthData: [String: [String]] = [
        "子": ["丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲"],
        "丑": ["丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸", "乙"],
        "寅": ["丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲"],
        "卯": ["丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸", "乙"],
        "辰": ["戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙"],
        "巳": ["己", "辛", "癸", "乙", "丁", "己", "辛", "癸", "乙", "丁"],
        "午": ["庚", "壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊"],
        "未": ["辛", "癸", "乙", "丁", "己", "辛", "癸", "乙", "丁", "己"],
        "申": ["壬", "甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚"],
        "酉": ["癸", "乙", "丁", "己", "辛", "癸", "乙", "丁", "己", "辛"],
        "戌": ["甲", "丙", "戊", "庚", "壬", "甲", "丙", "戊", "庚", "壬"],
        "亥": ["乙", "丁", "己", "辛", "癸", "乙", "丁", "己", "辛", "癸"]
    ]
    
    func getSpecificMonth() -> [String] {
        
        let monthString: [String] = ["1月 寅月", "2月 卯月", "3月 辰月", "4月 巳月",
                                     "5月 午月", "6月 未月", "7月 申月", "8月 酉月",
                                     "9月 戌月", "10月 亥月", "11月 子月", "12月 丑月"]
        
        return monthString
        
    }
    
    func getSpecificMonthHeaven(specificMonthEarthly: String, specificYearHeaven: String) -> String {
        
        var index: Int = 0
        
        for order in 0..<heavenData.count where heavenData[order] == specificYearHeaven {
            
            index = order
            
            break
            
        }
        
        guard let specificMonthHeavenTable: [String] = specificMonthData[specificMonthEarthly] else { return "查無此值" }
        
        let heaven: String = specificMonthHeavenTable[index]
        
        return heaven
                
    }
    
    func getSpecificMonthEarthly(selectedMonthIndex: Int) -> String {
        
        return monthEarthlyData[selectedMonthIndex]
        
    }
    
}
