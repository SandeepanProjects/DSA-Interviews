//
//  House Robber.swift
//  
//
//  Created by Apple on 04/07/25.
//

import Foundation

Space-Optimized DP - O(n) Time and O(1) Space

On observing the dp[] array in the previous approach, it can be seen that the answer at the current index depends only on the last two values. In other words, dp[i] depends only on dp[i - 1] and dp[i - 2]. So, instead of storing the result in an array, we can simply use two variables to store the last and second last result.

Time Complexity: O(n), Every value is computed only once.
Auxiliary Space: O(1), as we are using only two variables.

func maxLoot(_ hval: [Int]) -> Int {
    let n = hval.count

    if n == 0 {
        return 0
    }
    if n == 1 {
        return hval[0]
    }

    var secondLast = 0
    var last = hval[0]
    var res = 0

    for i in 1..<n {
        res = max(hval[i] + secondLast, last)
        secondLast = last
        last = res
    }

    return res
}

// Example usage
let hval = [6, 7, 1, 3, 8, 2, 4]
print(maxLoot(hval))

