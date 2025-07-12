//
//  Product of Array Except Self.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

| Complexity | Value |
| ---------- | ----- |
| Time       | O(n)  |
| Space      | O(n)  |

Using Product Array

The idea is to handle two special cases of the input array: when it contains zero(s) and when it doesn't.

If the array has no zeros, product of array at any index (excluding itself) can be calculated by dividing the total product of all elements by the current element.

However, division by zero is undefined, so if there are zeros in the array, the logic changes. If there is exactly one zero, the product for that index will be the product of all other non-zero elements, while the elements in rest of the indices will be zero.
If there are more than one zero, the product for all indices will be zero, since multiplying by zero results in zero.
                                                
func productExceptSelf(_ arr: [Int]) -> [Int] {
    var zeros = 0
    var idx = -1
    var prod = 1

    // Count zeros and track the index of the zero
    for i in 0..<arr.count {
        if arr[i] == 0 {
            zeros += 1
            idx = i
        } else {
            prod *= arr[i]
        }
    }

    var res = [Int](repeating: 0, count: arr.count)

    if zeros == 0 {
        // No zeros: product for each element is total product divided by that element
        for i in 0..<arr.count {
            res[i] = prod / arr[i]
        }
    } else if zeros == 1 {
        // Exactly one zero: only index of zero has product equal to product of other elements
        res[idx] = prod
    }
    // If more than one zero, all elements remain zero (default initialized)

    return res
}

// Example usage:
let arr = [10, 3, 5, 6, 2]
let result = productExceptSelf(arr)
print(result.map { String($0) }.joined(separator: " "))
