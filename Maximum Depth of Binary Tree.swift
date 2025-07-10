//
//  Maximum Depth of Binary Tree.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Level Order Traversal - O(n) Time and O(n) Space

If we take a closer look at the breadth first traversal, we can notice that after we process the last node of the current level, the queue contains all the nodes of next level. This is true from the root (or first level)  So we get the size of the queue in a loop to count the nodes of every level.
Algorithm:

Initialize an empty queue q to store nodes of the tree and a variable depth to keep track of the number of levels.
Push the root node into the queue q.
While the queue is not empty:
Store the number of nodes at the current level as levelSize (the size of the queue).
For each node in the current level (loop from 0 to levelSize):
Dequeue the front element from the queue (i.e., process the node).
If the node has a left child, enqueue it.
If the node has a right child, enqueue it.
After processing all nodes at the current level, increment the depth.
Return depth - 1 as the number of edges encountered will be one less than number of nodes.

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

func height(_ root: Node?) -> Int {
    guard let root = root else { return 0 }

    var queue: [Node] = [root]
    var depth = 0

    while !queue.isEmpty {
        let levelSize = queue.count

        for _ in 0..<levelSize {
            let current = queue.removeFirst()

            if let left = current.left {
                queue.append(left)
            }
            if let right = current.right {
                queue.append(right)
            }
        }

        depth += 1
    }

    return depth - 1 // To match your Python version behavior
}

// Test the function
let root = Node(12)
root.left = Node(8)
root.right = Node(18)
root.left?.left = Node(5)
root.left?.right = Node(11)

print(height(root))  // Output: 2

