//
//  Detect cycle in an undirected graph.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric    | Complexity |
| --------- | ---------- |
| **Time**  | `O(V + E)` |
| **Space** | `O(V + E)` |


// Helper function to check for cycle using DFS
func isCycleUtil(_ v: Int, _ adj: [[Int]], _ visited: inout [Bool], _ parent: Int) -> Bool {
    visited[v] = true

    for neighbor in adj[v] {
        if !visited[neighbor] {
            if isCycleUtil(neighbor, adj, &visited, v) {
                return true
            }
        } else if neighbor != parent {
            return true
        }
    }

    return false
}

// Function to construct adjacency list from edge list
func constructAdj(_ V: Int, _ edges: [(Int, Int)]) -> [[Int]] {
    var adj = [[Int]](repeating: [], count: V)
    for (u, v) in edges {
        adj[u].append(v)
        adj[v].append(u)  // Undirected edge
    }
    return adj
}

// Function to check if graph contains a cycle
func isCycle(_ V: Int, _ edges: [(Int, Int)]) -> Bool {
    let adj = constructAdj(V, edges)
    var visited = [Bool](repeating: false, count: V)

    for u in 0..<V {
        if !visited[u] {
            if isCycleUtil(u, adj, &visited, -1) {
                return true
            }
        }
    }

    return false
}

// Example usage
let V = 5
let edges: [(Int, Int)] = [(0, 1), (0, 2), (0, 3), (1, 2), (3, 4)]

if isCycle(V, edges) {
    print("true")
} else {
    print("false")
}
