//
//  Binary Tree Vertical Order Traversal.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ x: Int) {
        self.data = x
    }
}

// Helper function for DFS
func DFS(_ root: Node?, _ hd: Int, _ minHD: inout Int, _ map: inout [Int: [Int]]) {
    guard let root = root else { return }

    // Append the current node to the list at horizontal distance hd
    if map[hd] == nil {
        map[hd] = []
    }
    map[hd]?.append(root.data)

    // Update minimum horizontal distance
    minHD = min(minHD, hd)

    // Recurse left and right
    DFS(root.left, hd - 1, &minHD, &map)
    DFS(root.right, hd + 1, &minHD, &map)
}

// Vertical Order Traversal function
func verticalOrder(_ root: Node?) -> [[Int]] {
    var map = [Int: [Int]]()
    var minHD = 0

    DFS(root, 0, &minHD, &map)

    var res = [[Int]]()
    var hd = minHD

    // Get values from map from min to max horizontal distance
    while let values = map[hd] {
        res.append(values)
        hd += 1
    }

    return res
}

// Construct the binary tree
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.left = Node(6)
root.right?.right = Node(7)
root.right?.left?.right = Node(8)
root.right?.right?.right = Node(9)

// Perform vertical order traversal
let result = verticalOrder(root)

// Print result in required format
for level in result {
    print("[", level.map { String($0) }.joined(separator: " "), "]", terminator: " ")
}
