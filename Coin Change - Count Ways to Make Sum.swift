//
//  Coin Change - Count Ways to Make Sum.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Given an integer array of coins[] of size n representing different types of denominations and an integer sum, the task is to count all combinations of coins to make a given value sum.  

Using Space Optimized DP – O(sum*n) time and O(sum) space

In previous approach of dynamic programming we have derive the relation between states as given below:

if (sum-coins[i]) is greater than 0, then dp[i][sum] = dp[i][sum-coins[i]] + dp[i+1][sum].
else dp[i][sum] = dp[i+1][sum].
If we observe that for calculating current dp[i][sum] state we only need previous row dp[i-1][sum] or current row dp[i][sum-coins[i]]. There is no need to store all the previous states just one previous state is used to compute result.


    func count(coins: [Int], sum: Int) -> Int {
        let n = coins.count
        var dp = [Int](repeating: 0, count: sum + 1)
        
        // Base case: There is one way to make the sum 0
        dp[0] = 1

        // Process each coin one by one
        for i in 0..<n {
            for j in coins[i]...sum {
                dp[j] += dp[j - coins[i]]
            }
        }

        return dp[sum]
    }

    // Example usage
    let coins = [1, 2, 3]
    let targetSum = 5
    print(count(coins: coins, sum: targetSum))

