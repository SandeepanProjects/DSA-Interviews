//
//  Clone Graph.swift
//  
//
//  Created by Apple on 01/07/25.
//

import Foundation

Using DFS traversal - O(V+E) Time and O(V) Space

In the DFS approach, the graph is cloned using recursion. We start from the given node and explore as far as possible along each branch before backtracking. A map (or dictionary) is used to keep track of already cloned nodes to avoid processing the same node multiple times and to handle cycles. When we encounter a node for the first time, we create a clone of it and store it in the map. Then, for each neighbor of that node, we recursively clone it and add the cloned neighbor to the current node’s clone. This ensures that all nodes are visited deeply before returning, and the graph structure is faithfully copied.

import Foundation

// Definition for a Node
class Node: Hashable {
    var val: Int
    var neighbors: [Node]
    
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
    
    // Conforming to Hashable
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// Dictionary to hold original node to its copy
var copies = [Node: Node]()

// Function to clone the graph
func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else {
        return nil
    }
    
    if let cloned = copies[node] {
        return cloned
    }
    
    let clone = Node(node.val)
    copies[node] = clone
    
    for neighbor in node.neighbors {
        if let clonedNeighbor = cloneGraph(neighbor) {
            clone.neighbors.append(clonedNeighbor)
        }
    }
    
    return clone
}

// Function to build a sample graph
func buildGraph() -> Node {
    let node1 = Node(0)
    let node2 = Node(1)
    let node3 = Node(2)
    let node4 = Node(3)
    
    node1.neighbors = [node2, node3]
    node2.neighbors = [node1, node3]
    node3.neighbors = [node1, node2, node4]
    node4.neighbors = [node3]
    
    return node1
}

// Compare two graphs for structural and value equality
func compareGraphs(_ node1: Node?, _ node2: Node?, _ visited: inout [Node: Node]) -> Bool {
    guard let node1 = node1, let node2 = node2 else {
        return node1 == nil && node2 == nil
    }
    
    if node1.val != node2.val || node1 === node2 {
        return false
    }
    
    visited[node1] = node2
    
    if node1.neighbors.count != node2.neighbors.count {
        return false
    }
    
    for i in 0..<node1.neighbors.count {
        let n1 = node1.neighbors[i]
        let n2 = node2.neighbors[i]
        
        if let visitedNeighbor = visited[n1] {
            if visitedNeighbor !== n2 {
                return false
            }
        } else {
            if !compareGraphs(n1, n2, &visited) {
                return false
            }
        }
    }
    
    return true
}

// Driver Code
let original = buildGraph()
if let cloned = cloneGraph(original) {
    var visited = [Node: Node]()
    print(compareGraphs(original, cloned, &visited) ? "true" : "false")
} else {
    print("false")
}

