//
//  Lowest Common Ancestor of a Binary Search Tree.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Using BST Properties (Iterative Method) - O(h) Time and O(1) Space

The auxiliary space in the above method can be optimized by eliminating recursion. Below is the iterative implementation of this approach.


class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

func LCA(_ root: Node?, _ n1: Node, _ n2: Node) -> Node? {
    var current = root
    
    while let node = current {
        if node.data > n1.data && node.data > n2.data {
            current = node.left
        } else if node.data < n1.data && node.data < n2.data {
            current = node.right
        } else {
            // This is the split point, i.e., the LCA
            return node
        }
    }
    
    return nil
}

// Example usage:
let root = Node(20)
root.left = Node(8)
root.right = Node(22)
root.left?.left = Node(4)
root.left?.right = Node(12)
root.left?.right?.left = Node(10)
root.left?.right?.right = Node(14)

let n1 = root.left!.left!      // Node with data 4
let n2 = root.left!.right!.right!  // Node with data 14

if let lcaNode = LCA(root, n1, n2) {
    print(lcaNode.data)  // Output: 8
} else {
    print("LCA not found")
}

