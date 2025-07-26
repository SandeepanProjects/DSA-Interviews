//
//  Sorted Array to Balanced BST.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Operation            | Complexity
| **Time Complexity**  | **O(n)**                                                                                                                 |
 Each element is processed once to create a node. The queue-based iteration visits each node exactly once.                |
| **Space Complexity** | **O(n)**                                                                                                                 |
The tree nodes themselves take O(n) space. The queue will hold up to O(n) nodes in the worst case (e.g., skewed splits). |


class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
}

func sortedArrayToBST(_ arr: [Int]) -> Node? {
    let n = arr.count
    if n == 0 { return nil }
    
    let mid = (n - 1) / 2
    let root = Node(arr[mid])
    
    // Queue of tuples: (node, startIndex, endIndex)
    var queue: [(Node, Int, Int)] = [(root, 0, n - 1)]
    
    while !queue.isEmpty {
        let (curr, s, e) = queue.removeFirst()
        let index = s + (e - s) / 2
        
        // Left subtree
        if s < index {
            let midLeft = s + (index - 1 - s) / 2
            let leftNode = Node(arr[midLeft])
            curr.left = leftNode
            queue.append((leftNode, s, index - 1))
        }
        
        // Right subtree
        if e > index {
            let midRight = index + 1 + (e - index - 1) / 2
            let rightNode = Node(arr[midRight])
            curr.right = rightNode
            queue.append((rightNode, index + 1, e))
        }
    }
    
    return root
}

func preOrder(_ root: Node?) {
    guard let node = root else { return }
    print(node.data, terminator: " ")
    preOrder(node.left)
    preOrder(node.right)
}

// Example usage:
let arr = [1, 2, 3, 4]
if let root = sortedArrayToBST(arr) {
    preOrder(root)
    print()
}
