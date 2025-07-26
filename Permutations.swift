//
//  Permutations.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation
ABC ACB BAC BCA CAB CBA

| Metric           | Complexity                           |
| ---------------- | ------------------------------------ |
| Time Complexity  | `O(n × n!)`                          |
| Space Complexity | `O(n! × n)` total (including output) |
| Recursion Stack  | `O(n)`                               |


// Function to generate all permutations
func findPermutations(_ s: String) -> [String] {
    var chars = Array(s)           // Convert string to array of characters
    var result = [String]()        // Store final permutations

    func recurPermute(_ index: Int) {
        // Base Case: if full permutation is formed
        if index == chars.count {
            result.append(String(chars))
            return
        }

        // Try every character at the current position
        for i in index..<chars.count {
            chars.swapAt(index, i)        // Swap
            recurPermute(index + 1)       // Recurse
            chars.swapAt(index, i)        // Backtrack
        }
    }

    recurPermute(0)
    result.sort()
    return result
}

// Example usage
let s = "ABC"
let permutations = findPermutations(s)
for p in permutations {
    print(p, terminator: " ")
}
