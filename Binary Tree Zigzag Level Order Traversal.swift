//
//  Binary Tree Zigzag Level Order Traversal.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Using Deque - O(n) Time and O(n) Space

The idea is to use Doubly Ended Queues, then push and pop the nodes from each end in alternate order.

Step by step approach:

Initialize a deque dq and push the root of the binary tree into it.
Set reverse = false, i.e., we will begin from the front of the deque.
While the deque is not empty, repeat the following:
Set n = dq.size().
If reverse is false, do the following:
For n nodes in the deque, pop from the front and push the node's value into result.
If the left child exists, push it to the back of the deque.
If the right child exists, push it to the back of the deque.
After processing the level, set reverse = !reverse.
If reverse is true, do the following:
For n nodes in the deque, pop from the back and push the node's value into result.
If the right child exists, push it to the front of the deque.
If the left child exists, push it to the front of the deque.
After processing the level, set reverse = !reverse.

class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ x: Int) {
        self.data = x
    }
}

func zigZagTraversal(_ root: Node?) -> [Int] {
    var result: [Int] = []
    guard let root = root else { return result }

    var deque: [Node] = [root]
    var reverse = false

    while !deque.isEmpty {
        var n = deque.count
        var level: [Node] = []

        while n > 0 {
            if reverse {
                let curr = deque.removeLast()
                result.append(curr.data)

                // Insert children at the beginning in reverse order
                if let right = curr.right {
                    level.insert(right, at: 0)
                }
                if let left = curr.left {
                    level.insert(left, at: 0)
                }
            } else {
                let curr = deque.removeFirst()
                result.append(curr.data)

                // Append children normally
                if let left = curr.left {
                    level.append(left)
                }
                if let right = curr.right {
                    level.append(right)
                }
            }
            n -= 1
        }

        // Reassign the deque for the next level
        deque = level
        reverse.toggle()
    }

    return result
}

// Create a hardcoded tree
let root = Node(20)
root.left = Node(8)
root.right = Node(22)
root.right?.right = Node(11)
root.left?.left = Node(4)
root.left?.right = Node(12)
root.left?.right?.left = Node(10)
root.left?.right?.right = Node(14)

// Perform zigzag traversal
let res = zigZagTraversal(root)
for val in res {
    print(val, terminator: " ")
}
print()

