//
//  Breadth First Search.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric             | Complexity                                       |
| ------------------ | ------------------------------------------------ |
| **Time**           | `O(V + E)`                                       |
| **Space**          | `O(V)`                                           |
| **Traversal Type** | Level-order / Shortest path in unweighted graphs |


func bfs(graph: [[Int]], start: Int) -> [Int] {
    let n = graph.count
    var visited = [Bool](repeating: false, count: n)
    var queue: [Int] = []
    var result: [Int] = []

    visited[start] = true
    queue.append(start)

    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node)

        for neighbor in graph[node] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append(neighbor)
            }
        }
    }

    return result
}

// Example usage:
// Graph as adjacency list (undirected or directed)
let graph = [
    [1, 2],     // Neighbors of node 0
    [0, 3, 4],  // Neighbors of node 1
    [0, 4],     // Neighbors of node 2
    [1, 5],     // Neighbors of node 3
    [1, 2, 5],  // Neighbors of node 4
    [3, 4]      // Neighbors of node 5
]

let traversal = bfs(graph: graph, start: 0)
print("BFS Traversal:", traversal)
