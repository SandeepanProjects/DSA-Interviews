//
//  K’th Smallest Element in Unsorted Array.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

O(N * log(K)) time and O(K) auxiliary space:

The intuition behind this approach is to maintain a max heap (priority queue) of size K while iterating through the array. Doing this ensures that the max heap always contains the K smallest elements encountered so far. If the size of the max heap exceeds K, remove the largest element this step ensures that the heap maintains the K smallest elements encountered so far. In the end, the max heap's top element will be the Kth smallest element.
                                                                                                
class KthSmallestElement {

    // Function to find the kth smallest array element
    static func kthSmallest(_ arr: [Int], N: Int, K: Int) -> Int? {
        // Create a max heap (priority queue)
        var pq = [Int]()

        // Iterate through the array elements
        for i in 0..<N {
            // Push the current element onto the max heap
            pq.append(arr[i])
            pq.sort(by: >) // Sort to maintain max heap property

            // If the size of the max heap exceeds K, remove the largest element
            if pq.count > K {
                pq.removeFirst()
            }
        }

        // Return the Kth smallest element (top of the max heap)
        return pq.first
    }

    // Driver's code:
    static func main() {
        let N = 10
        let arr = [10, 5, 4, 3, 48, 6, 2, 33, 53, 10]
        let K = 4

        // Function call
        if let result = kthSmallest(arr, N: N, K: K) {
            print("Kth Smallest Element is: \(result)")
        }
    }
}

// Call the main function
KthSmallestElement.main()
