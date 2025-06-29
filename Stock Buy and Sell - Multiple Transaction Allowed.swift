//
//  Stock Buy and Sell - Multiple Transaction Allowed.swift
//  
//
//  Created by Apple on 29/06/25.
//

Accumulate Profit - O(n) Time and O(1) Space

This is mainly an optimization over the previous solution. Instead of selling at local maxima, we keep selling while the prices are going up. This way we accumulate the same profit and avoid some condition checks required for computing local minima and maxima.

Traverse price[] from i = 1 to price.size() - 1

res = 0
if price[i] > price[i - 1]
res = res + price[i] - price[i - 1]

Time Complexity: O(n)
Auxiliary Space: O(1)
                                                                                                                        
import Foundation
func maximumProfit(_ prices: [Int]) -> Int {
    var result = 0
    
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            result += prices[i] - prices[i - 1]
        }
    }
    
    return result
}

// Example usage
let prices = [100, 180, 260, 310, 40, 535, 695]
print(maximumProfit(prices)) // Output: 865
