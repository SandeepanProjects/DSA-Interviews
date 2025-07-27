//
//  Search in Rotated Sorted Array.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric    | Complexity |
| --------- | ---------- |
| **Time**  | `O(log n)` |
| **Space** | `O(1)`     |


func search(_ arr: [Int], _ key: Int) -> Int {
    var lo = 0
    var hi = arr.count - 1

    while lo <= hi {
        let mid = lo + (hi - lo) / 2

        if arr[mid] == key {
            return mid
        }

        // Left half is sorted
        if arr[mid] >= arr[lo] {
            if key >= arr[lo] && key < arr[mid] {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        // Right half is sorted
        else {
            if key > arr[mid] && key <= arr[hi] {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
    }

    return -1
}

// Example usage
let arr1 = [5, 6, 7, 8, 9, 10, 1, 2, 3]
let key1 = 3
print(search(arr1, key1))
