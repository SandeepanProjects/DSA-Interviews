//
//  Maximum Subarray.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Using Kadane's Algorithm - O(n) Time and O(1) Space

The idea of Kadane's algorithm is to traverse over the array from left to right and for each element, find the maximum sum among all subarrays ending at that element. The result will be the maximum of all these values.
To calculate the maximum sum of subarray ending at current element, say maxEnding, we can use the maximum sum ending at the previous element.

So for any element, we have two choices:

Choice 1: Extend the maximum sum subarray ending at the previous element by adding the current element to it. If the maximum subarray sum ending at the previous index is positive, then it is always better to extend the subarray.

Choice 2: Start a new subarray starting from the current element. If the maximum subarray sum ending at the previous index is negative, it is always better to start a new subarray from the current element.
                                                                                            
func maxSubarraySum(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    
    var res = arr[0]       // Maximum sum found so far
    var maxEnding = arr[0] // Maximum sum ending at current position
    
    for i in 1..<arr.count {
        maxEnding = max(maxEnding + arr[i], arr[i]) // Extend or start new subarray
        res = max(res, maxEnding)                   // Update result if needed
    }
    
    return res
}

// Test the function
let arr = [2, 3, -8, 7, -1, 2, 3]
print(maxSubarraySum(arr)) // Output: 11
