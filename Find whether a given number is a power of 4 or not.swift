//
//  Find whether a given number is a power of 4 or not.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

Complexity    Value
Time    O(1)
Space    O(1)

A number can be considered a power of 4 when:

* The number is a power of 2 for example : 4, 16, 64 ... all are powers of 2 as well . The O(1) bit manipulation technique using n&(n-1)==0 can be used, but wait every power of 4 is a power of 2. Will the reverse apply?
*Obviously not, 8,32,128 ... aren't power of 4, so we need one more check here. If you clearly notice all powers of 4 when divided by 3 gives 1 as the remainder.
                                    
func isPowerOfFour(_ n: Int) -> Bool {
    return (n > 0) && ((n & (n - 1)) == 0) && (n % 3 == 1)
}

// Test case
let testNo = 64
if isPowerOfFour(testNo) {
    print("\(testNo) is a power of 4")
} else {
    print("\(testNo) is not a power of 4")
}
