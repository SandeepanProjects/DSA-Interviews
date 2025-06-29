//
//  3 Sum - Find All Triplets with Zero Sum.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Using Hash Map - O(n^3) Time and O(n) Space

The idea is to use a hash map to store indices of each element and efficiently find triplets that sum to zero.
We iterate through all pairs (j, k), compute the required third element as -(arr[j] + arr[k]), and check if it exists in the map with a valid index i < j.
If found, we store {i, j, k} in the result. To ensure unique triplets, the map maintains only indices less than the current j.
In the worst case, this approach also takes O(n^3) time but in the average case, it is much faster than Naive approach as we are iterating over only those triplets whose sum is equal to target.


Time Complexity: O(n3), Since two nested loops are used and traversing through the map may take O(n) in worst case.
Auxiliary Space: O(n), Since a HashMap is used to store all value index pairs.


class GfG {
    
    // Function to find all triplets with zero sum
    static func findTriplets(_ arr: [Int]) -> [[Int]] {
        
        // Map to store indices for each value
        var map = [Int: [Int]]()
        
        // Resultant list
        var ans = [[Int]]()
        
        // Check for all pairs j, k
        for j in 0..<arr.count {
            for k in (j + 1)..<arr.count {
                
                // Value of third index should be
                let val = -1 * (arr[j] + arr[k])
                
                // If such indices exist
                if let indices = map[val] {
                    // Append the i, j, k
                    for i in indices {
                        ans.append([i, j, k])
                    }
                }
            }
            
            // After j'th index is traversed
            // We can use it as i.
            map[arr[j], default: []].append(j)
        }
        
        return ans
    }

    static func main() {
        let arr = [0, -1, 2, -3, 1]
        let res = findTriplets(arr)
        for triplet in res {
            print("\(triplet[0]) \(triplet[1]) \(triplet[2])")
        }
    }
}

GfG.main()
