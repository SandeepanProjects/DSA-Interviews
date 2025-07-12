//
//  K-th Permutation Sequence of first N natural numbers.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

Using Combinatorics

Time and Space Complexity:
Time Complexity: O(n²)
Because remove(at:) in Swift arrays is O(n), and it's called n times.
Space Complexity: O(n)
Due to the recursion depth and the list of remaining numbers.

// Precomputed factorials (0! to 9!)
let fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

// Recursive function to build the k-th permutation
func permutation(_ n: Int, _ k: Int, _ nums: inout [Int], _ result: inout String) {
    if n == 0 {
        return
    }

    if k <= 1 || k <= fact[n - 1] {
        let val = (k == 0) ? nums.last! : nums.first!
        result += String(val)
        nums.removeAll { $0 == val }
    } else {
        var index = k / fact[n - 1]
        var newK = k % fact[n - 1]

        if newK == 0 {
            index -= 1
        }

        let val = nums[index]
        result += String(val)
        nums.remove(at: index)

        permutation(n - 1, newK, &nums, &result)
        return
    }

    permutation(n - 1, k, &nums, &result)
}

// Main function
func getPermutation(_ n: Int, _ k: Int) -> String {
    var nums = Array(1...n)
    var result = ""
    permutation(n, k, &nums, &result)
    return result
}

// Example usage
let n = 3
let k = 4
let kthPermutation = getPermutation(n, k)
print(kthPermutation) // Output: "231"
