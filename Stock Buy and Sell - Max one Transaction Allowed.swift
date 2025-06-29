//
//  Stock Buy and Sell - Max one Transaction Allowed.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

One Traversal Solution - O(n) Time and O(1) Space

In order to maximize the profit, we need to minimize the cost price and maximize the selling price. So at every step, we keep track of the minimum buy price of stock encountered so far. For every price, we subtract with the minimum so far and if we get more profit than the current result, we update the result.

func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }

    var minSoFar = prices[0]
    var result = 0

    for i in 1..<prices.count {
        minSoFar = min(minSoFar, prices[i])
        result = max(result, prices[i] - minSoFar)
    }

    return result
}

// Example usage
let prices = [7, 10, 1, 3, 6, 9, 2]
print(maxProfit(prices))
