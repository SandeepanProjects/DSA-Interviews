//
//  Sudoku Solver.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Time: Worst-case O(9^(n^2)), but pruning with bitmasking speeds up significantly.
Space: O(n^2) for board + bitmasks.
                    
func isSafe(_ mat: [[Int]], _ i: Int, _ j: Int, _ num: Int, _ row: [Int], _ col: [Int], _ box: [Int]) -> Bool {
    let bit = 1 << num
    if (row[i] & bit) != 0 || (col[j] & bit) != 0 || (box[(i / 3) * 3 + j / 3] & bit) != 0 {
        return false
    }
    return true
}

func sudokuSolverRec(_ mat: inout [[Int]], _ i: Int, _ j: Int, _ row: inout [Int], _ col: inout [Int], _ box: inout [Int]) -> Bool {
    let n = mat.count

    // Base case: reached past last column of last row
    if i == n - 1 && j == n {
        return true
    }

    var x = i
    var y = j

    if y == n {
        x += 1
        y = 0
    }

    if mat[x][y] != 0 {
        return sudokuSolverRec(&mat, x, y + 1, &row, &col, &box)
    }

    for num in 1...n {
        if isSafe(mat, x, y, num, row, col, box) {
            mat[x][y] = num
            let bit = 1 << num
            row[x] |= bit
            col[y] |= bit
            box[(x / 3) * 3 + y / 3] |= bit

            if sudokuSolverRec(&mat, x, y + 1, &row, &col, &box) {
                return true
            }

            // Backtrack
            mat[x][y] = 0
            row[x] &= ~bit
            col[y] &= ~bit
            box[(x / 3) * 3 + y / 3] &= ~bit
        }
    }
    return false
}

func solveSudoku(_ mat: inout [[Int]]) {
    let n = mat.count
    var row = [Int](repeating: 0, count: n)
    var col = [Int](repeating: 0, count: n)
    var box = [Int](repeating: 0, count: n)

    // Initialize bitmasks based on initial board
    for i in 0..<n {
        for j in 0..<n {
            let num = mat[i][j]
            if num != 0 {
                let bit = 1 << num
                row[i] |= bit
                col[j] |= bit
                box[(i / 3) * 3 + j / 3] |= bit
            }
        }
    }

    _ = sudokuSolverRec(&mat, 0, 0, &row, &col, &box)
}

// Example usage:
var mat = [
    [3, 0, 6, 5, 0, 8, 4, 0, 0],
    [5, 2, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 3, 1],
    [0, 0, 3, 0, 1, 0, 0, 8, 0],
    [9, 0, 0, 8, 6, 3, 0, 0, 5],
    [0, 5, 0, 0, 9, 0, 6, 0, 0],
    [1, 3, 0, 0, 0, 0, 2, 5, 0],
    [0, 0, 0, 0, 0, 0, 0, 7, 4],
    [0, 0, 5, 2, 0, 6, 3, 0, 0]
]

solveSudoku(&mat)

// Print solved sudoku
for row in mat {
    print(row.map { String($0) }.joined(separator: " "))
}
