//
//  3 Sum - Triplet Sum Closest to Target.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Sorting and Two Pointers – O(n^2) Time and O(1) Space

Initially, we sort the input array so that we can apply two pointers technique. Then, we iterate over the array fixing the first element of the triplet and then use two pointers technique to find the remaining two elements. Set one pointer at the beginning (left) and another at the end (right) of the remaining array. We then find the absolute difference between the sum of triplet and target and store the triplet having minimum absolute difference.

If sum < target, move left pointer towards right to increase the sum.
If sum > target, move right pointer towards left to decrease the sum.
If sum == target, we’ve found the triplet with sum = target, therefore this is the triplet with closest sum.


class GfG {
    static func closest3Sum(_ arr: [Int], _ target: Int) -> Int {
        var arr = arr
        arr.sort()
        var res = 0
        var minDiff = Int.max
        
        let n = arr.count
        
        for i in 0..<n-2 {
            var l = i + 1
            var r = n - 1
            
            while l < r {
                let currSum = arr[i] + arr[l] + arr[r]
                
                if abs(currSum - target) < minDiff {
                    minDiff = abs(currSum - target)
                    res = currSum
                } else if abs(currSum - target) == minDiff {
                    res = max(res, currSum)
                }
                
                if currSum > target {
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        
        return res
    }
    
    static func main() {
        let arr = [-1, 2, 2, 4]
        let target = 4
        print(closest3Sum(arr, target))
    }
}

GfG.main()
