//
//  Longest Substring Without Repeating Characters.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Using Last Index of Each Character - O(n) Time and O(1) Space

The approach stores the last indexes of already visited characters. The idea is to maintain a window of distinct characters. Start from the first character, and keep extending the window on the right side till we see distinct characters. When we see a repeating character, we check for the last index of the repeated character:

If last index of repeated character >= starting index of the current window, then we update the starting index of the current window to last index of repeated character + 1 to remove the repeated character.
If last index of repeated character < starting index of the current window, then it means that the repeated character is already outside the current window so the window size remains unchanged.

func longestUniqueSubstr(_ s: String) -> Int {
    let n = s.count
    if n == 0 { return 0 }
    
    let chars = Array(s)
    var lastIndex = Array(repeating: -1, count: 26)  // For 'a' to 'z'
    
    var start = 0
    var res = 0
    
    for end in 0..<n {
        let charPos = Int(chars[end].asciiValue! - Character("a").asciiValue!)
        
        // Update start to avoid repeating characters
        start = max(start, lastIndex[charPos] + 1)
        
        // Update result with max length so far
        res = max(res, end - start + 1)
        
        // Update last seen index of current character
        lastIndex[charPos] = end
    }
    
    return res
}

// Example usage
let s = "geeksforgeeks"
print(longestUniqueSubstr(s))  // Output: 7 (e.g., "eksforg")

