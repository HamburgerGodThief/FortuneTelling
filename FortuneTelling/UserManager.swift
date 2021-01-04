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
    
    var startBigTenSolarYear: String = ""
    
    var startBigTenSolarMonth: String = ""
    
    var startBigTenSolarDay: String = ""
    
    var startBigTenLunarYear: String = ""
    
    var startBigTenLunarMonth: String = ""
    
    var startBigTenLunarDay: String = ""
    
    var startBigTenTime: String = ""
    
    var endBigTenSolarYear: String = ""
    
    var endBigTenSolarMonth: String = ""
    
    var endBigTenSolarDay: String = ""
    
    var endBigTenLunarYear: String = ""
    
    var endBigTenLunarMonth: String = ""
    
    var endBigTenLunarDay: String = ""
    
    var endBigTenTime: String = ""
    
}
