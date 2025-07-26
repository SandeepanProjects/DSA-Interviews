//
//  Rotate Array.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Using Reversal Algorithm - O(n) Time and O(1) Space

The idea is based on the observation that if we left rotate the array by d positions, the last (n - d) elements will be at the front and the first d elements will be at the end.

Reverse the subarray containing the first d elements of the array.
Reverse the subarray containing the last (n - d) elements of the array.
Finally, reverse all the elements of the array.
                                                
| Metric           | Complexity |
| ---------------- | ---------- |
| Time Complexity  | **O(n)**   |
| Space Complexity | **O(1)**   |

                                                
func rotateArr(_ arr: inout [Int], _ d: Int) {
    let n = arr.count
    if n == 0 { return }
    
    let d = d % n  // Handle case where d > n
    
    // Reverse first d elements
    reverse(&arr, 0, d - 1)
    
    // Reverse the remaining n - d elements
    reverse(&arr, d, n - 1)
    
    // Reverse the entire array
    reverse(&arr, 0, n - 1)
}

func reverse(_ arr: inout [Int], _ start: Int, _ end: Int) {
    var start = start
    var end = end
    while start < end {
        arr.swapAt(start, end)
        start += 1
        end -= 1
    }
}

// Example usage
var arr = [1, 2, 3, 4, 5, 6]
let d = 2

rotateArr(&arr, d)

for val in arr {
    print(val, terminator: " ")
}

