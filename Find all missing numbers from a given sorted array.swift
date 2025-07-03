//
//  Find all missing numbers from a given sorted array.swift
//  
//
//  Created by Apple on 03/07/25.
//

import Foundation

In below approach simple we create a variable (cnt) this variable keeps the track of element present in array

1. We need to traverse the arr[0] to arr[N] to find missing number between it.

2. In for loop if arr[cnt] match to current element then we do not print that element and skip that element because it is present in array

once we found element then we increment the cnt++ for pointing next element in array

3. In else part we just print the element which does not match or present in array
            
            
Time Complexity: O(N), where N is the maximum element of the array.

Auxiliary Space: O(1) Because of this method the overflow of hash or extra space will be saved.

func printMissingElements(_ arr: [Int], _ N: Int) {
    var cnt = 0
    let start = arr[0]
    let end = arr[N - 1]
    
    for i in start...end {
        if cnt < N && arr[cnt] == i {
            cnt += 1
        } else {
            print(i, terminator: " ")
        }
    }
    print() // for newline after printing all missing numbers
}

// Example usage:
let arr = [6, 7, 10, 11, 13]
let N = arr.count

printMissingElements(arr, N)
// Output: 8 9 12

