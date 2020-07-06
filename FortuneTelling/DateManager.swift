//
//  DateManager.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/5.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class DateManager {
    
    static let shared: DateManager = DateManager()
    
    private init() {}
    
    func stringToDate(dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func stringToDateMMdd(dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM-dd"
                
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func stringToDateYYYYMMdd(dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
                
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func dateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                
        let string = dateFormatter.string(from: date)
        
        return string
        
    }
    
}
