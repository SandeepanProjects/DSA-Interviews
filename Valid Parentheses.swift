//
//  Valid Parentheses.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Time Complexity:
O(n), where n is the length of the string.
Each character is pushed or popped from the stack at most once.
💾 Space Complexity:
O(n) in the worst case.
In the case of no matching pairs, all characters are pushed onto the stack.

// Function to check if characters match
func checkMatch(_ c1: Character, _ c2: Character) -> Bool {
    return (c1 == "(" && c2 == ")") ||
           (c1 == "[" && c2 == "]") ||
           (c1 == "{" && c2 == "}")
}

// Function to check if parentheses are balanced
func isBalanced(_ s: String) -> Bool {
    var stack = [Character]()  // simulate stack with array
    
    for ch in s {
        if let last = stack.last, checkMatch(last, ch) {
            stack.removeLast() // pop if match found
        } else {
            stack.append(ch)   // push otherwise
        }
    }
    
    return stack.isEmpty
}

// Example usage
let s = "{([])}"
print(isBalanced(s) ? "true" : "false")
