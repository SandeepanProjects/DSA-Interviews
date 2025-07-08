//
//  Length of Last Word.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

func findLength(_ str: String) -> Int {
    var count = 0
    var foundLetter = false
    let characters = Array(str)

    for i in stride(from: characters.count - 1, through: 0, by: -1) {
        let c = characters[i]
        if c.isLetter {
            foundLetter = true
            count += 1
        } else if foundLetter {
            return count
        }
    }
    return count
}

// Example usage
let str = "Geeks for Geeks"
print("The length of last word is", findLength(str))
// Output: The length of last word is 5
