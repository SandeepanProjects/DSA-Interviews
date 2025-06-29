//
//  Pythagorean Triplet in an array.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation


Metric    Complexity
Time Complexity    O(n²)
Space Complexity    O(n) (for storing squared values)


class Solution {
    func hasPythagoreanTriplet(_ nums: [Int]) -> Bool {
        // Square and sort the array
        let squared = nums.map { $0 * $0 }.sorted()

        // Start from the largest square (consider it as c^2)
        for c in stride(from: squared.count - 1, through: 2, by: -1) {
            var left = 0
            var right = c - 1

            while left < right {
                let sum = squared[left] + squared[right]
                if sum == squared[c] {
                    // Found a^2 + b^2 = c^2
                    return true
                } else if sum < squared[c] {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return false
    }
}


let solution = Solution()
let nums = [3, 1, 4, 6, 5]
print(solution.hasPythagoreanTriplet(nums)) // Output: true (3² + 4² = 5²)


