//
//  minimum edit distance.swift
//  
//
//  Created by Apple on 06/09/25.
//

import Foundation

| Metric | Complexity |
| ------ | ---------- |
| Time   | `O(m * n)` |
| Space  | `O(n)`     |


func editDistance(_ s1: String, _ s2: String) -> Int {
    let m = s1.count
    let n = s2.count

    let s1Array = Array(s1)
    let s2Array = Array(s2)

    var curr = [Int](repeating: 0, count: n + 1)

    for j in 0...n {
        curr[j] = j
    }

    for i in 1...m {
        var prev = curr[0]
        curr[0] = i
        for j in 1...n {
            let temp = curr[j]
            if s1Array[i - 1] == s2Array[j - 1] {
                curr[j] = prev
            } else {
                curr[j] = 1 + min(curr[j - 1], prev, curr[j])
            }
            prev = temp
        }
    }

    return curr[n]
}

// Example usage
let s1 = "abcd"
let s2 = "bcfe"

print(editDistance(s1, s2))
