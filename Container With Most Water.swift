//
//  Container With Most Water.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Using Two Pointers - O(n) Time and O(1) Space

The idea is to maintain two pointers: left pointer at the beginning of the array and right pointer at the end of the array. These pointers act as the container's sides so we can calculate the amount of water stored between them using the formula: min(arr[left], arr[right]) * (right - left).

After calculating the amount of water for the given sides, we can have three cases:

arr[left] < arr[right]: This means that we have calculated the water stored for the container of height arr[left], so increment left by 1.
arr[left] >= arr[right]: This means that we have calculated the water stored for the container of height arr[right], so decrement right by 1.
                                            
Time Complexity: O(n)
Auxiliary Space: O(1)
                                            
import Foundation
                                            
func maxWater(_ arr: [Int]) -> Int {
    var left = 0
    var right = arr.count - 1
    var result = 0
    
    while left < right {
        let height = min(arr[left], arr[right])
        let width = right - left
        let water = height * width
        result = max(result, water)
        
        // Move the pointer pointing to the shorter line
        if arr[left] < arr[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return result
}

// Example usage
let arr = [2, 1, 8, 6, 4, 6, 5, 5]
print(maxWater(arr))  // Output: 30
