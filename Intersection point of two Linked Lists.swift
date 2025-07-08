//
//  Intersection point of two Linked Lists.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

Using Two Pointer Technique - O(m + n) Time and O(1) Space

The idea is to traverse the two given linked lists simultaneously, using two pointers. When one pointer reaches the end of its list, it is reassigned to the head of the other list. This process continues until the two pointers meet, which indicates that they have reached the intersection point.
Follow the steps below to solve the problem:

Initialize two pointers ptr1 and ptr2 at head1 and head2 respectively.
Traverse through the lists, one node at a time.
When ptr1 reaches the end of a list, then redirect it to head2.
Similarly, when ptr2 reaches the end of a list, redirect it to the head1.
Once both of them go through reassigning, they will be at equal distance from the collision point.
If at any node ptr1 meets ptr2, then it is the intersection node.
After the second iteration if there is no intersection node , returns NULL.
                                
class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

func intersectPoint(_ head1: Node?, _ head2: Node?) -> Node? {
    var ptr1 = head1
    var ptr2 = head2
    
    // If either list is empty, return nil
    if ptr1 == nil || ptr2 == nil {
        return nil
    }
    
    // Traverse until both pointers meet or both are nil
    while ptr1 !== ptr2 {
        ptr1 = ptr1 == nil ? head2 : ptr1?.next
        ptr2 = ptr2 == nil ? head1 : ptr2?.next
    }
    
    return ptr1
}

// Example usage

// Create first list: 10 -> 15 -> 30
let head1 = Node(10)
head1.next = Node(15)
head1.next?.next = Node(30)

// Create second list: 3 -> 6 -> 9
let head2 = Node(3)
head2.next = Node(6)
head2.next?.next = Node(9)

// Connect second list to first list at node with value 15
head2.next?.next?.next = head1.next

// Find intersection
if let intersection = intersectPoint(head1, head2) {
    print(intersection.data)  // Output: 15
} else {
    print("-1")
}

