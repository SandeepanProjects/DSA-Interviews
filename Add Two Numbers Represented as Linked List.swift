//
//  Add Two Numbers Represented as Linked List.swift
//  
//
//  Created by Apple on 29/06/25.
//

import Foundation

By storing sum on the longer list - O(m + n) Time and O(1) Space

The idea is to iterate over both the linked list simultaneously and instead of creating a new linked list to store the result, we can store the result in the longer list itself. If we are left with some carry after traversing both the linked list, we can create a new node and append it at the end of the longer linked list.

// Node class
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Reverse a linked list
func reverse(_ head: Node?) -> Node? {
    var prev: Node? = nil
    var curr = head

    while let current = curr {
        let nextNode = current.next
        current.next = prev
        prev = current
        curr = nextNode
    }

    return prev
}

// Trim leading zeros
func trimLeadingZeros(_ head: Node?) -> Node? {
    var current = head
    while let node = current, node.data == 0 {
        current = node.next
    }
    return current
}

// Count nodes in a linked list
func countNodes(_ head: Node?) -> Int {
    var count = 0
    var current = head

    while current != nil {
        count += 1
        current = current?.next
    }

    return count
}

// Add two numbers represented as linked lists
func addTwoLists(_ num1: Node?, _ num2: Node?) -> Node? {
    var num1 = trimLeadingZeros(num1)
    var num2 = trimLeadingZeros(num2)

    let len1 = countNodes(num1)
    let len2 = countNodes(num2)

    // Ensure num1 is the longer list
    if len1 < len2 {
        return addTwoLists(num2, num1)
    }

    num1 = reverse(num1)
    num2 = reverse(num2)

    var carry = 0
    var head = num1
    var current1 = num1
    var current2 = num2

    while current1 != nil || carry != 0 {
        current1!.data += carry

        if let node2 = current2 {
            current1!.data += node2.data
            current2 = node2.next
        }

        carry = current1!.data / 10
        current1!.data %= 10

        if current1!.next == nil && (carry != 0 || current2 != nil) {
            current1!.next = Node(0)
        }

        current1 = current1!.next
    }

    return reverse(head)
}

// Print a linked list
func printList(_ head: Node?) {
    var current = head
    while let node = current {
        print(node.data, terminator: " ")
        current = node.next
    }
    print()
}

// Example usage
let num1 = Node(1)
num1.next = Node(2)
num1.next?.next = Node(3) // Represents 123

let num2 = Node(9)
num2.next = Node(9)
num2.next?.next = Node(9) // Represents 999

if let sumList = addTwoLists(num1, num2) {
    print("Sum: ", terminator: "")
    printList(sumList) // Output: 1 1 2 2 (i.e. 1122)
}

