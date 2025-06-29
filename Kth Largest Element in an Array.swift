//
//  Kth Largest Element in an Array.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

The idea is to maintain a min-heap (priority queue) of size K while iterating through the array. This approach ensures that the heap always contains the K largest elements encountered so far. As we add elements to the heap:

If the size of the heap exceeds K, we remove the smallest element. This ensures that the heap maintains only the K largest elements.
By the end of the process, the top element of the min-heap (which is the smallest of the K largest elements) will be the k-th largest element in the array.
                                                                        
                                                                        
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var minHeap = [Int]()

        for num in nums {
            minHeap.append(num)
            minHeap.sort() // simulate min-heap by sorting
            if minHeap.count > k {
                minHeap.removeFirst()
            }
        }

        return minHeap.first!
    }
}


Heap operations (sort + insert) take O(k log k) each time due to sorting, but with a real heap it's O(log k).
Total: O(n log k)
Space Complexity: O(k)
