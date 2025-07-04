//
//  Smallest Missing Positive Number.swift
//  
//
//  Created by Apple on 04/07/25.
//

import Foundation

By Marking Indices – O(n) Time and O(1) Space

The idea is to first check if 1 is present in the array or not. If not, the answer is 1. Otherwise, replace all the numbers outside the range [1, n] to 1. Then, iterate over the array again and mark the occurrences of each number, say x by adding n to index x - 1.Lastly, iterate over the array again to find the missing element by searching for the first unmarked index.
                                
func missingNumber(_ arr: inout [Int]) -> Int {
    let n = arr.count
    var flag = false
    
    // Check if 1 is present
    for i in 0..<n {
        if arr[i] == 1 {
            flag = true
            break
        }
    }
    
    // If 1 is not present
    if !flag {
        return 1
    }
    
    // Replace values <= 0 or > n with 1
    for i in 0..<n {
        if arr[i] <= 0 || arr[i] > n {
            arr[i] = 1
        }
    }
    
    // Use array elements as indices and mark presence
    for i in 0..<n {
        let index = (arr[i] - 1) % n
        arr[index] += n
    }
    
    // Find the first index with value <= n
    for i in 0..<n {
        if arr[i] <= n {
            return i + 1
        }
    }
    
    // All numbers from 1 to n are present
    return n + 1
}

// Example usage:
var arr = [2, -3, 4, 1, 1, 7]
print(missingNumber(&arr))  // Output: 3

