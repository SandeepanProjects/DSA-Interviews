//
//  Intersection of Two Sorted Arrays with Distinct Elements.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

Using Merge Step of Merge Sort - O(n+m) Time and O(1) Space

The idea is to find the intersection of two sorted arrays using merge step of merge sort. We maintain two pointers to traverse both arrays simultaneously.

If the element in first array is smaller, move the pointer of first array forward because this element cannot be part of the intersection.
If the element in second array is smaller, move the pointer of second array forward.
If both elements are equal, add one of them and move both the pointers forward.
This continues until one of the pointers reaches the end of its array.


func intersection(_ a: [Int], _ b: [Int]) -> [Int] {
    var res: [Int] = []
    
    var i = 0
    var j = 0
    
    // Simultaneous traversal
    while i < a.count && j < b.count {
        if a[i] < b[j] {
            i += 1
        } else if a[i] > b[j] {
            j += 1
        } else {
            res.append(a[i])
            i += 1
            j += 1
        }
    }
    
    return res
}

// Example usage
let a = [1, 2, 4, 5, 6]
let b = [2, 4, 7, 9]

let res = intersection(a, b)
for value in res {
    print(value, terminator: " ")
}
// Output: 2 4

