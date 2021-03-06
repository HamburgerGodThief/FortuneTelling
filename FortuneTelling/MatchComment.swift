//
//  MatchComment.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/7/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

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

enum EarthlyMatchRule: Int, Hashable, CaseIterable {
    
    case tzu = 0

    case yin
    
    case mao
    
    case chen
    
    case ssu
    
    case wwu
    
    case wei
    
    case shen
    
    case yyu
    
    case hsu
    
    case hai
    
    case chou

    var criteria: String {
        
        switch self {
            
        case .tzu: return "子"
            
        case .chou: return "丑"
            
        case .yin: return "寅"
            
        case .mao: return "卯"
            
        case .chen: return "辰"
            
        case .ssu: return "巳"
            
        case .wwu: return "午"
            
        case .wei: return "未"
            
        case .shen: return "申"
            
        case .yyu: return "酉"
            
        case .hsu: return "戌"
            
        case .hai: return "亥"
            
        }
        
    }
    
}

class MatchComment {
    
    static let shared: MatchComment = MatchComment()
    
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
    
    private func heavenInvertInt(targetHeaven: [String]) -> [Int] {
        
        var result: [Int] = []
                            
        let heavenElements = HeavenMatchRule.allCases
        
        for index in 0..<targetHeaven.count {
            
            for element in heavenElements where targetHeaven[index] == element.criteria {
                                    
                result.append(element.rawValue)
                    
            }
            
        }
        
        return result
        
    }
    
    private func earthlyInvertInt(targetEarthly: [String]) -> [Int] {
        
        var result: [Int] = []
                            
        let earthlyElements = EarthlyMatchRule.allCases
        
        for index in 0..<targetEarthly.count {
            
            for element in earthlyElements where targetEarthly[index] == element.criteria {
                                    
                result.append(element.rawValue)
                    
            }
            
        }
        
        return result
        
    }

    func birthHeavenMatchStr(targetHeaven: [String]) -> [String] {
        
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
            
            if heavenInt.count == 1 || index == heavenInt.count || index + 1 == heavenInt.count {
                
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
    
    func birthEarthlyMatchStr(targetEarthly: [String]) -> [String] {
        
        var result: [String] = []
        
        var earthly = targetEarthly
        
        var earthlyInt = earthlyInvertInt(targetEarthly: earthly)
        
        var theEndIndexOfBirth = 3
        
        //先合本命，再合剩餘部分; 先決定1,2，再決定0,3
        
        if earthlyInt[1] + earthlyInt[2] == 11 {
            
            result.append("\(earthly[1])合\(earthly[2])")
            
            earthly.remove(at: 2)
            
            earthly.remove(at: 1)
            
            earthlyInt.remove(at: 2)
            
            earthlyInt.remove(at: 1)
            
            theEndIndexOfBirth = 1
            
        }
            
        for index in 0...theEndIndexOfBirth {
            
            if index == theEndIndexOfBirth {
                
                break
                
            }
            
            if earthlyInt[index] + earthlyInt[index + 1] == 11 {
                
                result.append("\(earthly[index + 1])合\(earthly[index])")
                
                earthly.remove(at: index + 1)
                
                earthly.remove(at: index)
                
                earthlyInt.remove(at: index + 1)
                
                earthlyInt.remove(at: index)
                
            }
            
        }
        
        return result
        
    }

    func restElementAfterBirthHeavenMatch(targetHeaven: [String]) -> [[String]] {
        
        var heaven = splitIntoTwoAry(target: targetHeaven)
            
        var birthHeaven = heaven[0]
        
        var birthHeavenInt = heavenInvertInt(targetHeaven: birthHeaven)
        
        birthHeaven.remove(at: 1)
        
        birthHeavenInt.remove(at: 1)
        
        //先合本命，再合剩餘部分
        for index in (0..<birthHeaven.count).reversed() {
            
            if index == 0 || index == birthHeaven.count {
                
                break
                
            }
            
            if birthHeavenInt[index] + birthHeavenInt[index - 1] == 9 {
                            
                birthHeaven.remove(at: index)
                
                birthHeaven.remove(at: index - 1)
                
                birthHeavenInt.remove(at: index)
                
                birthHeavenInt.remove(at: index - 1)
                
            }
            
        }
        
        heaven[0] = birthHeaven
        
        return heaven
        
    }
    
    func restElementAfterBirthEarthlyMatch(targetEarthly: [String]) -> [[String]] {
        
        var earthly = splitIntoTwoAry(target: targetEarthly)
            
        var birthEarthly = earthly[0]
        
        var birthEarthlyInt = earthlyInvertInt(targetEarthly: birthEarthly)
        
        if birthEarthlyInt[1] + birthEarthlyInt[2] == 11 {
                        
            birthEarthly.remove(at: 2)
            
            birthEarthly.remove(at: 1)
            
            birthEarthlyInt.remove(at: 2)
            
            birthEarthlyInt.remove(at: 1)
                        
        }
        
        for index in (0..<birthEarthly.count).reversed() {
            
            if index == 0 || index == birthEarthly.count {
                
                break
                
            }
            
            if birthEarthlyInt[index] + birthEarthlyInt[index - 1] == 11 {
                            
                birthEarthly.remove(at: index)
                
                birthEarthly.remove(at: index - 1)
                
                birthEarthlyInt.remove(at: index)
                
                birthEarthlyInt.remove(at: index - 1)
                
            }
            
        }
        
        earthly[0] = birthEarthly
        
        return earthly
        
    }
    
    private func restHeavenArrangement(targetHeaven: [[String]]) -> [[String]] {
        
        var birthHeaven = targetHeaven[0]
        
        var nonBirthHeaven = targetHeaven[1]
        //如果非本命有這個元素，那該元素不論在本命或非本命都可視為一體，計算個數即可
        //如果非本命沒有這個元素，該元素只存在於本命，那要將其視為不同個體
        
        for index in (0..<nonBirthHeaven.count).reversed() where nonBirthHeaven[index] == "" {
            
            nonBirthHeaven.remove(at: index)
            
        }
        
        var totalAry: [[String]] = []
        
        for index in 0..<birthHeaven.count {
            
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
                    
                    if birthHeaven[index] == nonBirthHeaven[nonIndex] {
                        
                        tempAry.append(nonBirthHeaven[nonIndex])
                        
                        nonBirthHeaven.remove(at: nonIndex)
                        
                    }
                    
                }
                
                totalAry.append(tempAry)
                                
            } else {
                
                totalAry.append([birthHeaven[index]])
                
            }
            
        }
        
        for nonIndex in 0..<nonBirthHeaven.count {
            
            if nonIndex == nonBirthHeaven.count {
                
                break
                
            }
            
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
    
    private func restEarthlyArrangement(targetEarthly: [[String]]) -> [[String]] {
        
        var birthEarthly = targetEarthly[0]
        
        var nonBirthEarthly = targetEarthly[1]
        //如果非本命有這個元素，那該元素不論在本命或非本命都可視為一體，計算個數即可
        //如果非本命沒有這個元素，該元素只存在於本命，那要將其視為不同個體
        
        for index in (0..<nonBirthEarthly.count).reversed() where nonBirthEarthly[index] == "" {
            
            nonBirthEarthly.remove(at: index)
            
        }
        
        var totalAry: [[String]] = []
        
        for index in 0..<birthEarthly.count {
            
            if index == birthEarthly.count {
                
                break
                
            }
            
            if nonBirthEarthly.contains(birthEarthly[index]) {
                
                var tempAry: [String] = []
                
                tempAry.append(birthEarthly[index])
                
                for indexY in (index..<birthEarthly.count).reversed() {
                    
                    if index == indexY {
                        
                        continue
                        
                    }
                    
                    if birthEarthly[index] == birthEarthly[indexY] {
                        
                        tempAry.append(birthEarthly[indexY])
                        
                        birthEarthly.remove(at: indexY)
                        
                    }
                    
                }
                
                for nonIndex in (0..<nonBirthEarthly.count).reversed() where birthEarthly[index] == nonBirthEarthly[nonIndex] {
                                
                    tempAry.append(nonBirthEarthly[nonIndex])
                    
                    nonBirthEarthly.remove(at: nonIndex)
                       
                }
                
                totalAry.append(tempAry)
                
                print(totalAry)
                
            } else {
                
                totalAry.append([birthEarthly[index]])
                
            }
            
        }
        
        for nonIndex in 0..<nonBirthEarthly.count {
            
            if nonIndex == nonBirthEarthly.count {
                
                break
                
            }
            
            var tempAry: [String] = []
            
            tempAry.append(nonBirthEarthly[nonIndex])
            
            for nonIndexY in (nonIndex..<nonBirthEarthly.count).reversed() {
                
                if nonIndex == nonIndexY {
                    
                    continue
                    
                }
                
                if nonBirthEarthly[nonIndex] == nonBirthEarthly[nonIndexY] {
                    
                    tempAry.append(nonBirthEarthly[nonIndexY])
                    
                    nonBirthEarthly.remove(at: nonIndexY)
                    
                }
                
            }
                        
            totalAry.append(tempAry)
                        
        }
        
        return totalAry
        
    }
    
    func heavenMatchCalculateStr(targetHeaven: [String]) -> [String] {
        
        var result: [String] = []
        
        var targetHeavenInt: [[Int]] = []
        
        let restHeavenAfterBirthMatch = restElementAfterBirthHeavenMatch(targetHeaven: targetHeaven)
        
        let organisedHeaven = restHeavenArrangement(targetHeaven: restHeavenAfterBirthMatch)
        
        for element in organisedHeaven {
            
            targetHeavenInt.append(heavenInvertInt(targetHeaven: element))
            
        }
        
        for index in 0..<targetHeavenInt.count {
            
            for indexY in (index..<targetHeavenInt.count).reversed() where targetHeavenInt[index][0] + targetHeavenInt[indexY][0] == 9 {
                
                let frontStr = amountCalculate(ary: organisedHeaven[index])
                
                let backStr = amountCalculate(ary: organisedHeaven[indexY])
                
                result.append("\(frontStr)合\(backStr)")
                
            }
            
        }
        
        return result
        
    }
    
    func earthlyMatchCalculateStr(targetEarthly: [String]) -> [String] {
        
        var result: [String] = []
        
        var targetEarthlyInt: [[Int]] = []
        
        let restEarthlyAfterBirthMatch = restElementAfterBirthEarthlyMatch(targetEarthly: targetEarthly)
        
        let organisedEarthly = restHeavenArrangement(targetHeaven: restEarthlyAfterBirthMatch)
        
        for element in organisedEarthly {
            
            targetEarthlyInt.append(earthlyInvertInt(targetEarthly: element))
            
        }
        
        for index in 0..<targetEarthlyInt.count {
            
            for indexY in (index..<targetEarthlyInt.count).reversed() where targetEarthlyInt[index][0] + targetEarthlyInt[indexY][0] == 11 {
                
                let frontStr = amountCalculate(ary: organisedEarthly[index])
                
                let backStr = amountCalculate(ary: organisedEarthly[indexY])
                
                result.append("\(frontStr)合\(backStr)")
                
            }
            
        }
        
        return result
        
    }
    
    func restHeavenAfterMatchCalculate(targetHeaven: [String]) -> [String] {
            
        var targetHeavenInt: [[Int]] = []
        
        let restHeavenAfterBirthMatch = restElementAfterBirthHeavenMatch(targetHeaven: targetHeaven)
        
        let organisedHeaven = restHeavenArrangement(targetHeaven: restHeavenAfterBirthMatch)
        
        for element in organisedHeaven {
            
            targetHeavenInt.append(heavenInvertInt(targetHeaven: element))
            
        }
        
        var pairIndex: [Int] = []
        
        for index in 0..<targetHeavenInt.count {
            
            for indexY in (index..<targetHeavenInt.count).reversed() where targetHeavenInt[index][0] + targetHeavenInt[indexY][0] == 9 {
                                    
                pairIndex.append(index)
                
                pairIndex.append(indexY)
                
            }
            
        }
        
        pairIndex.sort(by: >)
        
        var targetHeaven = organisedHeaven
        
        for element in pairIndex {
            
            targetHeaven.remove(at: element)
            
        }
        
        let result = targetHeaven.reduce([]) {$0 + $1}
        
        return result
        
    }
    
    func restEarthlyAfterMatchCalculate(targetEarthly: [String]) -> [String] {
            
        var targetEarthlyInt: [[Int]] = []
        
        let restEarthlyAfterBirthMatch = restElementAfterBirthEarthlyMatch(targetEarthly: targetEarthly)
        
        let organisedEarthly = restEarthlyArrangement(targetEarthly: restEarthlyAfterBirthMatch)
        
        for element in organisedEarthly {
            
            targetEarthlyInt.append(earthlyInvertInt(targetEarthly: element))
            
        }
        
        var pairIndex: [Int] = []
        
        for index in 0..<targetEarthlyInt.count {
            
            for indexY in (index..<targetEarthlyInt.count).reversed() where targetEarthlyInt[index][0] + targetEarthlyInt[indexY][0] == 11 {
                                    
                pairIndex.append(index)
                
                pairIndex.append(indexY)
                
            }
            
        }
        
        pairIndex.sort(by: >)
        
        var targetEarthly = organisedEarthly
        
        for element in pairIndex {
            
            targetEarthly.remove(at: element)
            
        }
        
        let result = targetEarthly.reduce([]) {$0 + $1}
        
        return result
        
    }

}
