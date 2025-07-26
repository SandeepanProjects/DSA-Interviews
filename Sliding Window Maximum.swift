//
//  Sliding Window Maximum.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Sliding Window Maximum (Maximum of all subarrays of size K)

Input: arr[] = [1, 2, 3, 1, 4, 5, 2, 3, 6], k = 3
Output: [3, 3, 4, 5, 5, 5, 6]
Explanation:
1st contiguous subarray = [1 2 3] max = 3
2nd contiguous subarray = [2 3 1] max = 3
3rd contiguous subarray = [3 1 4] max = 4
4th contiguous subarray = [1 4 5] max = 5
5th contiguous subarray = [4 5 2] max = 5
6th contiguous subarray = [5 2 3] max = 5
7th contiguous subarray = [2 3 6] max = 6

| Metric           | Value  |
| ---------------- | ------ |
| Time Complexity  | `O(n)` |
| Space Complexity | `O(k)` |


// Function to find the maximum of each subarray of size k
func maxOfSubarrays(_ arr: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var deque = [Int]() // stores indices

    for i in 0..<arr.count {
        // Remove indices out of current window
        if !deque.isEmpty && deque[0] <= i - k {
            deque.removeFirst()
        }

        // Remove elements smaller than current from the back
        while !deque.isEmpty && arr[i] >= arr[deque.last!] {
            deque.removeLast()
        }

        // Add current index to deque
        deque.append(i)

        // Add current max to result once the first window is formed
        if i >= k - 1 {
            result.append(arr[deque[0]])
        }
    }

    return result
}

// Example usage
let arr = [1, 3, 2, 1, 7, 3]
let k = 3
let result = maxOfSubarrays(arr, k)
print(result.map { String($0) }.joined(separator: " "))
