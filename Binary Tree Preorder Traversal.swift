//
//  Binary Tree Preorder Traversal.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ v: Int) {
        self.data = v
    }
}

// Function to print preorder traversal
func printPreorder(_ node: Node?) {
    guard let node = node else {
        return
    }

    // Deal with the node
    print(node.data, terminator: " ")

    // Recur on left subtree
    printPreorder(node.left)

    // Recur on right subtree
    printPreorder(node.right)
}

// Example usage
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.right = Node(6)

printPreorder(root)
