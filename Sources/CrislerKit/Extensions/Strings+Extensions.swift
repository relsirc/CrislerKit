//
//  File.swift
//  
//
//  Created by Crisler Chee on 2019/10/09.
//

import Foundation


extension NSRegularExpression {
    public func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}


extension String {
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    public var isKatakana: Bool {
        let range = "[ァ-・ヽヾ゛゜ー]"
        let regex = try! NSRegularExpression(pattern: range)
        return regex.matches(self)
    }
    
    public var isKanji: Bool {
        let range = "^[\u{3005}\u{3007}\u{303b}\u{3400}-\u{9fff}\u{f900}-\u{faff}\u{20000}-\u{2ffff}]+$"
        return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
    }
    
    public func removeComma() -> String {
        let tmp = self.replacingOccurrences(of: ",", with: "")
        return tmp
    }
    
    public func addComma() -> String {
        guard let number = Double(self) else {
            return ""
        }
        guard let formatedNumber = Double(String(format: "%.2f", number)) else { return "" }
        let num = NSNumber(value: formatedNumber)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        if let numStr = formatter.string(from: num) {
            return numStr
        }
        return ""
    }
        
    public func addCommaWithoutRounding() -> String {
        guard let number = Double(self) else {
            return ""
        }
        let num = NSNumber(value: number)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        if let numStr = formatter.string(from: num) {
            return numStr
        }
        return ""
    }
    
    public func addCommaForDouble() -> String {
        guard let number = Double(self) else {
            return ""
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.maximumFractionDigits = 2
        let lastStr = String(number).last
        let numberStr = String(number)
        if lastStr == "0" {
            if let numStr = formatter.string(from: NSNumber(value: number)) {
                return numStr + ".00"
            } else {
                return ""
            }
        } else if lastStr != "0" && numberStr[numberStr.index(numberStr.startIndex, offsetBy: numberStr.count - 2)] == "." {
            if let numStr = formatter.string(from: NSNumber(value: number)) {
                return numStr + "0"
            } else {
                return ""
            }
        } else {
            if let numStr = formatter.string(from: NSNumber(value: number)) {
                return numStr
            } else {
                return ""
            }
        }
    }
    
    public func roundOffDoubleToTheSecond(double: Double) -> String {
        let divisor = pow(10.0, Double(2))
        let toFormat = (double * divisor).rounded() / divisor
        return String(format: "%.2f", toFormat).addCommaForDouble()
    }
}
