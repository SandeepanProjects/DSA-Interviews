//
//  3 Sum - Find all Triplets with Given Sum.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

O(n^3) time and O(n^2) space

The idea is to store sum of all the pairs with their indices in the hash map or dictionary. Then, for each element in the array, we check if the pair which makes triplet's sum zero, exists in the hash map or not. Since there can be multiple valid pairs, we add each one to the hash set (to manage duplicates) while ensuring that all indices in the triplet are distinct.
                                                                                                        
class GfG {
    static func findTriplets(arr: [Int], target: Int) -> [[Int]] {
        var resSet = Set<[Int]>()
        let n = arr.count
        var mp = [Int: [[Int]]]()

        // Store sum of all the pairs with their indices
        for i in 0..<n {
            for j in (i + 1)..<n {
                let sum = arr[i] + arr[j]
                mp[sum, default: []].append([i, j])
            }
        }

        for i in 0..<n {
            // Find remaining value to get sum equal to target
            let rem = target - arr[i]
            if let pairs = mp[rem] {
                for p in pairs {
                    // Ensure no two indices are same in triplet
                    if p[0] != i && p[1] != i {
                        var curr = [i, p[0], p[1]]
                        curr.sort()
                        resSet.insert(curr)
                    }
                }
            }
        }
        return Array(resSet)
    }

    static func main() {
        let arr = [0, -1, 2, -3, 1]
        let target = -2

        let ans = findTriplets(arr: arr, target: target)
        for triplet in ans {
            print("\(triplet[0]) \(triplet[1]) \(triplet[2])")
        }
    }
}

GfG.main()
