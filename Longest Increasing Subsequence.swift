//
//  Longest Increasing Subsequence.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

Time & Space Complexity:
Time Complexity: O(n log n) due to binary search in the ans list for each of the n elements.
Space Complexity: O(n) in the worst case (if the entire array is increasing).

func lengthOfLIS(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }

    var ans: [Int] = [arr[0]]

    for i in 1..<arr.count {
        if arr[i] > ans.last! {
            // Extend the LIS
            ans.append(arr[i])
        } else {
            // Binary search to find the first element >= arr[i]
            var low = 0
            var high = ans.count - 1

            while low < high {
                let mid = low + (high - low) / 2
                if ans[mid] < arr[i] {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
            // Replace the element to maintain sorted order
            ans[low] = arr[i]
        }
    }

    return ans.count
}

// Test case
let arr = [10, 22, 9, 33, 21, 50, 41, 60]
print("Length of LIS is", lengthOfLIS(arr))
