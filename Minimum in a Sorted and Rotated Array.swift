//
//  Minimum in a Sorted and Rotated Array.swift
//  
//
//  Created by Apple on 03/07/25.
//

import Foundation

Binary Search - O(log n) Time and O(1) Space

We can optimize the minimum element searching by using Binary Search where we find the mid element and then decide whether to stop or to go to left half or right half:

If arr[mid] > arr[high], it means arr[low ... mid] is sorted and we need to search in the right half. So we change low = mid + 1.
If arr[mid] <= arr[high], it means arr[mid ... high] is sorted and we need to search in the left half. So we change high = mid. (Note: Current mid might be the minimum element).

func findMin(_ arr: [Int]) -> Int {
    var lo = 0
    var hi = arr.count - 1

    while lo < hi {
        // If subarray is already sorted, the smallest is at the beginning
        if arr[lo] < arr[hi] {
            return arr[lo]
        }

        let mid = (lo + hi) / 2

        // Minimum is in the unsorted right half
        if arr[mid] > arr[hi] {
            lo = mid + 1
        } else {
            // Minimum is in the left half (including mid)
            hi = mid
        }
    }

    return arr[lo]
}

// Example usage
let arr = [5, 6, 1, 2, 3, 4]
print(findMin(arr))  // Output: 1
