//
//  SpecificDay.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/6.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct SpecificDayData: Codable {
    
    let jan: String
    
    let feb: String
    
    let march: String
    
    let april: String
    
    let may: String
    
    let june: String
    
    let july: String
    
    let aug: String
    
    let sep: String
    
    let oct: String
    
    let nov: String
    
    let dec: String
    
}

class SpecificDay {
    
    static let shared: SpecificDay = SpecificDay()
    
    private init() {
        
        readJSON()
        
    }
    
    var specificDayData: [SpecificDayData] = []
    
    let specificDayHeavenEarthlyData: [String] = [
        "癸亥", "甲子", "乙丑", "丙寅", "丁卯", "戊辰", "己巳", "庚午", "辛未", "壬申", "癸酉", "甲戌",
        "乙亥", "丙子", "丁丑", "戊寅", "己卯", "庚辰", "辛巳", "壬午", "癸未", "甲申", "乙酉", "丙戌",
        "丁亥", "戊子", "己丑", "庚寅", "辛卯", "壬辰", "癸巳", "甲午", "乙未", "丙申", "丁酉", "戊戌",
        "己亥", "庚子", "辛丑", "壬寅", "癸卯", "甲辰", "乙巳", "丙午", "丁未", "戊申", "己酉", "庚戌",
        "辛亥", "壬子", "癸丑", "甲寅", "乙卯", "丙辰", "丁巳", "戊午", "己未", "庚申", "辛酉", "壬戌"]
    
    func readJSON() {
                
        if let path = Bundle.main.path(forResource: "./specificDayData", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                specificDayData = try JSONDecoder().decode([SpecificDayData].self, from: data)
                                
            } catch let error {
                
                print("parse error: \(error.localizedDescription)")
                
            }
            
        } else {
            
            print("Invalid filename/path.")
            
        }
        
    }
    
    func getSpecificDayString(specificYear: Int, specificMonth: Int) -> String {
        
        let index = specificYear - 1924
        
        switch specificMonth {
            
        case 1:
            return specificDayData[index].jan

        case 2:
            return specificDayData[index].feb
            
        case 3:
            return specificDayData[index].march
            
        case 4:
            return specificDayData[index].april
            
        case 5:
            return specificDayData[index].may
            
        case 6:
            return specificDayData[index].june
            
        case 7:
            return specificDayData[index].july
            
        case 8:
            return specificDayData[index].aug
            
        case 9:
            return specificDayData[index].sep
            
        case 10:
            return specificDayData[index].oct
            
        case 11:
            return specificDayData[index].nov
            
        default:
            return specificDayData[index].dec
            
        }
        
    }
    
    func getAllOptionsSpecificDay(startSpecificDay: String, endSpecificDay: String) -> [String] {
        
        let startDate = DateManager.shared.stringToDate(dateStr: startSpecificDay)
                
        var allSpecificDay: [Date] = []
        
        let endSpecificDayMMdd = endSpecificDay.substring(fromIndex: 5, toIndex: 10)
        
        for index in 0...30 {
            
            let specificDay = startDate + Double(index) * 86400
            
            let specificDayString = DateManager.shared.dateToString(date: specificDay)
            
            let startSpecificDayMMdd = specificDayString.substring(fromIndex: 5, toIndex: 10)
            
            if startSpecificDayMMdd == endSpecificDayMMdd {
                
                break
                
            }
            
            allSpecificDay.append(specificDay)
            
        }
        
        var allSpecificDayString: [String] = []
        
        for element in allSpecificDay {
            
            let dateToString = DateManager.shared.dateToString(date: element)
            
            let month = dateToString.substring(fromIndex: 5, toIndex: 7)
            
            let day = dateToString.substring(fromIndex: 8, toIndex: 10)
            
            allSpecificDayString.append("\(month)-\(day)")
            
        }
        
        return allSpecificDayString
        
    }
    
    func getSpecificDayHeaven(selectedDateYYYYMMdd: String) -> String {
        
        let benchmarkDateString: String = "1924-01-01"
        
        let benchmarkOrder: Int = 16
        
        let specificDayDate = DateManager.shared.stringToDateYYYYMMdd(dateStr: selectedDateYYYYMMdd)
        
        let benchmarkDate = DateManager.shared.stringToDateYYYYMMdd(dateStr: benchmarkDateString)
        
        let differenceDays = Int(specificDayDate.timeIntervalSince(benchmarkDate) / 86400)
        
        let targetOrder = benchmarkOrder + differenceDays
        
        let remainder = targetOrder % 60
        
        let heavenEarthly = specificDayHeavenEarthlyData[remainder]
        
        let heaven = heavenEarthly.substring(toIndex: 1)
        
        return heaven
        
    }
    
    func getSpecificDayEarthly (selectedDateYYYYMMdd: String) -> String {
        
        let benchmarkDateString: String = "1924-01-01"
        
        let benchmarkOrder: Int = 16
        
        let specificDayDate = DateManager.shared.stringToDateYYYYMMdd(dateStr: selectedDateYYYYMMdd)
        
        let benchmarkDate = DateManager.shared.stringToDateYYYYMMdd(dateStr: benchmarkDateString)
        
        let differenceDays = Int(specificDayDate.timeIntervalSince(benchmarkDate) / 86400)
        
        let targetOrder = benchmarkOrder + differenceDays
        
        let remainder = targetOrder % 60
        
        let heavenEarthly = specificDayHeavenEarthlyData[remainder]
        
        let earthly = heavenEarthly.substring(fromIndex: 1)
        
        return earthly
        
    }
    
}
