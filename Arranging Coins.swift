//
//  Arranging Coins.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

/*
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

 Given n, find the total number of full staircase rows that can be formed.

 n is a non-negative integer and fits within the range of a 32-bit signed integer.
 
 Reference: https://leetcode.com/problems/arranging-coins/
 */

Time and Space Complexity:
Time Complexity: O(log n)
Binary search reduces the range each iteration.
Space Complexity: O(1)
Uses constant space.


func arrangeCoins(_ n: Int) -> Int {
    var start = 0
    var end = n
    var result = -1
    while start <= end {
        let mid = start + (end - start)/2
        if (mid*(mid+1))/2 == n {
            result = mid
            break
        }
        if (mid*(mid+1))/2 < n {
            start = mid + 1
            result = mid
        }else {
            end = mid - 1
        }
    }
    return result
}
