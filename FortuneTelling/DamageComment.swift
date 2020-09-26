//
//  DamageComment.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/9/25.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class DamageComment {
    
    static let shared: DamageComment = DamageComment()
    
    private init() {}
    
    private func arabicToChineseNumber(number: Int) -> String {
        
        var result: String = ""
        
        switch number {
        
        case 2:
            
            result = "二"
        
        case 3:
            
            result = "三"
        
        case 4:
            
            result = "四"
        
        case 5:
            
            result = "五"
        
        case 6:
            
            result = "六"
        
        case 7:
            
            result = "七"
        
        case 8:
            
            result = "八"
        
        default:
            
            result = ""
            
        }
        
        return result
        
    }
    
    private func amountCalculate(ary: [String]) -> String {
        
        if ary.count == 0 {
            
            return ""
            
        } else if ary.count == 1 {
            
            return ary[0]
            
        } else {
            
            let count = arabicToChineseNumber(number: ary.count)
            
            return "\(count)\(ary[0])"
            
        }
        
    }
    
    private func heavenFiveElementArrangement(targetHeaven: [String]) -> [HeavenFiveElement: [String]] {
        
        let fiveElements = HeavenFiveElement.allCases
            
        var dictionary: [HeavenFiveElement: [String]] = [:]
        
        for element in fiveElements {
            
            dictionary[element] = targetHeaven.filter { item in
                
                element.criteria.contains(item)
                
            }
            
        }
        
        return dictionary
        
    }
    
    private func earthlyFiveElementArrangement(targetEarthly: [String]) -> [EarthlyFiveElement: [String]] {
        
        let fiveElements = EarthlyFiveElement.allCases
            
        var dictionary: [EarthlyFiveElement: [String]] = [:]
        
        for element in fiveElements {
            
            dictionary[element] = targetEarthly.filter { item in
                
                element.criteria.contains(item)
                
            }
            
        }
        
        return dictionary
        
    }
    
    private func heavenYinYangCalculate(targetHeaven: [String]) -> [String] {
        
        var yinYangResult: [String] = []
        
        let fiveElement = heavenFiveElementArrangement(targetHeaven: targetHeaven)
        
        let fiveElements = HeavenFiveElement.allCases
        
        for index in 0..<fiveElements.count {
            
            if index % 2 != 0 {
                
                continue
                
            }
            
            let yang = fiveElement[fiveElements[index], default: []]
            
            let yin = fiveElement[fiveElements[index + 1], default: []]
            
            if yang.count == 0 && yin.count == 0 {
                
                yinYangResult.append("None")
                
            } else if yang.count > 0 {
                
                yinYangResult.append("Yang")
                
            } else {
                
                yinYangResult.append("Yin")
                
            }
            
        }
        
        return yinYangResult
        
    }
    
    private func earthlyYinYangCalculate(targetEarthly: [String]) -> [String] {
        
        var yinYangResult: [String] = []
        
        let fiveElement = earthlyFiveElementArrangement(targetEarthly: targetEarthly)
        
        let fiveElements = EarthlyFiveElement.allCases
        
        for index in 0..<fiveElements.count {
            
            if index % 2 != 0 {
                
                continue
                
            }
            
            let yang = fiveElement[fiveElements[index], default: []]
            
            let yin = fiveElement[fiveElements[index + 1], default: []]
            
            if yang.count == 0 && yin.count == 0 {
                
                yinYangResult.append("None")
                
            } else if yang.count > 0 {
                
                yinYangResult.append("Yang")
                
            } else {
                
                yinYangResult.append("Yin")
                
            }
            
        }
        
        return yinYangResult
        
    }
    
    func heavenCalculateStr(targetHeaven: [String]) -> [String] {
        
        var result: [String] = []
        
        let fiveElement = heavenFiveElementArrangement(targetHeaven: targetHeaven)
        
        let yinYangResult = heavenYinYangCalculate(targetHeaven: targetHeaven)
        
        let fiveElements = HeavenFiveElement.allCases
        //[木, 火, 土, 金, 水]
        for index in 0..<yinYangResult.count {
                        
            let damageYang = fiveElement[fiveElements[index * 2], default: []]
            
            let damageYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let damageYangStr = amountCalculate(ary: damageYang)
            
            let damageYinStr = amountCalculate(ary: damageYin)
            
            if index >= 3 {
                
                if yinYangResult[index] == "None" || yinYangResult[index - 3] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 4 - 10], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 5 - 10], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index - 3] == "Yin" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋有餘")
                                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index - 3] == "Yang" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋不盡")
                                    
                } else {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr)")
                                    
                }
                
            } else {
                
                if yinYangResult[index] == "None" || yinYangResult[index + 2] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 4], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 5], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 2] == "Yin" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋有餘")
                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index + 2] == "Yang" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋不盡")
                    
                } else {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr)")
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
    func earthlyCalculateStr(targetEarthly: [String]) -> [String] {
        
        var result: [String] = []
        
        let fiveElement = earthlyFiveElementArrangement(targetEarthly: targetEarthly)
        
        let yinYangResult = earthlyYinYangCalculate(targetEarthly: targetEarthly)
        
        let fiveElements = EarthlyFiveElement.allCases
        //[木, 火, 土, 金, 水]
        for index in 0..<yinYangResult.count {
                        
            let damageYang = fiveElement[fiveElements[index * 2], default: []]
            
            let damageYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let damageYangStr = amountCalculate(ary: damageYang)
            
            let damageYinStr = amountCalculate(ary: damageYin)
            
            if index >= 3 {
                
                if yinYangResult[index] == "None" || yinYangResult[index - 3] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 4 - 10], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 5 - 10], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index - 3] == "Yin" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋有餘")
                                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index - 3] == "Yang" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋不盡")
                                    
                } else {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr)")
                                    
                }
                
            } else {
                
                if yinYangResult[index] == "None" || yinYangResult[index + 2] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 4], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 5], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 2] == "Yin" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋有餘")
                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index + 2] == "Yang" {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr), 剋不盡")
                    
                } else {
                    
                    result.append("\(damageYangStr)\(damageYinStr)剋\(targetYangStr)\(targetYinStr)")
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
    func restHeavenAfterCalculate(targetHeaven: [String]) -> [String] {
        
        var result: [String] = []
        
        let fiveElement = heavenFiveElementArrangement(targetHeaven: targetHeaven)
        
        let yinYangResult = heavenYinYangCalculate(targetHeaven: targetHeaven)
        
        let fiveElements = HeavenFiveElement.allCases
        
        for index in 0..<yinYangResult.count {
                        
            let damageYang = fiveElement[fiveElements[index * 2], default: []]
            
            let damageYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            if index >= 3 {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index - 3] == "Yin" {
                    
                    result += damageYang + damageYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index - 3] == "None" {
                    
                    result += damageYang + damageYin
                    
                }
                
            } else {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 2] == "Yin" {
                    
                    result += damageYang + damageYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index + 2] == "None" {
                    
                    result += damageYang + damageYin
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
    func restEarthlyAfterCalculate(targetEarthly: [String]) -> [String] {
        
        var result: [String] = []
        
        let fiveElement = earthlyFiveElementArrangement(targetEarthly: targetEarthly)
        
        let yinYangResult = earthlyYinYangCalculate(targetEarthly: targetEarthly)
        
        let fiveElements = EarthlyFiveElement.allCases
        
        for index in 0..<yinYangResult.count {
                        
            let damageYang = fiveElement[fiveElements[index * 2], default: []]
            
            let damageYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            if index >= 3 {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index - 3] == "Yin" {
                    
                    result += damageYang + damageYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index - 3] == "None" {
                    
                    result += damageYang + damageYin
                    
                }
                
            } else {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 2] == "Yin" {
                    
                    result += damageYang + damageYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index + 2] == "None" {
                    
                    result += damageYang + damageYin
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
}
