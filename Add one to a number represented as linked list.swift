//
//  Add one to a number represented as linked list.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

Using Iterative Method - O(n) Time and O(1) Space:

The idea is to start by reversing the entire linked list. This allows you to begin processing the digits from the least significant to the most significant. Add 1 to the value of this head node. If this addition results in a carry (i.e., the new value exceeds 9), update the current node to store only the last digit (value modulo 10) and pass the carry to the next node. Continue traversing subsequent nodes until we reach the end of the list or the carry becomes 0. Reverse the linked list again to restore it to its original order.


// Node class for singly linked list
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to reverse the linked list
func reverse(_ head: Node?) -> Node? {
    var current = head
    var previous: Node? = nil
    var next: Node? = nil

    while current != nil {
        next = current?.next
        current?.next = previous
        previous = current
        current = next
    }

    return previous
}

// Function to add one to the linked list
func addOneUtil(_ head: Node?) -> Node? {
    var current = head
    var carry = 1
    var last: Node? = nil

    while current != nil {
        let sum = carry + (current?.data ?? 0)
        carry = sum >= 10 ? 1 : 0
        current?.data = sum % 10
        last = current
        current = current?.next
    }

    if carry > 0 {
        last?.next = Node(carry)
    }

    return head
}

// Main function to add one
func addOne(_ head: Node?) -> Node? {
    let reversedHead = reverse(head)
    let addedHead = addOneUtil(reversedHead)
    return reverse(addedHead)
}

// Function to print the linked list
func printList(_ head: Node?) {
    var current = head
    while current != nil {
        print(current!.data, terminator: " ")
        current = current?.next
    }
    print()
}

// Example usage
let head = Node(1)
head.next = Node(9)
head.next?.next = Node(9)
head.next?.next?.next = Node(9)

let resultHead = addOne(head)
printList(resultHead)
