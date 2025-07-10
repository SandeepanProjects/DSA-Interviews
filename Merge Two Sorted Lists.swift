//
//  Merge Two Sorted Lists.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Using Iterative Merge - O(n+m) Time and O(1) Space

The idea is to iteratively merge two sorted linked lists using a dummy node to simplify the process. A current pointer tracks the last node of the merged list. We compare the nodes from both lists and append the smaller node to the merged list. Once one list is fully traversed, the remaining nodes from the other list are appended. The merged list is returned starting from the node after the dummy node. Please refer to Merge two sorted lists with O(1) auxiliary space.

class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to merge two sorted linked lists
func sortedMerge(_ head1: Node?, _ head2: Node?) -> Node? {
    let dummy = Node(-1)
    var curr: Node? = dummy
    var h1 = head1
    var h2 = head2

    // Traverse both lists
    while let node1 = h1, let node2 = h2 {
        if node1.data <= node2.data {
            curr?.next = node1
            h1 = node1.next
        } else {
            curr?.next = node2
            h2 = node2.next
        }
        curr = curr?.next
    }

    // Append the remaining nodes
    curr?.next = h1 ?? h2

    return dummy.next
}

// Helper function to print the linked list
func printList(_ head: Node?) {
    var current = head
    while let node = current {
        print(node.data, terminator: " ")
        current = node.next
    }
    print()
}

// Test the function
let head1 = Node(5)
head1.next = Node(10)
head1.next?.next = Node(15)
head1.next?.next?.next = Node(40)

let head2 = Node(2)
head2.next = Node(3)
head2.next?.next = Node(20)

if let merged = sortedMerge(head1, head2) {
    printList(merged)
}
