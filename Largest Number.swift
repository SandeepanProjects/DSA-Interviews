//
//  Largest Number.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation
Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.

Since the result may be very large, so you need to return a string instead of an integer.

 

Example 1:

Input: nums = [10,2]
Output: "210"

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let strings = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
        if nums.reduce(into: Bool(false), { $0 = $0 || $1 > 0 }) {
            return strings.joined()
        } else {
            return "0"
        }
    }
}
