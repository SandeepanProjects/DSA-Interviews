//
//  Top K Frequent Elements.swift
//  
//
//  Created by Apple on 19/08/25.
//

import Foundation
| Metric    | Complexity                               |
| --------- | ---------------------------------------- |
| **Time**  | O(n log n) worst case, O(n) average case |
| **Space** | O(n)                                     |


func topKFrequent(_ arr: [Int], _ k: Int) -> [Int] {
    // Count frequency of each element
    var freq: [Int: Int] = [:]
    for num in arr {
        freq[num, default: 0] += 1
    }

    // Find the maximum frequency
    guard let maxFreq = freq.values.max() else { return [] }

    // Create buckets based on frequency
    var buckets = Array(repeating: [Int](), count: maxFreq + 1)
    for (num, count) in freq {
        buckets[count].append(num)
    }

    // Collect top k frequent elements
    var result: [Int] = []
    for i in stride(from: maxFreq, through: 1, by: -1) {
        if !buckets[i].isEmpty {
            let sorted = buckets[i].sorted(by: >)
            for num in sorted {
                result.append(num)
                if result.count == k {
                    return result
                }
            }
        }
    }

    return result
}

let arr = [3, 1, 4, 4, 5, 2, 6, 1]
let k = 2
let result = topKFrequent(arr, k)

print(result.map(String.init).joined(separator: " "))  // Example output: 4 1
