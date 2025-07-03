//
//  k-th smallest absolute difference of two elements in an array.swift
//  
//
//  Created by Apple on 03/07/25.
//

import Foundation

Metric    Complexity
Time    O(n log n + n log W)
Space    O(1) or O(n) (depending on how sorting is handled)


class KSolution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var sortedNums = nums.sorted()
        var low = 0
        var high = sortedNums[sortedNums.count - 1] - sortedNums[0]
        
        while low < high {
            let pivot = low + (high - low)/2
            var count = 0, left = 0
            
            for right in 0..<sortedNums.count {
                while sortedNums[right] - sortedNums[left] > pivot {
                    left += 1
                }
                count += right - left
            }
            
            if count >= k {
                high = pivot
            } else {
                low = pivot + 1
            }
        }
        
        return low
    }
}

let solution = KSolution()
let a = [1, 2, 3, 4]
let k = 3
print(solution.smallestDistancePair(a, k))  // Output: 1
