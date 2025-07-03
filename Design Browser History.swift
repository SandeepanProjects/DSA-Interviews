//
//  Design Browser History.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Using a Doubly Linkeded List


Create a doubly linked list:

Node class represents each URL visited with references to the previous and next nodes.
BrowserHistory(string homepage):

Initialize the browser with the given homepage by creating a new node and setting it as the starting page.
Set the current pointer (curr) to point to the homepage node.
visit(string url):

When visiting a new URL, create a new node for the URL.
Set the previous pointer of the new node to the current node.
Set the next pointer of the current node to the new node.
Move the curr pointer to the new node.
back(int steps):

To move backward, iterate the pointer steps times.
In each step, move the pointer to the previous node if it's not null.
After moving, update the curr pointer to the new node.
Return the URL stored in the curr node.

forward(int steps):
                                                    
To move forward, iterate the pointer steps times.
In each step, move the pointer to the next node if it's not null.
After moving, update the curr pointer to the new node.
Return the URL stored in the curr node.

         
Time Complexity: The visit function takes O(1) as it involves adding a node. The back and forward functions take O(min(steps, b)) and O(min(steps, f)) respectively, where b is the number of steps backward and f is the number of steps forward.
Space Complexity: The doubly linked list uses O(n) space, where n is the total number of visited URLs. No additional auxiliary space is used beyond the linked list.

// Node class for Doubly Linked List
class Node {
    var data: String
    var prev: Node?
    var next: Node?
    
    init(_ data: String) {
        self.data = data
    }
}

// BrowserHistory class
class BrowserHistory {
    private var curr: Node
    
    // Initialize with homepage
    init(_ homepage: String) {
        curr = Node(homepage)
    }
    
    // Visit a new URL
    func visit(_ url: String) {
        let newNode = Node(url)
        curr.next = newNode
        newNode.prev = curr
        curr = newNode
    }
    
    // Move back by 'steps'
    func back(_ steps: Int) -> String {
        var steps = steps
        var trav = curr
        while let prev = trav.prev, steps > 0 {
            trav = prev
            steps -= 1
        }
        curr = trav
        return curr.data
    }
    
    // Move forward by 'steps'
    func forward(_ steps: Int) -> String {
        var steps = steps
        var trav = curr
        while let next = trav.next, steps > 0 {
            trav = next
            steps -= 1
        }
        curr = trav
        return curr.data
    }
}

// Example usage
let obj = BrowserHistory("gfg.org")

obj.visit("google.com")
obj.visit("facebook.com")
obj.visit("youtube.com")

print(obj.back(1))       // facebook.com
print(obj.back(1))       // google.com
print(obj.forward(1))    // facebook.com

obj.visit("linkedin.com")
print(obj.forward(2))    // linkedin.com
print(obj.back(2))       // google.com
print(obj.back(7))       // gfg.org
