//
//  Merge Overlapping Intervals.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Checking Last Merged Interval – O(n*log(n)) Time and O(n) Space

In the previous approach, for each range we are checking for possible overlaps by iterating over all the remaining ranges till the end. We can optimize this by checking only those intervals that overlap with the last merged interval. Since the intervals will be sorted based on starting point, so if we encounter an interval whose starting time lies outside the last merged interval, then all further intervals will also lie outside it.

The intuition is to first sort the intervals based on their starting points. This allows us to easily identify overlapping intervals by comparing each interval with the last merged interval. Now, iterate over each interval and if the current interval overlaps with the last merged interval, then merge them both. Otherwise, append the merged interval to the result.


func mergeOverlap(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return [] }
    
    // Sort intervals by start time
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    
    var result: [[Int]] = [sortedIntervals[0]]
    
    for i in 1..<sortedIntervals.count {
        var last = result[result.count - 1]
        let current = sortedIntervals[i]
        
        if current[0] <= last[1] {
            // Merge intervals by updating the end time
            last[1] = max(last[1], current[1])
            result[result.count - 1] = last
        } else {
            result.append(current)
        }
    }
    
    return result
}

// Test the function
let arr = [[7, 8], [1, 5], [2, 4], [4, 6]]
let res = mergeOverlap(arr)

for interval in res {
    print(interval[0], interval[1])
}
