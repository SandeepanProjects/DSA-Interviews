//
//  Word Search.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Word Search - Check if a word exists in a grid or not
Time Complexity: O(N * M * 4^L)
Space Complexity: O(L) recursion stack depth (word length).

Where N and M are grid dimensions and L is the length of the word.
Each cell could start a DFS that explores up to 4 directions for each character.

                        
func findMatch(_ mat: inout [[Character]], _ word: [Character], _ x: Int, _ y: Int, _ wIdx: Int) -> Bool {
    let wLen = word.count
    let n = mat.count
    let m = mat[0].count
    
    // Pattern matched
    if wIdx == wLen {
        return true
    }
    
    // Out of bounds
    if x < 0 || y < 0 || x >= n || y >= m {
        return false
    }
    
    // If current cell matches the current character in word
    if mat[x][y] == word[wIdx] {
        // Mark this cell as visited
        let temp = mat[x][y]
        mat[x][y] = "#" // Using '#' as visited marker
        
        // Search in 4 directions
        let found = findMatch(&mat, word, x - 1, y, wIdx + 1) ||
        findMatch(&mat, word, x + 1, y, wIdx + 1) ||
        findMatch(&mat, word, x, y - 1, wIdx + 1) ||
        findMatch(&mat, word, x, y + 1, wIdx + 1)
        
        // Restore the cell value (backtrack)
        mat[x][y] = temp
        
        return found
    }
    
    return false
}

func isWordExist(_ mat: [[Character]], _ word: String) -> Bool {
    var matCopy = mat // Make a mutable copy to mark visited cells
    let wLen = word.count
    let n = mat.count
    let m = mat[0].count
    
    // If total characters in matrix less than word length
    if wLen > n * m {
        return false
    }
    
    let wordArr = Array(word)
    
    for i in 0..<n {
        for j in 0..<m {
            if mat[i][j] == wordArr[0] {
                if findMatch(&matCopy, wordArr, i, j, 0) {
                    return true
                }
            }
        }
    }
    
    return false
}

// Example usage
let mat: [[Character]] = [
    ["a", "x", "m", "y"],
    ["b", "g", "d", "f"],
    ["x", "e", "e", "t"],
    ["r", "a", "k", "s"]
]
let word = "geeks"

print(isWordExist(mat, word) ? "true" : "false")

