//
//  Get K-th letter of the decoded string formed by repeating substrings.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Given a string S containing letter and digit and an integer K.The task is to return the K-th letter of the new string S'.
The new string S' is formed from old string S by following steps:
1. If the character read is a letter, that letter is added at end of S'.
2. If the character read is a digit, then entire string S' repeatedly written d-1 more times in total.
Note: The new string is guaranteed to have less than 2^63 letters.

Time Complexity: O(N), where N is the length of S.
Auxiliary Space: O(1) since constant space is being used


func kThLetter(_ S: String, _ K: Int) -> Character? {
    let chars = Array(S)
    var size = 0

    // First, calculate the size of the decoded string
    for c in chars {
        if c.isNumber {
            if let digit = c.wholeNumberValue {
                size *= digit
            }
        } else {
            size += 1
        }
    }

    var k = K
    // Traverse the string in reverse to find the K-th letter
    for i in stride(from: chars.count - 1, through: 0, by: -1) {
        let c = chars[i]
        k %= size

        if k == 0 && c.isLetter {
            return c
        }

        if c.isNumber {
            if let digit = c.wholeNumberValue {
                size /= digit
            }
        } else {
            size -= 1
        }
    }

    return nil
}

// Example usage
let S = "geeks2for2"
let K = 15

if let result = kThLetter(S, K) {
    print(result) // Output: 'r'
} else {
    print("Invalid K or S")
}
