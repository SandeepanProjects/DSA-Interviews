//
//  Stock Buy and Sell - At-most k Transactions Allowed.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Space Optimized - O(n*k) time and O(k) space

Since for any day i, the calculations for dp[i][l][buy] only depend on dp[i+1][][] (the next day), we don’t need to store results for all previous days. Instead, we can reduce the DP table to just two 2D arrays:

curr[l][buy] → Represents the profit on the current day for l transactions remaining and whether we are in a buy or sell state.
next[l][buy] → Represents the profit for the next day.
This iterative approach optimizes space complexity, reducing it from O(k * n) to O(k) by only storing results for the current and next day instead of maintaining a full k × n DP table.

Optimized Recurrence Relation:

Buy state: curr[l][1] = max(-prices[i] + next[l][0], next[l][1])
Sell state: curr[l][0] = max(prices[i] + next[l-1][1], next[l][0])
            
func maxProfit(_ prices: [Int], _ k: Int) -> Int {
    let n = prices.count
    if n == 0 || k == 0 { return 0 }
    
    var curr = Array(repeating: Array(repeating: 0, count: 2), count: k + 1)
    var next = Array(repeating: Array(repeating: 0, count: 2), count: k + 1)
    
    // Iterate from last day to first
    for i in (0..<n).reversed() {
        for l in 1...k {
            // Buy state
            curr[l][1] = max(-prices[i] + next[l][0], next[l][1])
            
            // Sell state
            curr[l][0] = max(prices[i] + next[l - 1][1], next[l][0])
        }
        // Move curr to next for next iteration
        next = curr.map { $0 }
    }
    
    // Result is the max profit from day 0, with k transactions, in buy state
    return curr[k][1]
}

// Example usage
let k = 2
let prices = [10, 22, 5, 80]
print(maxProfit(prices, k)) // Output: 87

