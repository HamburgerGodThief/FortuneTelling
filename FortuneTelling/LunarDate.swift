//
//  LunarDate.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/25.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class LunarDateManager {
        
    private func isLeapMonth(month: Int, year: Int, era: Int, calendar: Calendar) -> Bool {
        
        var components = DateComponents()
        
        components.era = era
        
        components.year = year
        
        components.month = month
        
        components.day = 1
        
        components.isLeapMonth = true

        return components.isValidDate(in: calendar)
    }
    
    func lunarMonths(gregorianYear: Int) -> [Int] {
        
        let gregorianYear = gregorianYear
        
        let gregorianAdjYear = gregorianYear + 2697

        let chineseEra = Int(gregorianAdjYear/60)
        
        let chineseYear = gregorianAdjYear - chineseEra * 60
        
        var months: [Int] = []
                
        for month in 1...12 {
            
            let result = isLeapMonth(month: month, year: chineseYear, era: chineseEra, calendar: Calendar(identifier: .chinese))
            
            months.append(month)
            
            if result == true {
                
                months.append(month)
                                
            }
            
        }
        
        return months
        
    }
    
    func lunarMonthsText(gregorianYear: Int) -> [String] {
            
            let gregorianYear = gregorianYear
            
            let gregorianAdjYear = gregorianYear + 2697

            let chineseEra = Int(gregorianAdjYear/60)
            
            let chineseYear = gregorianAdjYear - chineseEra * 60
                        
            var monthsText: [String] = []
        
            var leapMonth: Int = 0
            
            for month in 1...12 {
                
                let result = isLeapMonth(month: month, year: chineseYear, era: chineseEra, calendar: Calendar(identifier: .chinese))
                
                if result {
                    
                    leapMonth = month
                    
                }
                                
            }
            
            monthsText = ["正月", "二月", "三月", "四月", "五月", "六月",
                          "七月", "八月", "九月", "十月", "十一月", "十二月"]
        
            if leapMonth != 0 {
                
                monthsText.insert("潤\(monthsText[leapMonth - 1])", at: leapMonth)
                
            }
        
            return monthsText
            
        }
    
    func isMaxMonth(month: Int, isLeapMonth: Bool, gregorianYear: Int) -> [String] {
        
        let gregorianYear = gregorianYear
        
        let gregorianAdjYear = gregorianYear + 2697

        let chineseEra = Int(gregorianAdjYear/60)
        
        let chineseYear = gregorianAdjYear - chineseEra * 60
        
        var components = DateComponents()
        
        components.era = chineseEra
        
        components.year = chineseYear
        
        components.month = month
        
        components.day = 30
        
        components.isLeapMonth = isLeapMonth
        
        if components.isValidDate(in: Calendar(identifier: .chinese)) {
            
            return ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
                    "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "廿十",
                    "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"]
            
        }
        
        return ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
                "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "廿十",
                "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九"]

    }
    
    func lunarToSolar(gregorianYear: Int, lunarMonth: Int, isLeapMonth: Bool, lunarDay: Int) -> String {
        
        let gregorianYear = gregorianYear
        
        let gregorianAdjYear = gregorianYear + 2697

        let lunarEra = Int(gregorianAdjYear/60)
        
        let lunarYear = gregorianAdjYear - lunarEra * 60

        var components = DateComponents()
        
        components.era = lunarEra
        
        components.year = lunarYear
        
        components.month = lunarMonth
        
        components.isLeapMonth = isLeapMonth
        
        components.day = lunarDay

        let lunarDate = Calendar(identifier: .chinese).date(from: components)!

        var gregorianCalendar = Calendar(identifier: .gregorian)
        
        gregorianCalendar.timeZone = TimeZone(secondsFromGMT: 0)!

        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        formatter.calendar = gregorianCalendar
        
        let solarDate = formatter.string(from: lunarDate)

        return solarDate
        
    }
    
}
