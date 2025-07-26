//
//  Reverse Words in a String.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Using Two Pointer - O(n) Time and O(n) Space

Reverse the entire string, then iterate through it to extract words separated by dots. Reverse each word individually and update the original string until the end is reached. Refer to the figure to understand better...

func reverseWords(_ s: String) -> String {
    // Convert the entire string to a reversed array of characters
    var chars = Array(s.reversed())
    let n = chars.count
    var i = 0
    var result: [Character] = []
    var l = 0

    while l < n {
        if chars[l] != "." {
            // If not the first word, append a dot before the next word
            if i != 0 {
                result.append(".")
                i += 1
            }

            // Mark the end of the current word
            var r = l
            while r < n && chars[r] != "." {
                result.append(chars[r])
                i += 1
                r += 1
            }

            // Reverse the current word in result
            let wordStart = i - (r - l)
            result[wordStart..<i] = result[wordStart..<i].reversed()

            // Move to the next word
            l = r
        }
        l += 1
    }

    return String(result)
}

// Example usage
let s = "..geeks..for.geeks."
print(reverseWords(s)) // Output: "..geeks..for.geeks."

| Metric           | Complexity |
| ---------------- | ---------- |
| Time Complexity  | **O(n)**   |
| Space Complexity | **O(n)**   |
