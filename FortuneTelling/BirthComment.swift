//
//  BirthComment.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct MatchBenefitDamageResult {
    
    var resultComment: [String]
    
    var resultArray: [String]

}

enum FiveElement: Hashable, CaseIterable {
    
    case woodYang
    
    case woodYin
    
    case fireYang
    
    case fireYin
    
    case earthYang
    
    case earthYin
    
    case metalYang
    
    case metalYin
    
    case waterYang
    
    case waterYin

    var criteria: [String] {
        
        switch self {
            
        case .woodYang: return ["甲"]
            
        case .woodYin: return ["乙"]
            
        case .fireYang: return ["丙"]
            
        case .fireYin: return ["丁"]
            
        case .earthYang: return ["戊"]
            
        case .earthYin: return ["己"]
            
        case .metalYang: return ["庚"]
            
        case .metalYin: return ["辛"]
            
        case .waterYang: return ["壬"]
            
        case .waterYin: return ["癸"]
            
        }
        
    }
    
}

class BirthComment {
    
    static let shared: BirthComment = BirthComment()
    
    private init() {}
    
    private func heavenMatchRule(target: String, candidate: String) -> Bool {
        
        if target == "甲" && candidate == "丙" {
            
            return true
            
        } else if target == "甲" && candidate == "丁" {
            
            return true
            
        } else if target == "乙" && candidate == "庚" {
            
            return true
            
        } else if target == "丙" && candidate == "辛" {
            
            return true
            
        } else if target == "丁" && candidate == "壬" {
            
            return true
            
        } else if target == "戊" && candidate == "癸" {
            
            return true
            
        } else if target == "己" && candidate == "甲" {
            
            return true
            
        } else if target == "庚" && candidate == "乙" {
            
            return true
            
        } else if target == "辛" && candidate == "丙" {
            
            return true
            
        } else if target == "壬" && candidate == "丁" {
            
            return true
            
        } else if target == "癸" && candidate == "戊" {
            
            return true
            
        }
        
        return false
        
    }
    
    private func heavenBenefitRule(target: String, candidate: String) -> Bool {
        
        if target == "甲" && (candidate == "丙" || candidate == "丁") {
            
            return true
            
        } else if target == "乙" && (candidate == "丙" || candidate == "丁") {
            
            return true
            
        } else if target == "丙" && (candidate == "戊" || candidate == "己") {
            
            return true
            
        } else if target == "丁" && (candidate == "戊" || candidate == "己") {
            
            return true
            
        } else if target == "戊" && (candidate == "庚" || candidate == "辛") {
            
            return true
            
        } else if target == "己" && (candidate == "庚" || candidate == "辛") {
            
            return true
            
        } else if target == "庚" && (candidate == "壬" || candidate == "癸") {
            
            return true
            
        } else if target == "辛" && (candidate == "壬" || candidate == "癸") {
            
            return true
            
        } else if target == "壬" && (candidate == "甲" || candidate == "乙") {
            
            return true
            
        } else if target == "癸" && (candidate == "甲" || candidate == "乙") {
            
            return true
            
        }
        
        return false
        
    }
    
    func heavenMatch(targetHeaven: [String]) -> MatchBenefitDamageResult {
        
        let isMatchX = heavenMatchRule(target: targetHeaven[2], candidate: targetHeaven[3])
        
        let isMatchY = heavenMatchRule(target: targetHeaven[2], candidate: targetHeaven[0])
        
        var result = MatchBenefitDamageResult(resultComment: [], resultArray: [])
        
        if isMatchX {
            
            result.resultComment.append("\(targetHeaven[3])合\(targetHeaven[2])")
            
            result.resultArray = [targetHeaven[0], targetHeaven[1]]
            
        }
        
        if isMatchY {
            
            result.resultComment.append("\(targetHeaven[2])合\(targetHeaven[0])")
            
            result.resultArray = [targetHeaven[1], targetHeaven[3]]
            
        }
        
        return result
        
    }
    
    func earthlyMatch(targetEarthly: [String]) -> MatchBenefitDamageResult {
        
        var result = MatchBenefitDamageResult(resultComment: [], resultArray: targetEarthly)
        
        let isMatchX = heavenMatchRule(target: targetEarthly[3], candidate: targetEarthly[2])
        
        let isMatchY = heavenMatchRule(target: result.resultArray[2], candidate: result.resultArray[1])
        
        let isMatchZ = heavenMatchRule(target: targetEarthly[1], candidate: targetEarthly[0])
        
        if isMatchX {
                        
            result.resultComment.append("\(targetEarthly[3])合\(targetEarthly[2])")
            
            result.resultArray.remove(at: 3)
            
            result.resultArray.remove(at: 2)
            
        }
        
        if isMatchZ {
                        
            result.resultComment.append("\(targetEarthly[1])合\(targetEarthly[0])")
            
            result.resultArray.remove(at: 1)
            
            result.resultArray.remove(at: 0)
            
        }
        
        if isMatchY && !isMatchX {
                        
            result.resultComment.append("\(targetEarthly[2])合\(targetEarthly[1])")
            
            result.resultArray.remove(at: 2)
            
            result.resultArray.remove(at: 1)
            
            let isMatchZeroThird = heavenMatchRule(target: targetEarthly[3], candidate: targetEarthly[0])
            
            if isMatchZeroThird {
                                
                result.resultComment.append("\(targetEarthly[3])合\(targetEarthly[0])")
                
                result.resultArray.remove(at: 1)
                
                result.resultArray.remove(at: 0)
                
            }
            
        }
        
        return result
        
    }
    
    func fiveElementArrangement(targetHeaven: [String]) -> [FiveElement: [String]] {
        
        let fiveElements = FiveElement.allCases
            
        var dictionary: [FiveElement: [String]] = [:]
        
        for element in fiveElements {
            
            dictionary[element] = targetHeaven.filter { item in
                
                element.criteria.contains(item)
                
            }
            
        }
        
        return dictionary
        
    }
    
    func benefitYinYangCalculate(fiveElement: [FiveElement: [String]]) -> [String] {
        
        var yinYangResult: [String] = []
        
        let fiveElements = FiveElement.allCases
        
        for index in 0..<fiveElements.count {
            
            if index % 2 != 0 {
                
                continue
                
            }
            
            let yang = fiveElement[fiveElements[index], default: []]
            
            let yin = fiveElement[fiveElements[index + 1], default: []]
            
            if yang.count == 0 && yin.count == 0 {
                
                yinYangResult.append("Pass")
                
            } else if yang.count > 0 {
                
                yinYangResult.append("Yang")
                
            } else {
                
                yinYangResult.append("Yin")
                
            }
            
        }
        
        return yinYangResult
        
    }
    
    func benefitCalculate(yinYangResult: [String], fiveElement: [FiveElement: [String]]) -> [String] {
        
        var result: [String] = []
        
        let fiveElements = FiveElement.allCases
        //[木, 火, 土, 金, 水]
        
        for index in 0..<yinYangResult.count {
            
            if index == 4 {
                
                if yinYangResult[index] == "Pass" || yinYangResult[0] == "Pass" {
                    
                    continue
                    
                }
                
                let benefitYang = fiveElement[fiveElements[index * 2], default: []]
                
                let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
                
                let targetYang = fiveElement[fiveElements[0], default: []]
                
                let targetYin = fiveElement[fiveElements[1], default: []]
                
                let benefitYangStr = resultCalculate(ary: benefitYang)
                
                let benefitYinStr = resultCalculate(ary: benefitYin)
                
                let targetYangStr = resultCalculate(ary: targetYang)
                
                let targetYinStr = resultCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[0] == "Yang" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                    
                } else {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                    
                }
                
            }
            
            if yinYangResult[index] == "Pass" || yinYangResult[index + 1] == "Pass" {
                
                continue
                
            }
            
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let targetYang = fiveElement[fiveElements[index * 2 + 2], default: []]
            
            let targetYin = fiveElement[fiveElements[index * 2 + 3], default: []]
            
            let benefitYangStr = resultCalculate(ary: benefitYang)
            
            let benefitYinStr = resultCalculate(ary: benefitYin)
            
            let targetYangStr = resultCalculate(ary: targetYang)
            
            let targetYinStr = resultCalculate(ary: targetYin)
            
            if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                
                result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                
            } else if yinYangResult[index] == "Yin" && yinYangResult[index + 1] == "Yang" {
                
                result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                
            } else {
                
                result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                
            }
            
        }
        
        return result
        
    }
    
    func resultCalculate(ary: [String]) -> String {
        
        if ary.count == 0 {
            
            return ""
            
        } else if ary.count == 1 {
            
            return ary[0]
            
        } else {
            
            return "\(ary.count)\(ary[0])"
            
        }
        
    }
    
}
