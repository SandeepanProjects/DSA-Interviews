//
//  Maximum profit after buying and selling the stocks with transaction fees .swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

To optimize the above approach, the idea is to use Dynamic Programming. For each day, maintain the maximum profit, if stocks are bought on that day (buy) and the maximum profit if all stocks are sold on that day (sell). For each day, update buy and sell using the following relations:

buy = max(sell - arr[i], buy)
sell = max(buy +arr[i] - transactionFee, sell)

Time Complexity: O(N)
Auxiliary Space: O(1)

func maxProfitWithFee(_ prices: [Int], _ transactionFee: Int) -> Int {
    let n = prices.count
    if n == 0 { return 0 }

    var buy = -prices[0]
    var sell = 0

    // Traverse prices from day 1
    for i in 1..<n {
        let temp = buy

        // Update buy and sell
        buy = max(buy, sell - prices[i])
        sell = max(sell, temp + prices[i] - transactionFee)
    }

    // Return the maximum profit
    return max(sell, buy)
}

// Example usage
let prices = [6, 1, 7, 2, 8, 4]
let transactionFee = 2
print(maxProfitWithFee(prices, transactionFee)) // Output: 7
