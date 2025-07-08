//
//  Minimum Jumps to Reach End.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

Using Greedy Approach - O(n) Time and O(1) Space

The idea is to use greedy approach to find the minimum jumps needed to reach the end of an array. We iterate through the array and maintain two values: the maximum reachable index and the current reachable index and update them based on the array elements.


Follow the steps below to solve the problem:

Initialize the variables maxReach = 0, currReach = 0, and jump = 0 to keep track of the maximum reachable index, the current reachable index at the ith position, and the number of jumps taken to reach the current reachable index, respectively.
Traverse the array and update the maximum reachable index based on the sum of the current index and its corresponding array value. This helps determine how far the current jump can take us.
If the current index is equal to the current reachable index, then a jump is required. We choose our jump in such a way that it takes us to the maximum possible index. Increment jump by 1 and update currReach to maxReach.
If the current index is equal to the maximum reachable index, it indicates that we cannot move beyond this point, so return -1.

func minJumps(_ arr: [Int]) -> Int {
    let n = arr.count

    // If first element is 0, it's not possible to jump anywhere
    if n == 0 || arr[0] == 0 {
        return -1
    }

    var maxReach = 0
    var currReach = 0
    var jumps = 0

    for i in 0..<n {
        maxReach = max(maxReach, i + arr[i])

        // If we can reach the end from here, return jumps + 1
        if maxReach >= n - 1 {
            return jumps + 1
        }

        // If we've reached the end of the current reachable range,
        // we need to make another jump
        if i == currReach {
            // If current position is the furthest we can reach, we’re stuck
            if i == maxReach {
                return -1
            }
            jumps += 1
            currReach = maxReach
        }
    }

    return -1
}

// Example usage
let arr = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
print(minJumps(arr))  // Output: 3

