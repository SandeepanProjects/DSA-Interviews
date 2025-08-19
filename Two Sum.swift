//
//  Two Sum.swift
//  
//
//  Created by Apple on 19/08/25.
//

import Foundation

O(n) time and O(n) space

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numToIndex = [Int: Int]() // Dictionary to store number -> index

    for (index, num) in nums.enumerated() {
        let complement = target - num

        if let complementIndex = numToIndex[complement] {
            return [complementIndex, index]
        }

        // Store current number with its index
        numToIndex[num] = index
    }

    return []
}
