//
//  Remove N-th Node from End of linked list.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Metric           | Complexity |
| ---------------- | ---------- |
| Time Complexity  | **O(n)**   |
| Space Complexity | **O(1)**   |

// Definition for singly-linked list node
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to delete the n-th node from the end of the list
func deleteNthNodeFromEnd(_ head: Node?, _ n: Int) -> Node? {
    var fast = head
    var slow = head

    // Move fast pointer n steps ahead
    for _ in 0..<n {
        fast = fast?.next
    }

    // If fast is nil, it means we need to delete the head
    if fast == nil {
        return head?.next
    }

    // Move both pointers until fast reaches the end
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }

    // Delete the n-th node from the end
    slow?.next = slow?.next?.next
    return head
}

// Function to print the list
func printList(_ head: Node?) {
    var curr = head
    while curr != nil {
        print(curr!.data, terminator: " ")
        curr = curr?.next
    }
    print()
}

// Example usage
let head = Node(1)
head.next = Node(2)
head.next?.next = Node(3)
head.next?.next?.next = Node(4)
head.next?.next?.next?.next = Node(5)

print("Original list:")
printList(head)

let newHead = deleteNthNodeFromEnd(head, 4)

print("List after deleting 4th node from the end:")
printList(newHead)
