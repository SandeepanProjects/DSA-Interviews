//
//  Implement Queue Using Stacks.swift
//  
//
//  Created by Apple on 26/07/25.
//

import Foundation

| Operation | Time Complexity | Space Complexity    |
| --------- | --------------- | ------------------- |
| Enqueue   | `O(1)`          | `O(1)`              |
| Dequeue   | `O(n)`          | `O(n)` (call stack) |

class Queue {
    private var s: [Int] = []

    // Enqueue an item to the queue
    func enqueue(_ x: Int) {
        s.append(x)
    }

    // Dequeue an item from the queue using recursion
    func dequeue() -> Int {
        guard !s.isEmpty else {
            return -1
        }

        // Pop the top element
        let x = s.removeLast()

        // If the stack is now empty, return the last item
        if s.isEmpty {
            return x
        }

        // Recursively get the front item
        let item = dequeue()

        // Push the current top back
        s.append(x)

        return item
    }
}

// Example usage
let q = Queue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

print(q.dequeue())  // Output: 1
print(q.dequeue())  // Output: 2
print(q.dequeue())  // Output: 3
