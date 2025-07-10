//
//  Merge k Sorted Lists.swift
//  
//
//  Created by Apple on 10/07/25.
//

import Foundation

Using Divide and Conquer (Works better for equal sized lists)

The idea is to use divide and conquer by recursively splitting the k lists into two halves until we have pairs of lists to merge, then merge these pairs using a two-way merge procedure (similar to merge sort's merge step), and continue this process back up through the recursion tree until all lists are merged into a single sorted list.
Step by step approach:

Split k lists into two parts: lists[0...mid] and lists[mid+1...end].
Recursively merge the left half of lists to get first sorted list.
Recursively merge the right half of lists to get second sorted list.
Merge the above two sorted lists using two-pointer approach.
Return the final merged sorted list.

class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

// Function to merge two sorted linked lists
func mergeTwo(_ head1: Node?, _ head2: Node?) -> Node? {
    let dummy = Node(-1)
    var current: Node? = dummy
    var h1 = head1
    var h2 = head2

    while let node1 = h1, let node2 = h2 {
        if node1.data <= node2.data {
            current?.next = node1
            h1 = node1.next
        } else {
            current?.next = node2
            h2 = node2.next
        }
        current = current?.next
    }

    current?.next = h1 ?? h2
    return dummy.next
}

// Recursive function to merge k lists from index i to j
func mergeListsRecur(_ i: Int, _ j: Int, _ arr: [Node?]) -> Node? {
    if i == j {
        return arr[i]
    }

    let mid = i + (j - i) / 2
    let head1 = mergeListsRecur(i, mid, arr)
    let head2 = mergeListsRecur(mid + 1, j, arr)
    return mergeTwo(head1, head2)
}

// Function to merge K sorted linked lists
func mergeKLists(_ arr: [Node?]) -> Node? {
    if arr.isEmpty {
        return nil
    }
    return mergeListsRecur(0, arr.count - 1, arr)
}

// Helper to print a linked list
func printList(_ head: Node?) {
    var current = head
    while let node = current {
        print(node.data, terminator: " ")
        current = node.next
    }
    print()
}

// Main test
let k = 3
var arr = [Node?](repeating: nil, count: k)

arr[0] = Node(1)
arr[0]?.next = Node(3)
arr[0]?.next?.next = Node(5)
arr[0]?.next?.next?.next = Node(7)

arr[1] = Node(2)
arr[1]?.next = Node(4)
arr[1]?.next?.next = Node(6)
arr[1]?.next?.next?.next = Node(8)

arr[2] = Node(0)
arr[2]?.next = Node(9)
arr[2]?.next?.next = Node(10)
arr[2]?.next?.next?.next = Node(11)

if let mergedHead = mergeKLists(arr) {
    printList(mergedHead)
}


// 0 1 2 3 4 5 6 7 8 9 10 11

Time Complexity: O(N log k)
Where N is the total number of nodes and k is the number of lists.
Space Complexity: O(1) auxiliary (no new nodes created), but stack depth is O(log k) due to recursion.
