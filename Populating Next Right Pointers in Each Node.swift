//
//  Populating Next Right Pointers in Each Node.swift
//  
//
//  Created by Apple on 12/07/25.
//

import Foundation

🔁 Time Complexity: O(N)
It visits every node exactly once.
Operations inside the loop (e.g., appending to result) are constant time.
👉 Conclusion: O(N)

🧠 Space Complexity: O(W)
Uses a queue to store nodes per level.
In the worst case (a full binary tree), the maximum number of nodes in the queue can be the number of nodes in the bottom-most level.
👉 Conclusion: O(W), where W is the maximum width of the tree (worst case: O(N/2) ≈ O(N))


class Node {
    var data: Int
    var left: Node?
    var right: Node?
    var nextRight: Node?

    init(_ data: Int) {
        self.data = data
    }
}

// Function to get the next right node
func getNextRight(_ p: Node?) -> Node? {
    var temp = p?.nextRight
    while temp != nil {
        if let left = temp?.left {
            return left
        }
        if let right = temp?.right {
            return right
        }
        temp = temp?.nextRight
    }
    return nil
}

// Function to connect nodes at the same level
@discardableResult
func connect(_ root: Node?) -> Node? {
    guard let root = root else { return nil }

    root.nextRight = nil
    var current: Node? = root

    while current != nil {
        var q: Node? = current
        while q != nil {
            if let left = q?.left {
                if let right = q?.right {
                    left.nextRight = right
                } else {
                    left.nextRight = getNextRight(q)
                }
            }
            if let right = q?.right {
                right.nextRight = getNextRight(q)
            }
            q = q?.nextRight
        }

        if let left = current?.left {
            current = left
        } else if let right = current?.right {
            current = right
        } else {
            current = getNextRight(current)
        }
    }

    return root
}

// Function to get the array representation of nextRight links
func printTree(_ root: Node?) -> [String] {
    var result = [String]()
    guard let root = root else { return result }

    var queue: [Node?] = [root, nil]

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if let node = node {
            result.append(String(node.data))
            if node.nextRight == nil {
                result.append("#")
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        } else if !queue.isEmpty {
            queue.append(nil)
        }
    }

    return result
}

// Usage
let root = Node(10)
root.left = Node(8)
root.right = Node(2)
root.left?.left = Node(3)

let connectedRoot = connect(root)
let output = printTree(connectedRoot)
print(output.joined(separator: " "))
