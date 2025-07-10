//
//  Majority Element.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

sing Moore's Voting Algorithm - O(n) Time and O(1) Space

The idea is to use the Boyer-Moore Voting Algorithm to efficiently find a potential majority element by canceling out different elements. If a majority element exists, it will remain as the candidate. Then verify it.
This is a two-step process:

The first step gives the element that may be the majority element in the array. If there is a majority element in an array, then this step will definitely return majority element, otherwise, it will return candidate for majority element.
Check if the element obtained from the above step is the majority element. This step is necessary as there might be no majority element.

Step By Step Approach:
Initialize a candidate variable and a count variable.
Traverse the array once:
If count is zero, set the candidate to the current element and set count to one.
If the current element equals the candidate, increment count.
If the current element differs from the candidate, decrement count.
Traverse the array again to count the occurrences of the candidate.
If the candidate's count is greater than n / 2, return the candidate as the majority element.

func majorityElement(_ arr: [Int]) -> Int {
    var candidate = -1
    var count = 0
    
    // Find a candidate
    for num in arr {
        if count == 0 {
            candidate = num
            count = 1
        } else if num == candidate {
            count += 1
        } else {
            count -= 1
        }
    }
    
    // Validate the candidate
    count = 0
    for num in arr {
        if num == candidate {
            count += 1
        }
    }
    
    // If count is greater than n / 2, return candidate
    return count > arr.count / 2 ? candidate : -1
}

// Test the function
let arr = [1, 1, 2, 1, 3, 5, 1]
print(majorityElement(arr))
