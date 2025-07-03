//
//  Count smaller elements on Right side.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Given an unsorted array arr[] of distinct integers, construct another array countSmaller[] such that countSmaller[i] contains the count of smaller elements on the right side of each element arr[i] in the array.

The idea is to divide the array into two halves just as we do in merge sort. And then while merging back we sort them in decreasing order and keep track of count the smaller elements.

Time Complexity: O(N * log N), Used for Merge Sort.
Auxiliary Space: O(N), Space used to store the pair values in a different array.
                                                                                                
func merge(_ v: inout [[Int]], _ ans: inout [Int], _ l: Int, _ mid: Int, _ h: Int) {
    var temp: [[Int]] = []
    var i = l
    var j = mid + 1

    while i <= mid && j <= h {
        // If left element is greater, it means it's greater than all right elements from j to h
        if v[i][0] > v[j][0] {
            ans[v[i][1]] += (h - j + 1)
            temp.append(v[i])
            i += 1
        } else {
            temp.append(v[j])
            j += 1
        }
    }

    while i <= mid {
        temp.append(v[i])
        i += 1
    }

    while j <= h {
        temp.append(v[j])
        j += 1
    }

    // Copy the merged elements back into the original array
    for k in 0..<temp.count {
        v[l + k] = temp[k]
    }
}

func mergeSort(_ v: inout [[Int]], _ ans: inout [Int], _ l: Int, _ r: Int) {
    if l < r {
        let mid = (l + r) / 2
        mergeSort(&v, &ans, l, mid)
        mergeSort(&v, &ans, mid + 1, r)
        merge(&v, &ans, l, mid, r)
    }
}

func constructLowerArray(_ arr: [Int]) -> [Int] {
    let n = arr.count
    var v: [[Int]] = []
    
    for i in 0..<n {
        v.append([arr[i], i])
    }

    var ans = Array(repeating: 0, count: n)
    mergeSort(&v, &ans, 0, n - 1)
    return ans
}

// Driver Code
let arr = [12, 1, 2, 3, 0, 11, 4]
let ans = constructLowerArray(arr)
print("Result:", terminator: " ")
for x in ans {
    print(x, terminator: " ")
}
print()
