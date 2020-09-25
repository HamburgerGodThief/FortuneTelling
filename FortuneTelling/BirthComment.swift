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

enum HeavenMatchRule: Int, Hashable, CaseIterable {
    
    case woodYang = 0
    
    case woodYin

    case fireYang
    
    case fireYin
    
    case earthYang
    
    case waterYin
    
    case waterYang
    
    case metalYin
    
    case metalYang
    
    case earthYin

    var criteria: String {
        
        switch self {
            
        case .woodYang: return "甲"
            
        case .woodYin: return "乙"
            
        case .fireYang: return "丙"
            
        case .fireYin: return "丁"
            
        case .earthYang: return "戊"
            
        case .earthYin: return "己"
            
        case .metalYang: return "庚"
            
        case .metalYin: return "辛"
            
        case .waterYang: return "壬"
            
        case .waterYin: return "癸"
            
        }
        
    }
    
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
    
    private func splitIntoTwoAry(target: [String]) -> [[String]] {
        
        var birthHeaven: [String] = []
        
        var nonBirthHeaven: [String] = []
        
        for index in 0..<target.count {
            
            if index < 4 {
                
                birthHeaven.append(target[index])
                
            } else {
                
                nonBirthHeaven.append(target[index])
                
            }
            
        }
                        
        let result = [birthHeaven, nonBirthHeaven]
        
        return result
        
    }
    
    private func amountCalculate(ary: [String]) -> String {
        
        if ary.count == 0 {
            
            return ""
            
        } else if ary.count == 1 {
            
            return ary[0]
            
        } else {
            
            return "\(ary.count)\(ary[0])"
            
        }
        
    }
    
    func heavenInvertInt(targetHeaven: [String]) -> [Int] {
        
        var result: [Int] = []
                            
        let heavenElements = HeavenMatchRule.allCases
        
        for index in 0..<targetHeaven.count {
            
            for element in heavenElements {
                
                if targetHeaven[index] == element.criteria  {
                    
                    result.append(element.rawValue)
                    
                }
                
            }
            
        }
        
        return result
        
    }

    func matchBirthHeavenStr(targetHeaven: [String]) -> [String] {
        
        var result: [String] = []
        
        var heaven = targetHeaven
        
        var heavenInt = heavenInvertInt(targetHeaven: heaven)
        
        heaven.remove(at: 1)
        
        heavenInt.remove(at: 1)
        
        let theEndIndexOfBirth = 2
            
        //先合本命，再合剩餘部分
        for index in 0...theEndIndexOfBirth {
            
            if index == theEndIndexOfBirth {
                
                break
                
            }
            
            if heavenInt[index] + heavenInt[index + 1] == 9 {
                
                result.append("\(heaven[index + 1])合\(heaven[index])")
                
                heaven.remove(at: index + 1)
                
                heaven.remove(at: index)
                
                heavenInt.remove(at: index + 1)
                
                heavenInt.remove(at: index)
                
            }
            
        }
        
        return result
        
    }

    func restElementAfterMatchBirthHeaven(targetHeaven: [String]) -> [[String]] {
        
        var heaven = splitIntoTwoAry(target: targetHeaven)
            
        var birthHeaven = heaven[0]
        
        var birthHeavenInt = heavenInvertInt(targetHeaven: birthHeaven)
        
        birthHeaven.remove(at: 1)
        
        birthHeavenInt.remove(at: 1)
        
        //先合本命，再合剩餘部分
        for index in 0..<birthHeaven.count {
            
            if index == birthHeaven.count - 1 {
                
                break
                
            }
            
            if birthHeavenInt[index] + birthHeavenInt[index + 1] == 9 {
                            
                birthHeaven.remove(at: index + 1)
                
                birthHeaven.remove(at: index)
                
                birthHeavenInt.remove(at: index + 1)
                
                birthHeavenInt.remove(at: index)
                
            }
            
        }
        
        heaven[0] = birthHeaven
        
        return heaven
        
    }
    
    func restHeavenArrangement(targetHeaven: [[String]]) -> [[String]] {
        
        var birthHeaven = targetHeaven[0]
        
        var nonBirthHeaven = targetHeaven[1]
        //如果非本命有這個元素，那該元素不論在本命或非本命都可視為一體，計算個數即可
        //如果非本命沒有這個元素，該元素只存在於本命，那要將其視為不同個體
        
        var totalAry: [[String]] = []
        
        for index in 0..<birthHeaven.count {
            print("Index:\(index)")
            if index == birthHeaven.count {
                
                break
                
            }
            
            if nonBirthHeaven.contains(birthHeaven[index]) {
                
                var tempAry: [String] = []
                
                tempAry.append(birthHeaven[index])
                
                for indexY in (index..<birthHeaven.count).reversed() {
                    
                    if index == indexY {
                        
                        continue
                        
                    }
                    
                    if birthHeaven[index] == birthHeaven[indexY] {
                        
                        tempAry.append(birthHeaven[indexY])
                        
                        birthHeaven.remove(at: indexY)
                        
                    }
                    
                }
                
                for nonIndex in (0..<nonBirthHeaven.count).reversed() {
                    
                    print(nonIndex)
                    if birthHeaven[index] == nonBirthHeaven[nonIndex] {
                        
                        tempAry.append(nonBirthHeaven[nonIndex])
                        
                        nonBirthHeaven.remove(at: nonIndex)
                        
                    }
                    
                }
                
                totalAry.append(tempAry)
                
                print(totalAry)
                
            } else {
                
                totalAry.append([birthHeaven[index]])
                
            }
            
        }
        
        
        
        for nonIndex in 0..<nonBirthHeaven.count {
            
            var tempAry: [String] = []
            
            tempAry.append(nonBirthHeaven[nonIndex])
            
            for nonIndexY in (nonIndex..<nonBirthHeaven.count).reversed() {
                
                if nonIndex == nonIndexY {
                    
                    continue
                    
                }
                
                if nonBirthHeaven[nonIndex] == nonBirthHeaven[nonIndexY] {
                    
                    tempAry.append(nonBirthHeaven[nonIndexY])
                    
                    nonBirthHeaven.remove(at: nonIndexY)
                    
                }
                
            }
                        
            totalAry.append(tempAry)
                        
        }
        
        return totalAry
        
    }
    
    func matchCalculateStr(organisedHeaven: [[String]]) -> [String] {
        
        var result: [String] = []
        
        var targetHeavenInt: [[Int]] = []
        
        for element in organisedHeaven {
            
            targetHeavenInt.append(heavenInvertInt(targetHeaven: element))
            
        }
        
        for index in 0..<targetHeavenInt.count {
            
            for indexY in (index..<targetHeavenInt.count).reversed() {
                
                if targetHeavenInt[index][0] + targetHeavenInt[indexY][0] == 9 {
                    
                    let frontStr = amountCalculate(ary: organisedHeaven[index])
                    
                    let backStr = amountCalculate(ary: organisedHeaven[indexY])
                    
                    result.append("\(frontStr)合\(backStr)")
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
    func restElementAfterMatchCalulate() {
        
    }
    /*
    private func heavenMatchRule(target: String, candidate: String) -> Bool {
        
        if target == "甲" && candidate == "己" {
            
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
    */
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
    
    func benefitCalculateStr(yinYangResult: [String], fiveElement: [FiveElement: [String]]) -> [String] {
        
        var result: [String] = []
        
        let fiveElements = FiveElement.allCases
        
        for index in 0..<yinYangResult.count {
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            let benefitYangStr = amountCalculate(ary: benefitYang)
            
            let benefitYinStr = amountCalculate(ary: benefitYin)
            
            if index == 4 {
                
                if yinYangResult[index] == "Pass" || yinYangResult[0] == "Pass" {
                    
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
                
                if yinYangResult[index] == "Pass" || yinYangResult[index + 1] == "Pass" {
                    
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
    
    
    
    func restElementAfterBenefitCalculate(yinYangResult: [String], fiveElement: [FiveElement: [String]]) -> [String] {
        
        var result: [String] = []
        
        let fiveElements = FiveElement.allCases
        
        for index in 0..<yinYangResult.count {
                        
            let benefitYang = fiveElement[fiveElements[index * 2], default: []]
            
            let benefitYin = fiveElement[fiveElements[index * 2 + 1], default: []]
            
            if index == 4 {
                
                if yinYangResult[index] == "Yang" && yinYangResult[0] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "Pass" && yinYangResult[0] == "Pass" {
                    
                    result += benefitYang + benefitYin
                    
                }
                
            } else {
                
                if yinYangResult[index] == "Yang" && yinYangResult[index + 1] == "Yin" {
                    
                    result += benefitYang + benefitYin
                    
                } else if yinYangResult[index] != "Pass" && yinYangResult[index + 1] == "Pass" {
                    
                    result += benefitYang + benefitYin
                    
                }
                
            }
            
        }
        
        return result
        
    }
    
}
