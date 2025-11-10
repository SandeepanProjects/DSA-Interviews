//
//  Remove Duplicates.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Operation                      | Average Time | Space      |
| ------------------------------ | ------------ | ---------- |
| `contains` / `insert` in `Set` | O(1)         | O(n) total |
| Loop over `array`              | O(n)         | –          |
| **Total**                      | **O(n)**     | **O(n)**   |


func removeDuplicates<T: Hashable>(from array: [T]) -> [T] {
       var seen = Set<T>()
       var result = [T]()
       
       for item in array {
           if !seen.contains(item) {
               seen.insert(item)
               result.append(item)
           }
       }
       return result
   }
