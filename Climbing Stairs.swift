//
//  Climbing Stairs.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

func countWays(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }

    var prev1 = 1
    var prev2 = 1

    for _ in 2...n {
        let curr = prev1 + prev2
        prev2 = prev1
        prev1 = curr
    }

    return prev1
}

// Example usage
let n = 4
print(countWays(n))
