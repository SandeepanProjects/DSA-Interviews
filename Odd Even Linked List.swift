//
//  Odd Even Linked List.swift
//  
//
//  Created by Apple on 11/07/25.
//

import Foundation

Time Complexity: O(n), where n is the number of nodes — each node is visited once.
Space Complexity: O(1) — in-place rearrangement (no extra data structures except pointers).


// Definition for singly-linked list node
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to segregate even and odd nodes
func segregateEvenOdd(_ head: Node?) -> Node? {
    var head = head
    var resStart: Node? = nil
    var resEnd: Node? = nil
    var curr = head
    var prev: Node? = nil

    while curr != nil {
        let nextNode = curr!.next  // Save next node
        if curr!.data % 2 == 0 {
            // Remove from original list
            if prev != nil {
                prev!.next = curr!.next
            } else {
                head = curr!.next
            }

            // Append to result list (even list)
            curr!.next = nil
            if resStart == nil {
                resStart = curr
                resEnd = curr
            } else {
                resEnd!.next = curr
                resEnd = resEnd!.next
            }

            curr = nextNode
        } else {
            // Move to next if odd
            prev = curr
            curr = curr!.next
        }
    }

    // If there are no even nodes, return the original list
    guard let start = resStart else { return head }

    // Attach remaining odd list to even list
    resEnd!.next = head

    return start
}

// Function to print the linked list
func printList(_ node: Node?) {
    var node = node
    while node != nil {
        print(node!.data, terminator: " ")
        node = node!.next
    }
    print()
}

// Sample usage
let head = Node(0)
head.next = Node(1)
head.next?.next = Node(4)
head.next?.next?.next = Node(6)
head.next?.next?.next?.next = Node(9)
head.next?.next?.next?.next?.next = Node(10)
head.next?.next?.next?.next?.next?.next = Node(11)

print("Original Linked List: ", terminator: "")
printList(head)

let newHead = segregateEvenOdd(head)

print("Modified Linked List: ", terminator: "")
printList(newHead)
