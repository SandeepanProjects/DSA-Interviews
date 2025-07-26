//
//  Find All Duplicates in an Array.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Time Complexity
O(n) — We iterate over the array once.
Space Complexity
O(1) extra space — We use the input array to mark visited indices, so no extra data structures proportional to n are used.
The output array ans only stores duplicates, which in worst case can be up to O(n) but that is output space, often not counted in auxiliary space.

func findDuplicates(_ arr: inout [Int]) -> [Int] {
    var ans: [Int] = []
    
    for i in 0..<arr.count {
        let idx = abs(arr[i]) - 1  // Convert to 0-based index
        
        if arr[idx] < 0 {
            ans.append(abs(arr[i]))
        } else {
            arr[idx] = -arr[idx]  // Mark as visited
        }
    }
    
    return ans
}

// Example usage:
var arr = [2, 3, 1, 2, 3]
let duplicates = findDuplicates(&arr)
print(duplicates)  // Output: [2, 3]
