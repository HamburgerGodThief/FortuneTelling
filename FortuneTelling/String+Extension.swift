//
//  String+Extension.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/28.
//  Copyright © 2020 Hamburger. All rights reserved.
//

extension String {

    var length: Int {
        
        return self.count
        
    }

    subscript (index: Int) -> String {
        
        return self[index ..< index + 1]
        
    }

    func substring(fromIndex: Int) -> String {
        
        return self[min(fromIndex, length) ..< length]
        
    }

    func substring(toIndex: Int) -> String {
        
        return self[0 ..< max(0, toIndex)]
        
    }
    
    func substring(fromIndex: Int, toIndex: Int) -> String {
        
        return self[min(fromIndex, length)..<toIndex]
        
    }

    subscript (range: Range<Int>) -> String {
        
        let range = Range(uncheckedBounds: (lower: max(0, min(length, range.lowerBound)), upper: min(length, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
        
    }
    
}
