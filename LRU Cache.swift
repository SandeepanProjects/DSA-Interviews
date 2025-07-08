//
//  LRU Cache.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

The LRUCache class has two methods get() and put() which are defined as follows.

LRUCache (Capacity c): Initialize LRU cache with positive size capacity c.
get(key): returns the value of the key if it already exists in the cache otherwise returns -1.
put(key, value): if the key is already present, update its value. If not present, add the key-value pair to the cache. If the cache reaches its capacity it should remove the key-value pair with the lowest priority.
Example:

Input: [LRUCache cache = new LRUCache(2) , put(1 ,1) , put(2 ,2) , get(1) , put(3 ,3) , get(2) , put(4 ,4) , get(1) , get(3) , get(4)]
Output: [1 ,-1, -1, 3, 4]
Explanation: The values mentioned in the output are the values returned by get operations.

Initialize LRUCache class with  capacity = 2.
cache.put(1, 1):  (key, pair) = (1,1) inserted and has the highest priority.
cache.put(2, 2):  (key , pair) = (2,2) inserted and has the highest priority.
cache.get(1):  For key 1, value is 1, so 1 returned and (1,1) moved to the highest priority.
cache.put(3, 3):  Since cache is full, remove least recently used that is (2,2),  (3,3) inserted with the highest priority.
cache.get(2): returns -1 (key 2 not found)
cache.put(4, 4): Since the cache is full, remove least recently used that is (1,1). (4,5) inserted with the highest priority.
cache.get(1): return -1 (not found)
cache.get(3): return 3 , (3,3) will moved to the highest priority.
cache.get(4): return 4 ,  (4,4) moved to the highest priority.

We use an array of triplets, where the items are key, value and priority
                                            
get(key) :  We linearly search the key. If we find the item, we change priorities of all impacted and make the new item as the highest priority.
put(key):   If there is space available, we insert at the end. If not, we linearly search items of the lowest priority and replace that item with the new one. We change priorities of all and make the new item as the highest priority.
                                            
Time Complexities of both the operations is O(n)
                                            
Can we make both operations in O(1) time?  we can think of hashing. With hashing, we can insert, get and delete in O(1) time, but changing priorities would take linear time. We can think of  using heap along with hashing for priorities. We can find and remove the least recently used (lowest priority) in O(Log n) time which is more than O(1) and changing priority in the heap would also be required.
                                            
Using Doubly Linked List and Hashing

The idea is to keep inserting the key-value pair at the head of the doubly linked list. When a node is accessed or added, it is moved to the head of the list (right after the dummy head node). This marks it as the most recently used. When the cache exceeds its capacity, the node at the tail (right before the dummy tail node) is removed as it represents the least recently used item.

class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    private let capacity: Int
    private var cache = [Int: Node]()
    private let head = Node(-1, -1)
    private let tail = Node(-1, -1)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    private func add(_ node: Node) {
        // Insert node right after head (most recently used)
        let nextNode = head.next
        head.next = node
        node.prev = head
        node.next = nextNode
        nextNode?.prev = node
    }
    
    private func remove(_ node: Node) {
        // Remove node from the list
        let prevNode = node.prev
        let nextNode = node.next
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        remove(node)
        add(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingNode = cache[key] {
            remove(existingNode)
            cache[key] = nil
        }
        
        if cache.count >= capacity {
            if let lruNode = tail.prev, lruNode !== head {
                remove(lruNode)
                cache[lruNode.key] = nil
            }
        }
        
        let newNode = Node(key, value)
        add(newNode)
        cache[key] = newNode
    }
}

// Example usage
let cache = LRUCache(2)

cache.put(1, 1)
cache.put(2, 2)
print(cache.get(1))  // 1
cache.put(3, 3)      // removes key 2
print(cache.get(2))  // -1
cache.put(4, 4)      // removes key 1
print(cache.get(1))  // -1
print(cache.get(3))  // 3
print(cache.get(4))  // 4

