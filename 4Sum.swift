//
//  4Sum.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Metric    Complexity
Time Complexity    O(n³)
Space Complexity    O(1) (excluding result array)
Even though it's O(n³), it's optimal for the 4Sum problem (there's no better solution in general for unsorted input).
                                            
                                            
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        let n = nums.count

        for i in 0..<n {
            // Skip duplicate i
            if i > 0 && nums[i] == nums[i - 1] { continue }

            for j in i + 1..<n {
                // Skip duplicate j
                if j > i + 1 && nums[j] == nums[j - 1] { continue }

                var left = j + 1
                var right = n - 1

                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]

                    if sum == target {
                        result.append([nums[i], nums[j], nums[left], nums[right]])

                        // Move left and right to next different elements
                        repeat { left += 1 } while left < right && nums[left] == nums[left - 1]
                        repeat { right -= 1 } while left < right && nums[right] == nums[right + 1]

                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }

        return result
    }
}

let solution = Solution()
let nums = [1, 0, -1, 0, -2, 2]
let target = 0
print(solution.fourSum(nums, target))
// Output: [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]
