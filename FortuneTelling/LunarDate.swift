//
//  LunarDate.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/25.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class LunarDateManager {
    
//    let leapFeb: [Int] = [1917, 1928, 1947, 2004, 2023]
//
//    let leapMarch: [Int] = [1936, 1955, 1966, 1993, 2031]
//
//    let leapApril: [Int] = [1925, 1944, 1963, 1974, 1982, 2001, 2012, 2020]
//
//    let leapMay: [Int] = [1914, 1922, 1933, 1952, 1971, 1990, 1998, 2009, 2028, 2039]
//
//    let leapJune: [Int] = [1911, 1930, 1941, 1960, 1979, 1987, 2017, 2025, 2036]
//
//    let leapJuly: [Int] = [1919, 1938, 1949, 1968, 2006]
//
//    let leapAug: [Int] = [1919, 1976, 1995]
//
//    let leapSep: [Int] = [2014]
//
//    let leapOct: [Int] = [1984]
    
    let lunarMonthText: [String] = ["正月", "二月", "三月", "四月", "五月", "六月",
                                    "七月", "八月", "九月", "十月", "冬月", "臘月"]
        
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
                          "七月", "八月", "九月", "十月", "冬月", "臘月"]
        
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
    
    /*
    func lunarDays(targetYear: Int, targetMonth: Int, isLeapMonth: Bool) -> Int {
        
        let gregorianYear = targetYear
        
        let gregorianAdjYear = gregorianYear + 2697

        let chineseEra = Int(gregorianAdjYear/60)
        
        let chineseYear = gregorianAdjYear - chineseEra * 60
        
        var components = DateComponents()
        
        components.era = chineseEra
        
        components.year = chineseYear
        
        components.month = targetMonth
        
        components.isLeapMonth = isLeapMonth

        let targetNumberOfDays = Calendar(identifier: .chinese).date(from: components)

        let range = Calendar(identifier: .chinese).range(of: .day, in: .month, for: targetNumberOfDays!)

        return range?.count ?? 0
    }
    
    func numberOfDaysInMonth(gregorianYear: Int) -> [Int] {
        
        let gregorianYear = gregorianYear
        
        let gregorianAdjYear = gregorianYear + 2697

        let chineseEra = Int(gregorianAdjYear/60)
        
        let chineseYear = gregorianAdjYear - chineseEra * 60
                
        var days: [Int] = []
        
        let numberofMonths = numberOfLunarMonthInYear(gregorianYear: gregorianYear)
        
        if numberofMonths.count == 12 {
            
            for month in numberofMonths {
                
                let result = isMaxMonth(month: month, isLeapMonth: false, year: chineseYear, era: chineseEra, calendar: Calendar(identifier: .chinese))
                
                if result == true {
                    
                    days.append(30)
                    
                } else {
                    
                    days.append(29)
                    
                }
                
            }
            
        } else {
            
            for index in 0...numberofMonths.count - 1 {
                
                if numberofMonths[index] == numberofMonths[index - 1] {
                    
                    let result = isMaxMonth(month: numberofMonths[index], isLeapMonth: true, year: chineseYear, era: chineseEra, calendar: Calendar(identifier: .chinese))
                    
                    if result == true {
                        
                        days.append(30)
                        
                    } else {
                        
                        days.append(29)
                        
                    }
                    
                } else {
                    
                    let result = isMaxMonth(month: numberofMonths[index], isLeapMonth: false, year: chineseYear, era: chineseEra, calendar: Calendar(identifier: .chinese))
                    
                    if result == true {
                        
                        days.append(30)
                        
                    } else {
                        
                        days.append(29)
                        
                    }
                    
                }
                
            }
            
        }
        
        return days
        
    }
    */
}
