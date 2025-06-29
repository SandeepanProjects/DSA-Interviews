//
//  Stock Buy and Sell – Max 2 Transactions Allowed.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation
Using Dynamic Programming - O(n) Time and O(1) Space

Step by step approach:

Create two 2D arrays where dp[k][j] represents the maximum profit with k transactions remaining and j indicating buy/sell state.
Process the prices array from the last day to the first day, calculating maximum profit for each state.
For each day and transaction count, choose the better option between making a transaction or skipping it.
After processing each day, move current state to next state for the next iteration.
The final answer is curr[2][1], representing the maximum profit starting from day 0 with 2 transactions.

func maxProfit(_ prices: [Int]) -> Int {
    let n = prices.count
    if n == 0 { return 0 }

    var curr = Array(repeating: Array(repeating: 0, count: 2), count: 3)
    var next = Array(repeating: Array(repeating: 0, count: 2), count: 3)

    // Iterate from the last day to the first
    for i in (0..<n).reversed() {
        for k in 1...2 {
            // Buy state
            curr[k][1] = max(-prices[i] + next[k][0], next[k][1])

            // Sell state
            curr[k][0] = max(prices[i] + next[k - 1][1], next[k][0])
        }
        // Copy current state to next for next iteration
        next = curr.map { $0 }
    }

    return curr[2][1]
}

// Example usage
let prices = [10, 22, 5, 75, 65, 80]
print(maxProfit(prices)) // Output: 87
