//
//  Longest Repeating Substring.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation


Time    O(n²)
Space    O(n)


func longestSubstring(_ s: String) -> String {
    let n = s.count
    if n == 0 { return "-1" }
    
    let chars = Array(s)
    var dp = Array(repeating: 0, count: n + 1)
    
    var ans = ""
    var ansLen = 0
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        for j in i..<n {
            if chars[i] == chars[j] {
                // dp[j + 1] safely accessed because dp size is n + 1
                dp[j] = 1 + min(dp[j + 1], j - i - 1)
                
                if dp[j] >= ansLen {
                    ansLen = dp[j]
                    let startIdx = s.index(s.startIndex, offsetBy: i)
                    let endIdx = s.index(startIdx, offsetBy: ansLen)
                    ans = String(s[startIdx..<endIdx])
                }
            } else {
                dp[j] = 0
            }
        }
    }
    
    return ansLen > 0 ? ans : "-1"
}

// Example usage
let s = "geeksforgeeks"
print(longestSubstring(s))  // Output: "geeks"
