//
//  Middle of the Linked List.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

By Tortoise and Hare Algorithm - O(n) time and O(1) space:

// Definition for singly-linked list node
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to get the middle of the linked list
func getMiddle(_ head: Node?) -> Int? {
    var slowPtr = head
    var fastPtr = head

    while fastPtr != nil && fastPtr?.next != nil {
        slowPtr = slowPtr?.next
        fastPtr = fastPtr?.next?.next
    }

    return slowPtr?.data
}

// Example usage
func main() {
    let head = Node(10)
    head.next = Node(20)
    head.next?.next = Node(30)
    head.next?.next?.next = Node(40)
    head.next?.next?.next?.next = Node(50)
    head.next?.next?.next?.next?.next = Node(60)

    if let middle = getMiddle(head) {
        print("Middle element is: \(middle)")
    } else {
        print("List is empty.")
    }
}

main()
