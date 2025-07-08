//
//  Intersection of Two Arrays.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

Using One Hash Set - O(n+m) Time and O(n) Space

We can optimize the above approach by avoiding creation of rs hash set. To make sure that duplicates are not added, we simply delete items from as (Set of a[] elements) rather than checking with rs.

func intersect(_ a: [Int], _ b: [Int]) -> [Int] {
    var sa = Set(a)  // Convert array 'a' to a set
    var res: [Int] = []

    for elem in b {
        if sa.contains(elem) {
            res.append(elem)
            sa.remove(elem)  // Remove to avoid duplicates
        }
    }

    return res
}

// Example usage
let a = [1, 2, 3, 2, 1]
let b = [3, 2, 2, 3, 3, 2]

let res = intersect(a, b)
print(res.map { String($0) }.joined(separator: " "))  // Output: 3 2

