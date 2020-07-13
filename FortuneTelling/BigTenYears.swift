//
//  BigTenYears.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/30.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct BigTenYearsData: Codable {
    
    let absoluteTime: String
    
    let positive: String
    
    let negative: String
    
}

struct BigTenYearsForView {
    
    let age: Int
    
    let time: Date
    
    let heaven: String
    
    let earthly: String
    
}

class BigTenYears {
    
    static let shared: BigTenYears = BigTenYears()
    
    var bigTenYearsData: [BigTenYearsData] = []
    
    private init() {
        
        readJSON()
        
    }
    
    func readJSON() {
                
        if let path = Bundle.main.path(forResource: "./bigTenYearsData", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                bigTenYearsData = try JSONDecoder().decode([BigTenYearsData].self, from: data)
                                
            } catch let error {
                
                print("parse error: \(error.localizedDescription)")
                
            }
            
        } else {
            
            print("Invalid filename/path.")
            
        }
        
    }
    
    func timeStringToDate(inputTimeString dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func dateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
        
    }
    
    func tenYearsDirection(gender: String, birthYearHeaven: String) -> Bool {
        
        var genderIndex: Int = 1
        
        var birthYearHeavenIndex: Int = -1
        
        if gender == "男" {
            
            genderIndex = 1
            
        } else {
            
            genderIndex = -1
            
        }
        
        switch birthYearHeaven {
            
        case "甲":
            
            birthYearHeavenIndex = 1
            
        case "丙":
            
            birthYearHeavenIndex = 1
            
        case "戊":
            
            birthYearHeavenIndex = 1
            
        case "庚":
            
            birthYearHeavenIndex = 1
            
        case "壬":
            
            birthYearHeavenIndex = 1
            
        default:
            
            birthYearHeavenIndex = -1
            
        }
        
        let direction = genderIndex * birthYearHeavenIndex
        
        if direction == 1 {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
    
    func getBasicJieh(inputDate date: Date, isPositive: Bool) -> Date {
                
        for index in 0..<bigTenYearsData.count {
            
            let compareTime = timeStringToDate(inputTimeString: bigTenYearsData[index].absoluteTime)
            
            let compareResult = date.compare(compareTime)
            
            switch compareResult {
                
            case .orderedAscending:
                
                print("date 小於 compareTime")
                
                if isPositive {
                    
                    return timeStringToDate(inputTimeString: bigTenYearsData[index-1].positive)
                    
                } else {
                    
                    return timeStringToDate(inputTimeString: bigTenYearsData[index-1].negative)
                    
                }
                
            case .orderedDescending:
                
                continue
                
            default:
                
                print("date 等於 compareTime")
                
                if isPositive {
                    
                    return timeStringToDate(inputTimeString: bigTenYearsData[index].positive)
                    
                } else {
                    
                    return timeStringToDate(inputTimeString: bigTenYearsData[index].negative)
                    
                }
                
            }

        }
        
        return Date()
        
    }
    
    func getBigTenYearsHeaven(birthDate: Date, gender: String, birthYearHeaven: String) -> [String] {
        
        let birthMonthHeavenEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: birthDate)
        
        var bigTenYearsOrder: [Int] = [birthMonthHeavenEarthly.order]
        
        var bigTenYearHeaven: [String] = [birthMonthHeavenEarthly.heaven]
        
        let isPositive = tenYearsDirection(gender: gender, birthYearHeaven: birthYearHeaven)
        
        for _ in 0..<10 {
            
            var count = 1
            
            if isPositive {
                
                count = 1
                
            } else {
                
                count = -1
                
            }
            
            let nextBigTenYearOrder = bigTenYearsOrder.last! + count
            
            bigTenYearsOrder.append(nextBigTenYearOrder)
            
        }
        
        for index in 1..<bigTenYearsOrder.count {
            
            for element in MonthHeavenEarthly.shared.monthHeavenEarthlyData where element.order == bigTenYearsOrder[index] {
                
                bigTenYearHeaven.append(element.heaven)
                
            }
            
        }
        
        return bigTenYearHeaven
        
    }
    
    func getBigTenYearsEarthly(birthDate: Date, gender: String, birthYearHeaven: String) -> [String] {
        
        let birthMonthHeavenEarthly = MonthHeavenEarthly.shared.getBirthMonthHeavenEarthly(inputDate: birthDate)
        
        var bigTenYearsOrder: [Int] = [birthMonthHeavenEarthly.order]
        
        var bigTenYearEarthly: [String] = [birthMonthHeavenEarthly.earthly]
        
        let isPositive = tenYearsDirection(gender: gender, birthYearHeaven: birthYearHeaven)
        
        for _ in 0..<10 {
            
            var count = 1
            
            if isPositive {
                
                count = 1
                
            } else {
                
                count = -1
                
            }
            
            let nextBigTenYearOrder = bigTenYearsOrder.last! + count
            
            bigTenYearsOrder.append(nextBigTenYearOrder)
            
        }
        
        for index in 1..<bigTenYearsOrder.count {
            
            for element in MonthHeavenEarthly.shared.monthHeavenEarthlyData where element.order == bigTenYearsOrder[index] {
                
                bigTenYearEarthly.append(element.earthly)
                
            }
            
        }
        
        return bigTenYearEarthly
        
    }
    
    func getBigTenYearsDate(birthDateString: String, gender: String, birthYearHeaven: String) -> [BigTenYearsForView] {
        
        let birthDate = timeStringToDate(inputTimeString: birthDateString)
        
        let isPositive = tenYearsDirection(gender: gender, birthYearHeaven: birthYearHeaven)
        
        let basicJieh = getBasicJieh(inputDate: birthDate, isPositive: isPositive)
        
        let days = Double(60 * 60 * 24)
        
        let dayDifference = abs(Double(birthDate.timeIntervalSince(basicJieh)) / days)
        
        let startBigTenYearDate = birthDate + Double(dayDifference / 3) * 365.2564 * Double(days)
        
        var totalBigTenYearDate: [Date] = [birthDate, startBigTenYearDate]
        
        for _ in 0..<9 {
            
            let nextBigTenYearDate = totalBigTenYearDate.last! + 3652.564 * Double(days)
            
            totalBigTenYearDate.append(nextBigTenYearDate)
            
        }
        
        let yearHeavens = getBigTenYearsHeaven(birthDate: birthDate, gender: gender, birthYearHeaven: birthYearHeaven)
        
        let yearEarthlys = getBigTenYearsEarthly(birthDate: birthDate, gender: gender, birthYearHeaven: birthYearHeaven)
                        
        var bigTenYearsForView: [BigTenYearsForView] = [
            BigTenYearsForView(age: 1, time: totalBigTenYearDate[0], heaven: yearHeavens[0], earthly: yearEarthlys[0]),
            BigTenYearsForView(age: Int(1 + dayDifference / 3), time: totalBigTenYearDate[1], heaven: yearHeavens[1], earthly: yearEarthlys[1])
        ]
        
        for index in 2..<totalBigTenYearDate.count {
            
            let viewData = BigTenYearsForView(age: bigTenYearsForView[index - 1].age + 10, time: totalBigTenYearDate[index], heaven: yearHeavens[index], earthly: yearEarthlys[index])
            
            bigTenYearsForView.append(viewData)
            
        }
        
        return bigTenYearsForView
        
    }
    
}
