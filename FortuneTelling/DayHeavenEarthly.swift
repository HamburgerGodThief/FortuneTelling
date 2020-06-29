//
//  DayHeavenEarthly.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/29.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct DayHeavenEarthlyData {
    
    let order: Int
    
    let heaven: String
    
    let earthly: String

}

class DayHeavenEarthly {
    
    static let shared: DayHeavenEarthly = DayHeavenEarthly()
    
    let dayHeavenEarthlyData: [DayHeavenEarthlyData] = [
        DayHeavenEarthlyData(order: 0, heaven: "癸", earthly: "亥"),
        DayHeavenEarthlyData(order: 1, heaven: "甲", earthly: "子"),
        DayHeavenEarthlyData(order: 2, heaven: "乙", earthly: "丑"),
        DayHeavenEarthlyData(order: 3, heaven: "丙", earthly: "寅"),
        DayHeavenEarthlyData(order: 4, heaven: "丁", earthly: "卯"),
        DayHeavenEarthlyData(order: 5, heaven: "戊", earthly: "辰"),
        DayHeavenEarthlyData(order: 6, heaven: "己", earthly: "巳"),
        DayHeavenEarthlyData(order: 7, heaven: "庚", earthly: "午"),
        DayHeavenEarthlyData(order: 8, heaven: "辛", earthly: "未"),
        DayHeavenEarthlyData(order: 9, heaven: "壬", earthly: "申"),
        DayHeavenEarthlyData(order: 10, heaven: "癸", earthly: "酉"),
        DayHeavenEarthlyData(order: 11, heaven: "甲", earthly: "戌"),
        DayHeavenEarthlyData(order: 12, heaven: "乙", earthly: "亥"),
        DayHeavenEarthlyData(order: 13, heaven: "丙", earthly: "子"),
        DayHeavenEarthlyData(order: 14, heaven: "丁", earthly: "丑"),
        DayHeavenEarthlyData(order: 15, heaven: "戊", earthly: "寅"),
        DayHeavenEarthlyData(order: 16, heaven: "己", earthly: "卯"),
        DayHeavenEarthlyData(order: 17, heaven: "庚", earthly: "辰"),
        DayHeavenEarthlyData(order: 18, heaven: "辛", earthly: "巳"),
        DayHeavenEarthlyData(order: 19, heaven: "壬", earthly: "午"),
        DayHeavenEarthlyData(order: 20, heaven: "癸", earthly: "未"),
        DayHeavenEarthlyData(order: 21, heaven: "甲", earthly: "申"),
        DayHeavenEarthlyData(order: 22, heaven: "乙", earthly: "酉"),
        DayHeavenEarthlyData(order: 23, heaven: "丙", earthly: "戌"),
        DayHeavenEarthlyData(order: 24, heaven: "丁", earthly: "亥"),
        DayHeavenEarthlyData(order: 25, heaven: "戊", earthly: "子"),
        DayHeavenEarthlyData(order: 26, heaven: "己", earthly: "丑"),
        DayHeavenEarthlyData(order: 27, heaven: "庚", earthly: "寅"),
        DayHeavenEarthlyData(order: 28, heaven: "辛", earthly: "卯"),
        DayHeavenEarthlyData(order: 29, heaven: "壬", earthly: "辰"),
        DayHeavenEarthlyData(order: 30, heaven: "癸", earthly: "巳"),
        DayHeavenEarthlyData(order: 31, heaven: "甲", earthly: "午"),
        DayHeavenEarthlyData(order: 32, heaven: "乙", earthly: "未"),
        DayHeavenEarthlyData(order: 33, heaven: "丙", earthly: "申"),
        DayHeavenEarthlyData(order: 34, heaven: "丁", earthly: "酉"),
        DayHeavenEarthlyData(order: 35, heaven: "戊", earthly: "戌"),
        DayHeavenEarthlyData(order: 36, heaven: "己", earthly: "亥"),
        DayHeavenEarthlyData(order: 37, heaven: "庚", earthly: "子"),
        DayHeavenEarthlyData(order: 38, heaven: "辛", earthly: "丑"),
        DayHeavenEarthlyData(order: 39, heaven: "壬", earthly: "寅"),
        DayHeavenEarthlyData(order: 40, heaven: "癸", earthly: "卯"),
        DayHeavenEarthlyData(order: 41, heaven: "甲", earthly: "辰"),
        DayHeavenEarthlyData(order: 42, heaven: "乙", earthly: "巳"),
        DayHeavenEarthlyData(order: 43, heaven: "丙", earthly: "午"),
        DayHeavenEarthlyData(order: 44, heaven: "丁", earthly: "未"),
        DayHeavenEarthlyData(order: 45, heaven: "戊", earthly: "申"),
        DayHeavenEarthlyData(order: 46, heaven: "己", earthly: "酉"),
        DayHeavenEarthlyData(order: 47, heaven: "庚", earthly: "戌"),
        DayHeavenEarthlyData(order: 48, heaven: "辛", earthly: "亥"),
        DayHeavenEarthlyData(order: 49, heaven: "壬", earthly: "子"),
        DayHeavenEarthlyData(order: 50, heaven: "癸", earthly: "丑"),
        DayHeavenEarthlyData(order: 51, heaven: "甲", earthly: "寅"),
        DayHeavenEarthlyData(order: 52, heaven: "乙", earthly: "卯"),
        DayHeavenEarthlyData(order: 53, heaven: "丙", earthly: "辰"),
        DayHeavenEarthlyData(order: 54, heaven: "丁", earthly: "巳"),
        DayHeavenEarthlyData(order: 55, heaven: "戊", earthly: "午"),
        DayHeavenEarthlyData(order: 56, heaven: "己", earthly: "未"),
        DayHeavenEarthlyData(order: 57, heaven: "庚", earthly: "申"),
        DayHeavenEarthlyData(order: 58, heaven: "辛", earthly: "酉"),
        DayHeavenEarthlyData(order: 59, heaven: "壬", earthly: "戌")
    ]
    
    private init () {}
    
    func timeStringToDate(inputTimeString dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func getDayHeavenEarthly(year_month_date targetDate: String) -> DayHeavenEarthlyData? {
        
        let benchmarkDate = timeStringToDate(inputTimeString: "1924-01-01")
        
        let benchmarkOrder: Int = 16
        
        let targetDate = timeStringToDate(inputTimeString: targetDate)
        
        let differenceDays = Int(targetDate.timeIntervalSince(benchmarkDate) / 86400)
        
        let targetOrder = benchmarkOrder + differenceDays
        
        let remainder = targetOrder % 60
        
        for element in dayHeavenEarthlyData where element.order == remainder {
                            
            return element
    
        }
        
        return nil
        
    }
    
}
