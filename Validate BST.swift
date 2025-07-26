//
//  Validate BST.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

Using Morris Traversal - O(n) Time and O(1) Space

| Metric           | Complexity |
| ---------------- | ---------- |
| Time Complexity  | **O(n)**   |
| Space Complexity | **O(1)**   |


class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ data: Int) {
        self.data = data
    }
}

func isBST(_ root: Node?) -> Bool {
    var curr = root
    var prevValue = Int.min

    while let currentNode = curr {
        if currentNode.left == nil {
            // Process current node
            if currentNode.data <= prevValue {
                return false
            }
            prevValue = currentNode.data
            curr = currentNode.right
        } else {
            // Find inorder predecessor
            var pre = currentNode.left
            while pre?.right != nil && pre?.right !== currentNode {
                pre = pre?.right
            }

            if pre?.right == nil {
                // Create temporary thread
                pre?.right = currentNode
                curr = currentNode.left
            } else {
                // Remove thread and process current
                pre?.right = nil
                if currentNode.data <= prevValue {
                    return false
                }
                prevValue = currentNode.data
                curr = currentNode.right
            }
        }
    }

    return true
}

// Example usage
func main() {
    // Tree:
    //     10
    //    /  \
    //   5    20
    //        / \
    //       9   25

    let root = Node(10)
    root.left = Node(5)
    root.right = Node(20)
    root.right?.left = Node(9)
    root.right?.right = Node(25)

    print(isBST(root) ? "True" : "False")
}

main()
