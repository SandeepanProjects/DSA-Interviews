//
//  Copy List with Random Pointer.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

By Inserting Nodes In-place - O(3n) Time and O(1) Space

The idea is to create duplicate of a node and instead of storing in a separate hash table, we can insert it in between the original node and the next node. Now, we will have new nodes at alternate positions.

Now for a node X its duplicate will be X->next and the random pointer of the duplicate should point to X->random->next (as that is the duplicate of X->random). So, iterate over the entire linked list to update the random pointer of all the cloned nodes and then iterate again to separate the original linked list and the cloned linked list.
            

import Foundation
            
class Node {
    var data: Int
    var next: Node?
    var random: Node?
    
    init(_ data: Int) {
        self.data = data
        self.next = nil
        self.random = nil
    }
}

// Function to clone the linked list
func cloneLinkedList(_ head: Node?) -> Node? {
    guard let head = head else {
        return nil
    }
    
    // Step 1: Create new nodes and insert them after each original node
    var curr: Node? = head
    while curr != nil {
        let newNode = Node(curr!.data)
        newNode.next = curr!.next
        curr!.next = newNode
        curr = newNode.next
    }
    
    // Step 2: Set random pointers for the cloned nodes
    curr = head
    while curr != nil {
        if let random = curr!.random {
            curr!.next?.random = random.next
        }
        curr = curr!.next?.next
    }
    
    // Step 3: Separate the cloned list from the original list
    curr = head
    let clonedHead: Node? = head.next
    var clone: Node? = clonedHead
    while clone?.next != nil {
        curr!.next = curr!.next?.next
        clone!.next = clone!.next?.next
        curr = curr!.next
        clone = clone!.next
    }
    curr!.next = nil
    clone!.next = nil
    
    return clonedHead
}

// Function to print the linked list
func printList(_ head: Node?) {
    var curr = head
    while curr != nil {
        let randomVal = curr!.random?.data != nil ? "\(curr!.random!.data)" : "null"
        print("\(curr!.data)(\(randomVal))", terminator: "")
        if curr!.next != nil {
            print(" -> ", terminator: "")
        }
        curr = curr!.next
    }
    print()
}

// Example usage
let head = Node(1)
head.next = Node(2)
head.next!.next = Node(3)
head.next!.next!.next = Node(4)
head.next!.next!.next!.next = Node(5)

head.random = head.next!.next
head.next!.random = head
head.next!.next!.random = head.next!.next!.next!.next
head.next!.next!.next!.random = head.next!.next
head.next!.next!.next!.next!.random = head.next

print("Original linked list:")
printList(head)

if let cloned = cloneLinkedList(head) {
    print("Cloned linked list:")
    printList(cloned)
}
