//
//  Median of Two Sorted Arrays.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Using Binary Search - O(log(min(n, m)) Time and O(1) Space

Prerequisite: Median of two sorted arrays of same size

The approach is similar to the Binary Search approach of Median of two sorted arrays of same size with the only difference that here we apply binary search on the smaller array instead of a[].

Consider the first array is smaller. If first array is greater, then swap the arrays to make sure that the first array is smaller.
We mainly maintain two sets in this algorithm by doing binary search in the smaller array. Let mid1 be the partition of the smaller array. The first set contains elements from 0 to (mid1 - 1) from smaller array and mid2 = ((n + m + 1) / 2 - mid1) elements from the greater array to make sure that the first set has exactly (n+m+1)/2 elements. The second set contains remaining half elements.
Our target is to find a point in both arrays such that all elements in the first set are smaller than all elements in the elements in the other set (set that contains elements from right side). For this we validate the partitions using the same way as we did in Median of two sorted arrays of same size.
                        
Applying Binary Search on the smaller array helps us in two ways:
                            
Since we are applying binary search on the smaller array, we have optimized the time complexity of the algorithm from O(logn) to O(log(min(n, m)).
Also, if we don't apply the binary search on the smaller array, then then we need to set low = max(0, (n + m + 1)/2 - m) and high = min(n, (n + m + 1)/2) to avoid partitioning mid1 or mid2 outside a[] or b[] respectively.


func medianOf2(_ a: [Int], _ b: [Int]) -> Double {
    let n = a.count
    let m = b.count
    
    // Ensure the first array is the smaller one
    if n > m {
        return medianOf2(b, a)
    }
    
    var lo = 0
    var hi = n
    
    while lo <= hi {
        let mid1 = (lo + hi) / 2
        let mid2 = (n + m + 1) / 2 - mid1
        
        let l1 = (mid1 == 0) ? Int.min : a[mid1 - 1]
        let r1 = (mid1 == n) ? Int.max : a[mid1]
        
        let l2 = (mid2 == 0) ? Int.min : b[mid2 - 1]
        let r2 = (mid2 == m) ? Int.max : b[mid2]
        
        if l1 <= r2 && l2 <= r1 {
            if (n + m) % 2 == 0 {
                return Double(max(l1, l2) + min(r1, r2)) / 2.0
            } else {
                return Double(max(l1, l2))
            }
        } else if l1 > r2 {
            hi = mid1 - 1
        } else {
            lo = mid1 + 1
        }
    }
    
    return 0.0 // Should never reach here if inputs are valid
}
                                                                                                                                   
// Test the function
let a = [1, 12, 15, 26, 38]
let b = [2, 13, 17, 30, 45, 60]
                                                                                                                                   
print(medianOf2(a, b)) // Output: 16.0
