//
//  Coin Change - Minimum Coins to Make Sum.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Using Space Optimized DP – O(n*sum) Time and O(sum) Space

In previous approach of dynamic programming we have derive the relation between states as given below:

if (sum-coins[i]) is greater than 0, then dp[i][sum] = min(1+dp[i][sum-coins[i]], dp[i+1][sum])
else dp[i][sum] = dp[i+1][sum].
If we observe that for calculating current dp[i][sum] state we only need previous row dp[i-1][sum] or current row dp[i][sum-coins[i]]. There is no need to store all the previous states just one previous state is used to compute result.
    

    import Foundation

    func minCoins(coins: [Int], sum: Int) -> Int {
        var dp = [Int](repeating: Int.max, count: sum + 1)
        dp[0] = 0 // Base case: 0 coins to make sum 0

        // Iterate over each coin from last to first (reverse order)
        for i in stride(from: coins.count - 1, through: 0, by: -1) {
            for j in 1...sum {
                var take = Int.max
                var noTake = Int.max

                // If we can take the current coin
                if j - coins[i] >= 0 && coins[i] > 0 {
                    let previous = dp[j - coins[i]]
                    if previous != Int.max {
                        take = previous + 1
                    }
                }

                // No-take is just the existing dp[j] value
                noTake = dp[j]

                // Take the minimum of taking or not taking the coin
                dp[j] = min(take, noTake)
            }
        }

        return dp[sum] == Int.max ? -1 : dp[sum]
    }

    // Example usage
    let coins = [9, 6, 5, 1]
    let targetSum = 19
    print(minCoins(coins: coins, sum: targetSum))
