//
//  Print Binary Tree.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

| Function              | Time Complexity | Space Complexity |
| --------------------- | --------------- | ---------------- |
| `findHeight`          | O(N)            | O(log N)         |
| `levelOrder`          | O(N)            | O(log N)         |
| Matrix Initialization | O(N log N)      | O(N log N)       |
| **Overall**           | **O(N log N)**  | **O(N log N)**   |


class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ data: Int) {
        self.data = data
    }
}

// Function to find the height of the binary tree
func findHeight(_ root: Node?) -> Int {
    guard let root = root else {
        return -1
    }
    let leftHeight = findHeight(root.left)
    let rightHeight = findHeight(root.right)
    return max(leftHeight, rightHeight) + 1
}

// Helper function to perform level order traversal and populate the 2D matrix
func levelOrder(_ root: Node?, _ row: Int, _ col: Int, _ height: Int, _ ans: inout [[String]]) {
    guard let root = root else {
        return
    }

    ans[row][col] = "\(root.data)"

    let offset = Int(pow(2.0, Double(height - row - 1)))

    if root.left != nil {
        levelOrder(root.left, row + 1, col - offset, height, &ans)
    }

    if root.right != nil {
        levelOrder(root.right, row + 1, col + offset, height, &ans)
    }
}

// Function to convert the binary tree to a 2D matrix
func treeToMatrix(_ root: Node?) -> [[String]] {
    let height = findHeight(root)
    let rows = height + 1
    let cols = Int(pow(2.0, Double(height + 1))) - 1

    var ans = Array(repeating: Array(repeating: "", count: cols), count: rows)

    levelOrder(root, 0, (cols - 1) / 2, height, &ans)

    return ans
}

// Function to print the 2D matrix representation of the tree
func print2DArray(_ arr: [[String]]) {
    for row in arr {
        for cell in row {
            if cell.isEmpty {
                print(" ", terminator: "")
            } else {
                print(cell, terminator: "")
            }
        }
        print()
    }
}

// Example usage:
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.right?.left = Node(4)
root.right?.right = Node(5)

let result = treeToMatrix(root)
print2DArray(result)

