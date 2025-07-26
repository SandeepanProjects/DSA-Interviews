//
//  Remove Duplicates.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Complexity Type | Value |
| --------------- | ----- |
| Time            | O(n)  |
| Space           | O(1)  |


func removeDuplicates(_ arr: inout [Int]) -> Int {
    let n = arr.count
    if n <= 1 {
        return n
    }

    var idx = 1

    for i in 1..<n {
        if arr[i] != arr[i - 1] {
            arr[idx] = arr[i]
            idx += 1
        }
    }

    return idx
}

// Main
var arr = [1, 2, 2, 3, 4, 4, 4, 5, 5]
let newSize = removeDuplicates(&arr)

for i in 0..<newSize {
    print(arr[i], terminator: " ")
}

