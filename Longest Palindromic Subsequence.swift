//
//  Longest Palindromic Subsequence.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Using Tabulation - O(n^2) Time and O(n) Space

In the above approach, for calculating the LPS of substrings starting from index i, only the LPS of substrings starting from index i+1 are required. Thus instead of creating 2d array, idea is to create two arrays of size, curr[] and prev[], where curr[j] stores the lps of substring from s[i] to s[j], while prev[j] stores the lps of substring from s[i+1] to s[j]. Else everything will be similar to above approach.


func longestPalinSubseq(_ s: String) -> Int {
    
    let n = s.count
    let chars = Array(s)
    
    var prev = Array(repeating: 0, count: n)
    var curr = Array(repeating: 0, count: n)
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        curr[i] = 1  // Single characters are palindromes of length 1
        
        for j in (i + 1)..<n {
            if chars[i] == chars[j] {
                curr[j] = (j > i + 1 ? prev[j - 1] : 0) + 2
            } else {
                curr[j] = max(prev[j], curr[j - 1])
            }
        }
        
        prev = curr
    }
    
    return curr[n - 1]
}

// Example usage
let s = "bbabcbcab"
let result = longestPalinSubseq(s)
print("Length of Longest Palindromic Subsequence is:", result)  // Output: 7

