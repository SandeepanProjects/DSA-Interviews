//
//  Adding one to number represented as array of digits.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

Time and Space Complexity:
Time Complexity: O(n) — In the worst case (all 9s), we traverse the whole array.
Space Complexity: O(1) — In-place operation except possibly one insertion at the front.


func addOne(_ arr: inout [Int]) -> [Int] {
    var index = arr.count - 1

    // Traverse from end and set 9s to 0
    while index >= 0 && arr[index] == 9 {
        arr[index] = 0
        index -= 1
    }

    if index < 0 {
        // All digits were 9
        arr.insert(1, at: 0)
    } else {
        arr[index] += 1
    }

    return arr
}

// Example usage
var arr = [9, 9, 9]
let result = addOne(&arr)
for digit in result {
    print(digit, terminator: "")
}
print()  // Output: 1000
