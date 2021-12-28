//
//  TransformString.swift
//  SolvingProblems
//
//  Created by Snow Lukin on 28.12.2021.
//

import Foundation

/*
    The programm gets the following string:
 
        "ab2(3(c)d)"
 
    The answer should be:
 
        "abcccdcccd"
 
    String formatting rules:
        1. Digit in string is an amount of times the string inside the brackets repeated.
        2. There is always "(" after digit.
        3. Brackets always closed - It cant be "(" without following ")".
        4. Nestling not limited
*/

// The tasks says that only digits can be multiplier
// So i did not work on checking is there are two digits next to each other
func formatString(_ string: String) -> String {
    var string = string
    
    // check if its empty
    if string.isEmpty {
        return ""
    }
    
    // has to have same amount of digits, "(", ")"
    guard string.isAbleToFormat() else {
        print("Incorrect format. Please try again.")
        return ""
    }
    
    // if no brackets return the actual word
    let amountOfBrackets = string.elementCount(for: "(")
    if amountOfBrackets == 0 {
        return string
    }
    
    // indexes of Brackets
    let openBracketIndex = string.lastIndex(of: "(")!
    let closeBracketIndex = string[openBracketIndex..<string.endIndex].firstIndex(of: ")")!
    
    // digit before brackets
    let multiplierIndex = string.index(before: openBracketIndex)
    let multiplier = Int(String(string[multiplierIndex]))!
    
    // substring inside brackets
    let start = string.index(after: openBracketIndex)
    let end = string.index(before: closeBracketIndex)
    let tempWord = String(string[start...end])
    
    // removing original substring
    string.removeSubrange(multiplierIndex...closeBracketIndex)
    
    // inserting modified string
    let resultString = String(repeating: tempWord, count: multiplier)
    string.insert(contentsOf: resultString, at: multiplierIndex)
    
    
    
    return formatString(string)
}

extension String {
    
    var digits: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    func elementCount(for char: Character) -> Int {
        filter { $0 == char }.count
    }
    
    func isAbleToFormat() -> Bool {
        let openBrackets = elementCount(for: "(")
        let closeBrackets = elementCount(for: ")")
        let amountOfDigits = digits.count
        
        return openBrackets == closeBrackets && openBrackets == amountOfDigits
    }
}
