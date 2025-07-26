//
//  Generate Parenthese.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Using BackTracking
| Metric                        | Complexity          |
| ----------------------------- | ------------------- |
| **Time Complexity**           | `O(4^n / √n)`       |
| **Auxiliary Space**           | `O(n)` (call stack) |
| **Total Space (with result)** | `O(4^n / √n * n)`   |


func generateParentheses(_ n: Int) -> [String] {
    var res = [String]()
    
    // Start recursion with 0 open and 0 close parentheses
    func backtrack(openCount: Int, closeCount: Int, curr: String) {
        // If the current sequence has reached the length of 2 * n, it's valid
        if curr.count == 2 * n {
            res.append(curr)
            return
        }

        // Add opening parenthesis if we haven't used all n opening parentheses
        if openCount < n {
            backtrack(openCount: openCount + 1, closeCount: closeCount, curr: curr + "(")
        }

        // Add closing parenthesis if we can close one
        if closeCount < openCount {
            backtrack(openCount: openCount, closeCount: closeCount + 1, curr: curr + ")")
        }
    }

    backtrack(openCount: 0, closeCount: 0, curr: "")
    return res
}

// Example usage
let n = 2 // number of pairs
let result = generateParentheses(n)
for seq in result {
    print(seq)
}

