//
//  Longest Common Subsequence.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Using Single Array - O(m*n) Time and O(n) Space

In this approach, the space complexity is further optimized by using a single DP array, where:
dp[j] represents the value of dp[i-1][j] (previous row's value) before updating. During the computation, dp[j] is updated to represent the current row value dp[i][j]
Now the recurrance relations become:

if the characters s1[i-1] and s2[j-1] match, dp[j] = 1+ prev. Here, prev is a temporary variable storing the diagonal value (dp[i-1][j-1]).
If the characters don't match, dp[j] = max(dp[j-1], dp[j]). Here dp[j] represents the value of dp[i-1][j] before updating and dp[j-1] represents the value of dp[i-1][j].
    
    
    Time & Space Complexity
    Time Complexity: O(m * n) — standard for LCS, comparing all character pairs.
    Space Complexity: O(n) — space optimized from O(m * n) to O(n).
    
    
func lcs(_ s1: String, _ s2: String) -> Int {
    let m = s1.count
    let n = s2.count
    
    let s1Array = Array(s1)
    let s2Array = Array(s2)
    
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 1...m {
        var prev = dp[0]
        for j in 1...n {
            let temp = dp[j]
            if s1Array[i - 1] == s2Array[j - 1] {
                dp[j] = 1 + prev
            } else {
                dp[j] = max(dp[j - 1], dp[j])
            }
            prev = temp
        }
    }
    
    return dp[n]
}

// Example usage
let s1 = "AGGTAB"
let s2 = "GXTXAYB"
let result = lcs(s1, s2)
print("Length of LCS is:", result)  // Output: 4
