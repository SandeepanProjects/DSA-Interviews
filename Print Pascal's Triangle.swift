//
//  Print Pascal's Triangle.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

Time Complexity - O(n2)
Auxiliary Space - O(1)

Using Binomial Coefficient (Space Optimized)

This method is based on approach using Binomial Coefficient. We know that ith entry in a row (n) in Binomial Coefficient is nCi and all rows start with value 1. The idea is to calculate nCi-1  using nCi . It can be calculated in O(1) time.

nCi = n! / (i! * (n-i)!)   - (Eq - 1)
nCi-1 = n! / ((i-1)! * (n-i+1)!)  - (Eq - 2)
On solving Eq- 1 further , we get  nCi = n! / (n-i)! * i * (i-1)!) -  (Eq - 3)
On solving Eq- 2 further , we get  nCi-1  = n! / ((n- i + 1) * (n-i)! * (i-1)! ) - (Eq - 4)
Now, divide Eq - 3 by Eq - 4:
nCi = nCi-1 * (n-i+1) / i  , So nCi can be calculated from nCi-1 in O(1) time

func printPascal(_ n: Int) {
    for row in 1...n {
        var c = 1
        for i in 1...row {
            print(c, terminator: " ")
            c = c * (row - i) / i
        }
        print()
    }
}

let n = 5
printPascal(n)
