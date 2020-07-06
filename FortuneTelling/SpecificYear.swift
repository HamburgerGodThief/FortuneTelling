//
//  SpecificYear.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/6.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class SpecificYear {
    
    static let shared: SpecificYear = SpecificYear()
    
    private init() {}
    
    func getSpecificYears(birthDate: Date, selectedStartAge: Int) -> String {
        
        let birthYearOrder = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate).order
        
        let specificYearOrder = birthYearOrder + selectedStartAge - 1
        
        var targetHeaven: String = ""
        
        var targetEarthly: String = ""
        
        var targetYear: Int = 0
        
        for element in YearHeavenEarthly.shared.yearHeavenEarthlyData where element.order == specificYearOrder {
            
            targetHeaven = element.heaven
            
            targetEarthly = element.earthly
            
            targetYear = element.order + 1923
            
        }
        
        return "\(selectedStartAge)歲  \(targetYear)  \(targetHeaven)\(targetEarthly)年"
        
    }
    
    func getSpecificYearHeaven(birthDate: Date, age: Int) -> String {
        
        let birthYearOrder = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate).order
        
        let specificYearOrder = birthYearOrder + age - 1
        
        var targetHeaven: String = ""
        
        for element in YearHeavenEarthly.shared.yearHeavenEarthlyData where element.order == specificYearOrder {
            
            targetHeaven = element.heaven
            
            break
            
        }
        
        return targetHeaven
        
    }
    
    func getSpecificYearEarthly(birthDate: Date, age: Int) -> String {
        
        let birthYearOrder = YearHeavenEarthly.shared.getBirthYearHeavenEarthly(inputDate: birthDate).order
        
        let specificYearOrder = birthYearOrder + age - 1
        
        var targetEarthly: String = ""
        
        for element in YearHeavenEarthly.shared.yearHeavenEarthlyData where element.order == specificYearOrder {
            
            targetEarthly = element.earthly
            
            break
            
        }
        
        return targetEarthly
        
    }
    
}
