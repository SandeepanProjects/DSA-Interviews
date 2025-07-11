//
//  Number of 1 Bits.swift
//  
//
//  Created by Apple on 11/07/25.
//

import Foundation

Using Lookup table

This approach uses a lookup table to count the number of set bits (1s) in a number efficiently.

The program first initializes a table, BitsSetTable256[], where each entry at index i contains the number of set bits in the 8-bit binary representation of i. This is done by iterating through all numbers from 0 to 255 and calculating the set bits for each.

In the function countSetBits, the number is divided into 4 bytes (8 bits each), and the lookup table is used to quickly get the number of set bits for each byte. The result is the sum of the set bits in all 4 bytes, giving the total number of set bits in the integer.

This method is fast because it avoids looping through individual bits by using precomputed values stored in the lookup table. It is particularly useful when there are many set bits to count.

Time Complexity: O(1)
Auxiliary Space: O(1)

class BitCounter {
    var bitsSetTable256 = [Int](repeating: 0, count: 256)
    
    init() {
        initialize()
    }
    
    // Initialize the lookup table
    func initialize() {
        bitsSetTable256[0] = 0
        for i in 1..<256 {
            bitsSetTable256[i] = (i & 1) + bitsSetTable256[i >> 1]
        }
    }
    
    // Function to return the count of set bits in a 32-bit integer
    func countSetBits(_ n: UInt32) -> Int {
        return bitsSetTable256[Int(n & 0xff)] +
        bitsSetTable256[Int((n >> 8) & 0xff)] +
        bitsSetTable256[Int((n >> 16) & 0xff)] +
        bitsSetTable256[Int((n >> 24) & 0xff)]
    }
}

// Usage
let counter = BitCounter()
let n: UInt32 = 9
print(counter.countSetBits(n)) // Output: 2


