//
//  MonthHeavenEarthly.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/28.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct MonthHeavenEarthlyData: Codable {
    
    let absoluteTime: String
    
    let heaven: String
    
    let earthly: String
    
    let order: Int
    
}

class MonthHeavenEarthly {
    
    static let shared: MonthHeavenEarthly = MonthHeavenEarthly()
    
    var monthHeavenEarthlyData: [MonthHeavenEarthlyData] = []
    
    private init() {
        
        readJSON()
        
    }
    
    func readJSON() {
                
        if let path = Bundle.main.path(forResource: "./monthHeavenEarthlyData", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                monthHeavenEarthlyData = try JSONDecoder().decode([MonthHeavenEarthlyData].self, from: data)
                                
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
    
    func getBirthMonthHeavenEarthly(inputDate date: Date) -> MonthHeavenEarthlyData {
                
        for index in 0..<monthHeavenEarthlyData.count {
            
            let compareTime = timeStringToDate(inputTimeString: monthHeavenEarthlyData[index].absoluteTime)
            
            let compareResult = date.compare(compareTime)
            
            switch compareResult {
                
            case .orderedAscending:
                
                print("date 小於 compareTime")
                
                return monthHeavenEarthlyData[index-1]
                
            case .orderedDescending:
                
                print("date 大於 compareTime")
                
            default:
                
                print("date 等於 compareTime")
                
                return monthHeavenEarthlyData[index]
                
            }

        }
        
        return monthHeavenEarthlyData[0]
        
    }
    
}
