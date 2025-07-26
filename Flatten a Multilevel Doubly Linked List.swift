//
//  Flatten a Multilevel Doubly Linked List.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Metric           | Complexity |
| ---------------- | ---------- |
| Time Complexity  | **O(n)**   |
| Space Complexity | **O(1)**   |

// Definition for a Node with `next` and `child` pointers
class Node {
    var data: Int
    var next: Node?
    var child: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
        self.child = nil
    }
}

// Function to flatten a multilevel linked list
func flattenList(_ head: Node?) {
    guard head != nil else { return }

    // Step 1: Find the tail of the first level
    var tail = head
    while tail?.next != nil {
        tail = tail?.next
    }

    // Step 2: Traverse from the beginning
    var curr = head
    while curr != nil {
        if let child = curr?.child {
            // Append the child list to the tail
            tail?.next = child

            // Move the tail to the new end
            var temp = child
            while temp.next != nil {
                temp = temp.next
            }
            tail = temp

            // Remove child pointer after flattening
            curr?.child = nil
        }
        curr = curr?.next
    }
}

// Function to print the flattened list
func printList(_ head: Node?) {
    var curr = head
    while curr != nil {
        print(curr!.data, terminator: " ")
        curr = curr?.next
    }
    print()
}

// Example Usage
func main() {
    // Linked List:
    // 1 -> 2 -> 3
    // |    |
    // 4 -> 5   6
    // |
    // 7

    let head = Node(1)
    head.next = Node(2)
    head.next?.next = Node(3)

    head.child = Node(4)
    head.child?.next = Node(5)

    head.next?.next?.child = Node(6)

    head.child?.child = Node(7)

    flattenList(head)
    print("Flattened List:")
    printList(head)
}

main()
