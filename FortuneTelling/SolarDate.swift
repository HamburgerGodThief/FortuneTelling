//
//  SolarDate.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/24.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class SolarDateManager {
    
    let startYear = 1911
    
    func solarYears() -> [Int] {
                
        let currentYear = Calendar.current.component(.year, from: Date())
        
        var years: [Int] = []
        
        for year in startYear...(currentYear + 10) {
            
            years.append(year)
            
        }
        
        return years
        
    }
    
    func solarMonths() -> [Int] {
        
        return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        
    }
    
    func solarDays(targetYear: Int, targetMonth: Int) -> Int {
        
        let dateComponents = DateComponents(year: targetYear, month: targetMonth)
                
        guard let targetNumberOfDays = Calendar.current.date(from: dateComponents) else { return 0 }
        
        let range = Calendar.current.range(of: .day, in: .month, for: targetNumberOfDays)
        
        return range?.count ?? 0
        
    }
    
    func solarHours() -> [String] {
        
        let hours: [String] = ["00:00-01:00 早子", "01:00-03:00 丑時", "03:00-05:00 寅時", "05:00-07:00 卯時",
                               "07:00-09:00 辰時", "09:00-11:00 巳時", "11:00-13:00 午時", "13:00-15:00 未時",
                               "15:00-17:00 申時", "17:00-19:00 酉時", "19:00-21:00 戌時", "21:00-23:00 亥時",
                               "23:00-00:00 晚子"]
        
        return hours
    }
    
    func solarToLunar(year: Int, month: Int, day: Int) {
        
        let chineseCalendar = Calendar(identifier: .chinese)
        
        var gregorianCalendar = Calendar(identifier: .gregorian)
        
        gregorianCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        var gcomponents = DateComponents()
        
        gcomponents.era = 1
        
        gcomponents.year = year
        
        gcomponents.month = month
        
        gcomponents.isLeapMonth = true
        
        gcomponents.day = day

        let solarInputDate = gregorianCalendar.date(from: gcomponents)!

        let gFormatter = DateFormatter()
        
        gFormatter.dateFormat = "MM/dd/yyyy"
        
        gFormatter.calendar = chineseCalendar

        print("\(gFormatter.string(from: solarInputDate))")
        
    }
    
    func lunarMonth() {
        
    }
    
}
