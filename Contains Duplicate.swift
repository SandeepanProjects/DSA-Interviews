//
//  Contains Duplicate.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

By using HashSet Data Structure – O(n) Time and O(n) Space

import Foundation

func checkDuplicates(_ arr: [Int]) -> Bool {
    var seen = Set<Int>()  // Create a Set to store unique elements

    for num in arr {
        if seen.contains(num) {
            return true  // Duplicate found
        } else {
            seen.insert(num)
        }
    }

    return false  // No duplicates found
}

// Example usage
let arr = [4, 5, 6, 4]
print(checkDuplicates(arr))  // Output: true
