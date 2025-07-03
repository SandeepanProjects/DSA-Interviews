//
//  Find Excel column number from column title.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Time Complexity: O(n), where n is length of input string.
Space Complexity: O(1).
As no extra space is required.

func titleToNumber(_ s: String) -> Int {
    var result = 0
    for char in s {
        // Convert character to its alphabetical position: A=1, B=2, ..., Z=26
        if let asciiValue = char.asciiValue {
            result = result * 26 + Int(asciiValue) - Int(Character("A").asciiValue!) + 1
        }
    }
    return result
}

// Example usage:
let columnTitle = "CDA"
print(titleToNumber(columnTitle))  // Output: 2111
