//
//  Number of Islands.swift
//  
//
//  Created by Apple on 11/07/25.
//

import Foundation

Using Space Optimized DFS - O(n*m) Time and Space O(m × n) (due to recursion stack)

If we are allowed to modify the original matrix, we can avoid an additional visited matrix. Whenever we visit a cell in matrix, we change its value to W  so that it is not visited again

class IslandCounter {
    
    // Directions for 8-connected neighbors
    let rowDir = [-1, -1, -1, 0, 0, 1, 1, 1]
    let colDir = [-1, 0, 1, -1, 1, -1, 0, 1]
    
    // Function to check if a cell is safe to explore
    func isSafe(_ grid: inout [[Character]], _ r: Int, _ c: Int) -> Bool {
        let rowCount = grid.count
        let colCount = grid[0].count
        return r >= 0 && r < rowCount && c >= 0 && c < colCount && grid[r][c] == "L"
    }
    
    // DFS function to explore an island
    func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
        grid[r][c] = "W"  // Mark cell as visited (water)
        
        for k in 0..<8 {
            let newRow = r + rowDir[k]
            let newCol = c + colDir[k]
            if isSafe(&grid, newRow, newCol) {
                dfs(&grid, newRow, newCol)
            }
        }
    }
    
    // Main function to count islands
    func countIslands(_ grid: inout [[Character]]) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count
        var count = 0
        
        for r in 0..<rowCount {
            for c in 0..<colCount {
                if grid[r][c] == "L" {
                    dfs(&grid, r, c)
                    count += 1
                }
            }
        }
        
        return count
    }
}

// Test grid
var grid: [[Character]] = [
    ["L", "L", "W", "W", "W"],
    ["W", "L", "W", "W", "L"],
    ["L", "W", "W", "L", "L"],
    ["W", "W", "W", "W", "W"],
    ["L", "W", "L", "L", "W"]
]

let counter = IslandCounter()
let result = counter.countIslands(&grid)
print(result)  // Expected output: 4
