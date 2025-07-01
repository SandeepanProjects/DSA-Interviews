//
//  Binary Search Tree from Preorder Traversal.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Efficient - Pass Range in Recursion

The trick is to set a range {min .. max} for every node. We initialize range as [-inf, +inf]. We begin with the first element of the preorder traversal, create a node with the given key. Now moving forward, we set the range as [-inf, key] for left subtree and [key, inf] for right subtree.

Follow the below steps to solve the problem:

Initialize the range as {-inf , +inf}
The first node will definitely be in range, so create a root node.
To construct the left subtree, set the range as {-inf, root.key} and for right subtree as [root.key, +inf]

Time Complexity: O(n)
Auxiliary Space: O(n)
                                                                            
import Foundation
                                                                            
// Define the Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int) {
        self.data = val
        self.left = nil
        self.right = nil
    }
}

// Helper function to construct BST from preorder
func constructUtil(_ pre: [Int], _ idx: inout Int, _ minVal: Int, _ maxVal: Int) -> Node? {
    if idx >= pre.count {
        return nil
    }
    
    let key = pre[idx]
    if key <= minVal || key >= maxVal {
        return nil
    }
    
    let root = Node(key)
    idx += 1
    
    // Left subtree
    if idx < pre.count {
        root.left = constructUtil(pre, &idx, minVal, key)
    }
    
    // Right subtree
    if idx < pre.count {
        root.right = constructUtil(pre, &idx, key, maxVal)
    }
    
    return root
}

// Main function to construct BST from preorder
func constructTree(_ pre: [Int]) -> Node? {
    var idx = 0
    return constructUtil(pre, &idx, Int.min, Int.max)
}

// Utility function to print inorder traversal
func inorder(_ node: Node?) {
    guard let node = node else { return }
    inorder(node.left)
    print(node.data, terminator: " ")
    inorder(node.right)
}

// Driver code
let pre = [10, 5, 1, 7, 40, 50]
if let root = constructTree(pre) {
    inorder(root)  // Should print the inorder traversal of the BST
}
