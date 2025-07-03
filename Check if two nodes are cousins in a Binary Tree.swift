//
//  Check if two nodes are cousins in a Binary Tree.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Given a binary tree (having distinct node values) root and two node values. The task is to check whether the two nodes with values a and b are cousins.
Note: Two nodes of a binary tree are cousins if they have the same depth with different parents.
                                                    
import Foundation
                                                    
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

func isSibling(_ root: Node?, _ a: Int, _ b: Int) -> Bool {
    guard let root = root else {
        return false
    }
    
    if let left = root.left, let right = root.right {
        if (left.data == a && right.data == b) || (left.data == b && right.data == a) {
            return true
        }
    }
    
    return isSibling(root.left, a, b) || isSibling(root.right, a, b)
}

func level(_ root: Node?, _ value: Int, _ lev: Int) -> Int {
    guard let root = root else {
        return 0
    }
    
    if root.data == value {
        return lev
    }
    
    let l = level(root.left, value, lev + 1)
    if l != 0 {
        return l
    }
    
    return level(root.right, value, lev + 1)
}

func isCousins(_ root: Node?, _ a: Int, _ b: Int) -> Bool {
    if a == b {
        return false
    }
    
    let aLevel = level(root, a, 1)
    let bLevel = level(root, b, 1)
    
    if aLevel == 0 || bLevel == 0 {
        return false
    }
    
    return aLevel == bLevel && !isSibling(root, a, b)
}

// Example usage
let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.right?.right = Node(5)

let a = 4
let b = 5

if isCousins(root, a, b) {
    print("True")
} else {
    print("False")
}
