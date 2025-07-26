//
//  Evaluate Reverse Polish Notation.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation
Time Complexity: O(N)
Space Complexity: O(1)

Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9


func eval(_ tokens: inout [String]) -> Int {
    var i = 0
    var lastNum = -1
    
    while i < tokens.count {
        if "/*+-".contains(tokens[i]) {
            let val1 = Int(tokens[lastNum - 1])!
            let val2 = Int(tokens[lastNum])!
            var ans = 0
            
            switch tokens[i] {
            case "*":
                ans = val1 * val2
            case "/":
                ans = val1 / val2
            case "+":
                ans = val1 + val2
            case "-":
                ans = val1 - val2
            default:
                break
            }
            
            tokens[lastNum - 1] = String(ans)
            lastNum -= 1
        } else {
            lastNum += 1
            tokens[lastNum] = tokens[i]
        }
        i += 1
    }
    return Int(tokens[lastNum])!
}

var tokens = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
let res = eval(&tokens)
print("Value of given expression '10 6 9 3 + -11 * / * 17 + 5 +' = \(res)")
