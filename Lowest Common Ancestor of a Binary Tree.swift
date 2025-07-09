//
//  Lowest Common Ancestor of a Binary Tree.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

[Expected Approach] Using Single Traversal - O(n) Time and O(h) Space

Note: This approach assumes that both the keys are present in the given tree.

The idea is to traverse the tree starting from the root. If any of the given keys (n1 and n2) matches with the root, then the root is LCA (assuming that both keys are present). If the root doesn't match with any of the keys, we recur for the left and right subtree. The node which has one key present in its left subtree and the other key present in the right subtree is the LCA, else if, both keys lie in the left subtree, then the left subtree has LCA, else the LCA lies in the right subtree.


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

func lca(_ root: Node?, _ n1: Int, _ n2: Int) -> Node? {
    guard let node = root else { return nil }
    
    // If root matches either n1 or n2, return root
    if node.data == n1 || node.data == n2 {
        return node
    }
    
    // Recursively find LCA in left and right subtrees
    let leftLca = lca(node.left, n1, n2)
    let rightLca = lca(node.right, n1, n2)
    
    // If both sides return non-nil, current node is LCA
    if leftLca != nil && rightLca != nil {
        return node
    }
    
    // Otherwise return non-nil subtree LCA
    return leftLca ?? rightLca
}

// Example usage
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.left = Node(6)
root.right?.right = Node(7)

if let ans = lca(root, 4, 5) {
    print(ans.data)  // Output: 2
} else {
    print("No common ancestor found")
}
