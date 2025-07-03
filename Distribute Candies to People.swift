//
//  Distribute Candies to People.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Given N candies and K people. In the first turn, the first person gets 1 candy, the second gets 2 candies, and so on till K people. In the next turn, the first person gets K+1 candies, the second person gets k+2 candies, and so on. If the number of candies is less than the required number of candies at every turn, then the person receives the remaining number of candies.

Use binary search to find the maximum number of complete turns, then distribute leftover candies from the last incomplete turn using a loop. Finally, apply the arithmetic progression formula to efficiently allocate candies for complete turns.

Using the binary search - O(logn + K) Time + O(K) Space

func distributeCandies(_ n: Int, _ k: Int) -> [Int] {
    var n = n
    var count = 0
    var low = 0
    var high = n
    var arr = Array(repeating: 0, count: k)
    
    // Binary search to find how many terms we can use without exceeding total candies
    while low <= high {
        let mid = (low + high) >> 1
        let sum = (mid * (mid + 1)) >> 1
        
        if sum <= n {
            count = mid / k
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    // Last term used in complete rounds
    let last = count * k
    n -= (last * (last + 1)) / 2
    
    var i = 0
    var term = last + 1
    
    // Distribute leftover candies after complete rounds
    while n > 0 {
        if term <= n {
            arr[i] = term
            n -= term
            term += 1
        } else {
            arr[i] += n
            n = 0
        }
        i += 1
    }
    
    // Add the candies from complete rounds
    for i in 0..<k {
        arr[i] += (count * (i + 1)) + (k * count * (count - 1)) / 2
    }
    
    return arr
}

// Example usage
let n = 10
let k = 3
let result = distributeCandies(n, k)

for candy in result {
    print(candy, terminator: " ")
}
