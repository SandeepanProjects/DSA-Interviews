//
//  Largest pair sum in an array.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Largest two Elements - O(n) Time and O(1) Space

This problem mainly boils down to finding the largest and second-largest element in an array. We can find the largest and second-largest in O(n) time by traversing the array once.


Initialize : first = -INF, second = INF
Loop through the elements
If the current element is greater than the first max element, then update second max to the first max and update the first max to the current element.
Return (first + second)

class LargestSumPair {
    static func findLargestSumPair(_ arr: [Int]) -> Int {
        let n = arr.count
        if n < 2 { return -1 }

        // Initialize first and second largest element
        var first: Int
        var second: Int
        if arr[0] > arr[1] {
            first = arr[0]
            second = arr[1]
        } else {
            first = arr[1]
            second = arr[0]
        }

        // Traverse remaining array and find first and second
        // largest elements in overall array
        for i in 2..<n {
            // If current element is greater than first then
            // update both first and second
            if arr[i] > first {
                second = first
                first = arr[i]
            } else if arr[i] > second {
                // If arr[i] is in between first and second then
                // update second
                second = arr[i]
            }
        }
        return first + second
    }

    // Driver program to test above function
    static func main() {
        let arr = [12, 34, 10, 6, 40]
        print("Max Pair Sum is \(findLargestSumPair(arr))")
    }
}

// Call the main function to test
LargestSumPair.main()

// Max Pair Sum is 74
