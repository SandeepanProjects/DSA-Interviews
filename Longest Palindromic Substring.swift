//
//  Longest Palindromic Substring.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Metric    Complexity
Time    O(n²)
Space    O(n)

func longestPalindrome(_ s: String) -> String {
    let n = s.count
    if n == 0 {
        return ""
    }
    
    let chars = Array(s)
    var start = 0
    var maxLen = 1
    
    for i in 0..<n {
        for j in 0...1 { // j = 0 for odd length, j = 1 for even length
            var low = i
            var high = i + j
            
            while low >= 0 && high < n && chars[low] == chars[high] {
                let currLen = high - low + 1
                if currLen > maxLen {
                    start = low
                    maxLen = currLen
                }
                low -= 1
                high += 1
            }
        }
    }
    
    let startIndex = s.index(s.startIndex, offsetBy: start)
    let endIndex = s.index(startIndex, offsetBy: maxLen)
    return String(s[startIndex..<endIndex])
}

// Example usage
let s = "forgeeksskeegfor"
print(longestPalindrome(s))  // Output: "geeksskeeg"
