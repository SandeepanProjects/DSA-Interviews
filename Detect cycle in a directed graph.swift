//
//  Detect cycle in a directed graph.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric    | Complexity |
| --------- | ---------- |
| **Time**  | `O(V + E)` |
| **Space** | `O(V + E)` |

// Function to construct adjacency list from edge list
func constructAdj(_ V: Int, _ edges: [[Int]]) -> [[Int]] {
    var adj = [[Int]](repeating: [], count: V)
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v) // Directed edge u -> v
    }
    return adj
}

// Function to check for cycle using Kahn's Algorithm (BFS-based Topological Sort)
func isCyclic(_ V: Int, _ edges: [[Int]]) -> Bool {
    let adj = constructAdj(V, edges)
    var inDegree = [Int](repeating: 0, count: V)
    var queue = [Int]()
    var visited = 0

    // Calculate in-degree of each node
    for u in 0..<V {
        for v in adj[u] {
            inDegree[v] += 1
        }
    }

    // Enqueue nodes with in-degree 0
    for u in 0..<V {
        if inDegree[u] == 0 {
            queue.append(u)
        }
    }

    // Perform BFS (Topological Sort)
    while !queue.isEmpty {
        let u = queue.removeFirst()
        visited += 1

        for v in adj[u] {
            inDegree[v] -= 1
            if inDegree[v] == 0 {
                queue.append(v)
            }
        }
    }

    // If visited != V, graph has a cycle
    return visited != V
}

// Example usage
let V = 4
let edges = [[0, 1], [0, 2], [1, 2], [2, 0], [2, 3]]

let hasCycle = isCyclic(V, edges)
print(hasCycle ? "true" : "false") // Output: true
