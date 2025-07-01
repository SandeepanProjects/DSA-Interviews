//
//  Combination Sum.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Given an array of distinct integers arr[] and an integer target, the task is to find a list of all unique combinations of array where the sum of chosen element is equal to target.

Using backtracking

The idea is to use backtracking and recursively explore all possible combinations of elements, of the given array that sums up to given target value. If the remaining sum becomes less than 0 then backtrack to explore other possible combinations.
Step by step implementation

To perform recursion, create an array cur[] to store the current combination and a 2D array res[] to store all valid combinations. Start from the 0th element and for each element arr[i], there are two choices:
Include the element: Add it to array cur and reduce remSum by arr[i] and move to the same index as we can choose same element multiple times.
Skip the element: Move to the next element without adding the current.
If the remaining sum becomes 0, add the current combination cur to res else backtrack to previous element by removing the element from the last index of cur.

Time Complexity: O(K * 2k), where K is average size of a valid combination and k = Target​ / min(arr), depth of the recursion tree.
Auxiliary Space: O(k), considering the recursive stack and neglecting the space required to store the combinations.

func makeCombination(_ arr: [Int], _ remSum: Int, _ cur: inout [Int], _ res: inout [[Int]], _ index: Int) {
    // If remaining sum is 0, add the current combination
    if remSum == 0 {
        res.append(cur)
        return
    }
    
    // If invalid state, return
    if remSum < 0 || index >= arr.count {
        return
    }
    
    // Include the current element
    cur.append(arr[index])
    makeCombination(arr, remSum - arr[index], &cur, &res, index)
    
    // Backtrack
    cur.removeLast()
    
    // Move to the next index
    makeCombination(arr, remSum, &cur, &res, index + 1)
}

func combinationSum(_ arr: [Int], _ target: Int) -> [[Int]] {
    let sortedArr = arr.sorted()
    var cur: [Int] = []
    var res: [[Int]] = []
    makeCombination(sortedArr, target, &cur, &res, 0)
    return res
}

// Example usage
let arr = [2, 4, 6, 8]
let target = 8

let res = combinationSum(arr, target)

for combination in res {
    print(combination.map { String($0) }.joined(separator: " "))
}
