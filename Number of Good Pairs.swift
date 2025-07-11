//
//  Number of Good Pairs.swift
//  
//
//  Created by Apple on 11/07/25.
//

import Foundation

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        nums.forEach { (num) in
            if let number = map[num] {
                map[num] = number + 1
            } else {
                map[num] = 1
            }
        }
        
        var sum = 0
        
        for value in map.values {
            sum += value * (value - 1) / 2
        }
        
        return sum
    }
}
