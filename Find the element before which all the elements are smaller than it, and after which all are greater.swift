//
//  Find the element before which all the elements are smaller than it, and after which all are greater.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

The idea is to create a single array leftMax[] to store the largest elements at left of each index. And for right minimum values, we can use an integer rightMin that will store the current minimum value. At each iteration update the value rightMin and compare it with current value arr[i].

Time Complexity: O(n), because the program iterates through the array to find the element that satisfies the given condition.
Auxiliary Space: O(n), to create the array leftMax[].

class GfG {
    
    static func findElement(_ arr: [Int]) -> Int {
        let n = arr.count
        
        // leftMax[i] stores maximum of arr[0..i]
        var leftMax = [Int](repeating: 0, count: n)
        leftMax[0] = arr[0]
        
        // Fill leftMax[1..n-1]
        for i in 1..<n {
            leftMax[i] = max(leftMax[i - 1], arr[i])
        }
        
        // rightMin to store the minimum value
        var rightMin = arr[n - 1]
        
        // Check if we found a required element
        for i in (1..<n-1).reversed() {
            if arr[i] >= leftMax[i] && arr[i] <= rightMin {
                return arr[i]
            }
            
            // update rightMin
            rightMin = min(rightMin, arr[i])
        }
        return -1
    }
    
    static func main() {
        let arr = [5, 1, 4, 3, 6, 8, 10, 7, 9]
        print(findElement(arr))
    }
}

GfG.main()

