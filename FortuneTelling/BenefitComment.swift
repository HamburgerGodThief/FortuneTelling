//
//  BenefitComment.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/9/25.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

enum HeavenFiveElement: Hashable, CaseIterable {
    
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

enum EarthlyFiveElement: Hashable, CaseIterable {
    
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
            
        case .woodYang: return ["寅"]
            
        case .woodYin: return ["卯"]
            
        case .fireYang: return ["午"]
            
        case .fireYin: return ["巳"]
            
        case .earthYang: return ["辰", "戌"]
            
        case .earthYin: return ["丑", "未"]
            
        case .metalYang: return ["申"]
            
        case .metalYin: return ["酉"]
            
        case .waterYang: return ["子"]
            
        case .waterYin: return ["亥"]
            
        }
        
    }
    
}

class BenefitComment {
    
    static let shared: BenefitComment = BenefitComment()
    
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
        
        for index in 0..<yinYangResult.count {
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let benefitYangStr = amountCalculate(ary: benefitYang)
            
            let benefitYinStr = amountCalculate(ary: benefitYin)
            
            if index == 4 {
                
                if yinYangResult[index] == "None" || yinYangResult[0] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[0], default: []]
                
                let targetYin = fiveElement[fiveElements[1], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[0] == "Yang" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                                    
                } else {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                                    
                }
                
            } else {
                
                if yinYangResult[index] == "None" || yinYangResult[index + 1] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 2], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 3], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index + 1] == "Yang" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                    
                } else {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                    
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
        
        for index in 0..<yinYangResult.count {
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let benefitYangStr = amountCalculate(ary: benefitYang)
            
            let benefitYinStr = amountCalculate(ary: benefitYin)
            
            if index == 4 {
                
                if yinYangResult[index] == "None" || yinYangResult[0] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[0], default: []]
                
                let targetYin = fiveElement[fiveElements[1], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[0] == "Yang" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                                    
                } else {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                                    
                }
                
            } else {
                
                if yinYangResult[index] == "None" || yinYangResult[index + 1] == "None" {
                    
                    continue
                    
                }
                
                let targetYang = fiveElement[fiveElements[index * 2 + 2], default: []]
                
                let targetYin = fiveElement[fiveElements[index * 2 + 3], default: []]
                
                let targetYangStr = amountCalculate(ary: targetYang)
                
                let targetYinStr = amountCalculate(ary: targetYin)
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生有餘")
                    
                } else if yinYangResult[index] == "Yin" && yinYangResult[index + 1] == "Yang" {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr), 生不盡")
                    
                } else {
                    
                    result.append("\(benefitYangStr)\(benefitYinStr)生\(targetYangStr)\(targetYinStr)")
                    
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
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            if index == 4 {
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[0] == "None" {
                    
                    result += benefitYang + benefitYin
                    
                }
                
            } else {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index + 1] == "None" {
                    
                    result += benefitYang + benefitYin
                    
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
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            if index == 4 {
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[0] == "None" {
                    
                    result += benefitYang + benefitYin
                    
                }
                
            } else {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "None" && yinYangResult[index + 1] == "None" {
                    
                    result += benefitYang + benefitYin
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
}
