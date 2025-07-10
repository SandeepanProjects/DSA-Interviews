//
//  Missing Number.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

1 - Using Sum of n terms Formula - O(n) Time and O(1) Space

The sum of the first n natural numbers is given by the formula (n * (n + 1)) / 2. The idea is to compute this sum and subtract the sum of all elements in the array from it to get the missing number.

func missingNum(_ arr: [Int]) -> Int {
    let n = arr.count + 1

    // Calculate the expected sum of 1 to n
    let expectedSum = n * (n + 1) / 2

    // Calculate the actual sum of the array
    let totalSum = arr.reduce(0, +)

    // Return the missing number
    return expectedSum - totalSum
}

// Test the function
let arr = [8, 2, 4, 5, 3, 7, 1]
print(missingNum(arr))  // Output: 6


2 - Using XOR Operation - O(n) Time and O(1) Space

 XOR of a number with itself is 0 i.e. x ^ x = 0 and the given array arr[] has numbers in range [1, n]. This means that the result of XOR of first n natural numbers with the XOR of all the array elements will be the missing number. To do so, calculate XOR of first n natural numbers and XOR of all the array arr[] elements, and then our result will be the XOR of both the resultant values.

func missingNum(_ arr: [Int]) -> Int {
    let n = arr.count + 1
    var xor1 = 0
    var xor2 = 0

    // XOR all elements in the array
    for num in arr {
        xor2 ^= num
    }

    // XOR all numbers from 1 to n
    for i in 1...n {
        xor1 ^= i
    }

    // The missing number is xor1 ^ xor2
    return xor1 ^ xor2
}

// Test the function
let arr = [8, 2, 4, 5, 3, 7, 1]
let res = missingNum(arr)
print(res)  // Output: 6
