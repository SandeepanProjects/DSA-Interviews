//
//  Nth row in Pascal's Triangle.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

Using Combinatorics - O(n) Time and O(n) Space

The idea is to use the mathematical relationship between consecutive elements in a Pascal's Triangle row, rather than computing the entire triangle. Since the nth row consists of binomial coefficients nC0, nC1, ..., nCn, we can calculate each element directly from the previous one using the formula: nCr = (nCr-1 * (n-r+1))/r. This approach starts with nC0 = 1 and efficiently computes each subsequent value


func nthRowOfPascalTriangle(_ n: Int) -> [Int] {
    var res: [Int] = []

    // Adjust for 0-based indexing (like Python version)
    let n = n - 1

    var prev = 1
    res.append(prev)

    for i in 1...n {
        // nCr = nCr-1 * (n - r + 1) / r
        let curr = (prev * (n - i + 1)) / i
        res.append(curr)
        prev = curr
    }

    return res
}

// Example usage
let n = 4
let row = nthRowOfPascalTriangle(n)
for val in row {
    print(val, terminator: " ")
}
print()
