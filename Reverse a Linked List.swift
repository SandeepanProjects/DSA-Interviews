//
//  Reverse a Linked List.swift
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

// Function to reverse the linked list iteratively
func reverseList(_ head: Node?) -> Node? {
    var prev: Node? = nil
    var curr = head

    while curr != nil {
        let nextNode = curr?.next
        curr?.next = prev
        prev = curr
        curr = nextNode
    }

    return prev
}

// Function to print the linked list
func printList(_ node: Node?) {
    var node = node
    while node != nil {
        print(" \(node!.data)", terminator: "")
        node = node?.next
    }
    print()
}

// Test the code
let head = Node(1)
head.next = Node(2)
head.next?.next = Node(3)
head.next?.next?.next = Node(4)
head.next?.next?.next?.next = Node(5)

print("Given Linked List:", terminator: "")
printList(head)

let reversedHead = reverseList(head)

print("Reversed Linked List:", terminator: "")
printList(reversedHead)
