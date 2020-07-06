//
//  SpecificHour.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/6.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class SpecificHour {
    
    static let shared: SpecificHour = SpecificHour()
    
    private init() {}
    
    let heavenData: [String] = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    
    let hourString: [String] = ["子", "丑", "寅", "卯", "辰", "巳",
                                "午", "未", "申", "酉", "戌", "亥", "孖"]
    
    func getSpecificHour() -> [String] {
        
        return hourString
        
    }
    
    func getSpecificHourHeaven(specificHourEarthly: String, specificDayHeaven: String) -> String {
        
        let heavenEarthlyData = HourHeavenEarthly.shared.heavenEarthlyData
        
        guard let hourHeavenEarthlyTable: [String] = heavenEarthlyData[specificHourEarthly] else { return "查無此值" }
        
        var order: Int = 0
        
        for index in 0..<heavenData.count where specificDayHeaven == heavenData[index] {
            
            order = index
            
            break
            
        }
        
        return hourHeavenEarthlyTable[order]
                
    }
    
    func getSpecificHourEarthly(selectedHourIndex: Int) -> String {
        
        return hourString[selectedHourIndex]
        
    }
    
}
