//
//  Letter Combinations of a Phone Number.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

Given an integer array arr[] containing digits from [0, 9], the task is to print all possible letter combinations that the numbers could represent. A mapping of digits to letters (just like on the telephone buttons) is being followed. Note that 0 and 1 do not map to any letters

Input: arr[] = [2, 3]
Output: ad ae af bd be bf cd ce cf
Explanation: When we press 2,3 then ad, ae, af, bd,  ... cf are the list of possible words.

The idea behind this problem is to generate all possible letter combinations for a given sequence of digits based on a traditional phone keypad mapping. Each digit from 2 to 9 corresponds to a set of letters (for example, 2 maps to 'abc', 3 maps to 'def', and so on). The goal is to combine these letters for the given sequence of digits to form all possible words.

We can solve this using an iterative approach with a queue. Start by initializing the queue with an empty string. For each digit in the input array, we extend each string in the queue by appending all the possible letters for that digit. We repeat this until we’ve processed all digits and generated all possible combinations. The queue ensures that we build combinations in the correct order.
                                                                                    
                                                                                    
func possibleWords(_ arr: [Int]) -> [String] {
    let mp = ["", "", "abc", "def",
              "ghi", "jkl", "mno",
              "pqrs", "tuv", "wxyz"]

    var result: [String] = []
    var queue: [String] = [""]

    while !queue.isEmpty {
        let prefix = queue.removeFirst()

        if prefix.count == arr.count {
            result.append(prefix)
        } else {
            let digit = arr[prefix.count]

            // Skip invalid digits
            if digit < 2 || digit > 9 {
                continue
            }

            for letter in mp[digit] {
                queue.append(prefix + String(letter))
            }
        }
    }

    return result
}

func printArr(_ words: [String]) {
    print(words.joined(separator: " "))
}

// Example usage
let arr = [2, 3]
let words = possibleWords(arr)
printArr(words)  // Output: ad ae af bd be bf cd ce cf

