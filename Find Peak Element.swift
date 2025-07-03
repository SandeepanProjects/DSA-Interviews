//
//  Find Peak Element.swift
//  
//
//  Created by Apple on 03/07/25.
//

import Foundation

Using Binary Search - O(logn) Time and O(1) Space

If we observe carefully, we can say that:

If an element is smaller than it's next element then it is guaranteed that at least one peak element will exist on the right side of this element.
Conversely if an element is smaller than it's previous element then it is guaranteed that at least one peak element will exist on the left side of this element.

                Metric    Value
                Time    O(log n)
                Space    O(1)
                
func peakElement(_ arr: [Int]) -> Int? {
    let n = arr.count
    
    // If there is only one element
    if n == 1 {
        return 0
    }
    
    // Check if the first element is a peak
    if arr[0] > arr[1] {
        return 0
    }
    
    // Check if the last element is a peak
    if arr[n - 1] > arr[n - 2] {
        return n - 1
    }
    
    // Binary search between 1 and n - 2
    var lo = 1
    var hi = n - 2
    
    while lo <= hi {
        let mid = lo + (hi - lo) / 2
        
        if arr[mid] > arr[mid - 1] && arr[mid] > arr[mid + 1] {
            return mid
        } else if arr[mid] < arr[mid + 1] {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    
    // Shouldn't be reached for valid input
    return nil
}

// Example usage
let arr = [1, 2, 4, 5, 7, 8, 3]
if let peakIndex = peakElement(arr) {
    print("Peak at index \(peakIndex), value: \(arr[peakIndex])")
} else {
    print("No peak found.")
}
