//
//  Topological Sort.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric    | Complexity |
| --------- | ---------- |
| **Time**  | `O(V + E)` |
| **Space** | `O(V + E)` |


Kahn's Algorithm (BFS-based Topological Sort)

This is often the preferred approach in practice because:

It avoids recursion (no stack overflow)
It naturally detects cycles


// Function to construct adjacency list from edge list
func constructAdj(_ V: Int, _ edges: [[Int]]) -> [[Int]] {
    var adj = [[Int]](repeating: [], count: V)
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
    }
    return adj
}

// Kahn’s Algorithm for Topological Sorting
func topologicalSort(_ V: Int, _ edges: [[Int]]) -> [Int]? {
    let adj = constructAdj(V, edges)
    var inDegree = [Int](repeating: 0, count: V)

    // Compute in-degrees
    for u in 0..<V {
        for v in adj[u] {
            inDegree[v] += 1
        }
    }

    // Queue for all nodes with in-degree 0
    var queue: [Int] = []
    for i in 0..<V {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }

    var topoOrder: [Int] = []

    // BFS
    while !queue.isEmpty {
        let u = queue.removeFirst()
        topoOrder.append(u)

        for v in adj[u] {
            inDegree[v] -= 1
            if inDegree[v] == 0 {
                queue.append(v)
            }
        }
    }

    // If topological sort includes all vertices
    return topoOrder.count == V ? topoOrder : nil // Return nil if cycle detected
}

// Example usage
let V = 6
let edges = [[2, 3], [3, 1], [4, 0], [4, 1], [5, 0], [5, 2]]

if let result = topologicalSort(V, edges) {
    print("Topological Sort:", result.map { String($0) }.joined(separator: " "))
} else {
    print("Graph contains a cycle. Topological sort not possible.")
}
