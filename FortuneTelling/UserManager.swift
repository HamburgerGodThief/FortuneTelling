//
//  UserManager.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/6.
//  Copyright © 2020 Hamburger. All rights reserved.
//

class UserManager {
    
    static let shared: UserManager = UserManager()
    
    private init() {}
    
    var userName: String = ""
    
    var birthString: String = ""
    
    var gender: String = "男"
    
    var birthHourHeaven: String = ""
    
    var birthHourEarthly: String = ""
    
    var birthDayHeaven: String = ""
    
    var birthDayEarthly: String = ""
    
    var birthMonthHeaven: String = ""
    
    var birthMonthEarthly: String = ""
    
    var birthYearHeaven: String = ""
    
    var birthYearEarthly: String = ""
    
    var birthHourHeavenTenGod: String = ""
    
    var birthHourEarthlyTenGod: String = ""
    
    var birthDayHeavenTenGod: String = ""
    
    var birthDayEarthlyTenGod: String = ""
    
    var birthMonthHeavenTenGod: String = ""
    
    var birthMonthEarthlyTenGod: String = ""
    
    var birthYearHeavenTenGod: String = ""
    
    var birthYearEarthlyTenGod: String = ""
    
}
