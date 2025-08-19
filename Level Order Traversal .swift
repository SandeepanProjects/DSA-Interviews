//
//  Level Order Traversal .swift
//  
//
//  Created by Apple on 19/08/25.
//

import Foundation

| Operation | Complexity |
| --------- | ---------- |
| **Time**  | O(n)       |
| **Space** | O(n)       |


// Define the Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.data = value
        self.left = nil
        self.right = nil
    }
}

// Level-order traversal function
func levelOrder(_ root: Node?) -> [[Int]] {
    guard let root = root else { return [] }

    var result: [[Int]] = []
    var queue: [Node] = [root]

    while !queue.isEmpty {
        let levelSize = queue.count
        var currentLevel: [Int] = []

        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            currentLevel.append(node.data)

            if let left = node.left {
                queue.append(left)
            }

            if let right = node.right {
                queue.append(right)
            }
        }

        result.append(currentLevel)
    }

    return result
}

// Build the tree
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

// Perform level order traversal
let result = levelOrder(root)

// Print the result
for level in result {
    print("[", terminator: "")
    print(level.map { String($0) }.joined(separator: ", "), terminator: "")
    print("] ", terminator: "")
}
