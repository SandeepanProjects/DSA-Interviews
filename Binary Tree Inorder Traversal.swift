//
//  Binary Tree Inorder Traversal.swift
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
        self.left = nil
        self.right = nil
    }
}

// Function to print inorder traversal
func printInorder(_ node: Node?) {
    guard let node = node else {
        return
    }

    // First recur on left subtree
    printInorder(node.left)

    // Now deal with the node
    print(node.data, terminator: " ")

    // Then recur on right subtree
    printInorder(node.right)
}

// Main
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.right = Node(6)

printInorder(root)
