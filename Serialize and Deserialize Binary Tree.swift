//
//  Serialize and Deserialize Binary Tree.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Function          | Time Complexity | Space Complexity |
| ----------------- | --------------- | ---------------- |
| `serialize`       | **O(n)**        | **O(n)**         |
| `deserialize`     | **O(n)**        | **O(n)**         |
| `printLevelOrder` | **O(n)**        | **O(n)**         |


// Definition for binary tree node
class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ data: Int) {
        self.data = data
    }
}

// Serialize binary tree to an array
func serialize(_ root: Node?) -> [Int] {
    var result: [Int] = []
    var queue: [Node?] = [root]

    while !queue.isEmpty {
        let curr = queue.removeFirst()

        if let node = curr {
            result.append(node.data)
            queue.append(node.left)
            queue.append(node.right)
        } else {
            result.append(-1)
        }
    }

    return result
}

// Deserialize array to binary tree
func deserialize(_ arr: [Int]) -> Node? {
    if arr.isEmpty || arr[0] == -1 {
        return nil
    }

    let root = Node(arr[0])
    var queue: [Node] = [root]
    var i = 1

    while i < arr.count && !queue.isEmpty {
        let current = queue.removeFirst()

        // Left child
        if arr[i] != -1 {
            let leftNode = Node(arr[i])
            current.left = leftNode
            queue.append(leftNode)
        }
        i += 1

        // Right child
        if i < arr.count && arr[i] != -1 {
            let rightNode = Node(arr[i])
            current.right = rightNode
            queue.append(rightNode)
        }
        i += 1
    }

    return root
}

// Print level order traversal
func printLevelOrder(_ root: Node?) {
    guard let root = root else {
        print("N ", terminator: "")
        return
    }

    var queue: [Node?] = [root]
    var nonNull = 1

    while !queue.isEmpty && nonNull > 0 {
        let curr = queue.removeFirst()

        if let node = curr {
            print(node.data, terminator: " ")
            queue.append(node.left)
            queue.append(node.right)

            if node.left != nil { nonNull += 1 }
            if node.right != nil { nonNull += 1 }
            nonNull -= 1
        } else {
            print("N ", terminator: "")
        }
    }
    print()
}

// Example usage
func main() {
    // Tree:
    //       10
    //     /    \
    //    20    30
    //  /   \
    // 40  60
    let root = Node(10)
    root.left = Node(20)
    root.right = Node(30)
    root.left?.left = Node(40)
    root.left?.right = Node(60)

    let arr = serialize(root)
    let deserializedRoot = deserialize(arr)

    print("Level Order of Deserialized Tree:")
    printLevelOrder(deserializedRoot)
}

main()
