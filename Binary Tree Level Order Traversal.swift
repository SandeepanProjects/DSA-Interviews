//
//  Binary Tree Level Order Traversal.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Using Queue (Iterative) - O(n) time and O(n) space

class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ value: Int) {
        self.data = value
    }
}

func levelOrder(_ root: Node?) -> [[Int]] {
    guard let root = root else {
        return []
    }

    var queue: [Node] = [root]
    var result: [[Int]] = []

    while !queue.isEmpty {
        var levelSize = queue.count
        var level: [Int] = []

        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            level.append(node.data)

            if let left = node.left {
                queue.append(left)
            }

            if let right = node.right {
                queue.append(right)
            }
        }

        result.append(level)
    }

    return result
}

// Construct the tree
let root = Node(5)
root.left = Node(12)
root.right = Node(13)

root.left?.left = Node(7)
root.left?.right = Node(14)

root.right?.right = Node(2)

root.left?.left?.left = Node(17)
root.left?.left?.right = Node(23)

root.left?.right?.left = Node(27)
root.left?.right?.right = Node(3)

root.right?.right?.left = Node(8)
root.right?.right?.right = Node(11)

// Perform level order traversal and print result
let res = levelOrder(root)

for level in res {
    print("[", terminator: "")
    print(level.map { String($0) }.joined(separator: ", "), terminator: "")
    print("] ", terminator: "")
}
