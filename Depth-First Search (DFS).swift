//
//  Depth-First Search (DFS).swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

| Metric             | Complexity         |
| ------------------ | ------------------ |
| **Time**           | `O(V + E)`         |
| **Space**          | `O(V)`             |
| **Traversal Type** | Deepest path first |


func dfs(graph: [[Int]], start: Int, visited: inout [Bool], result: inout [Int]) {
    visited[start] = true
    result.append(start)

    for neighbor in graph[start] {
        if !visited[neighbor] {
            dfs(graph: graph, start: neighbor, visited: &visited, result: &result)
        }
    }
}

// DFS Wrapper
func depthFirstSearch(graph: [[Int]], start: Int) -> [Int] {
    var visited = [Bool](repeating: false, count: graph.count)
    var result: [Int] = []
    dfs(graph: graph, start: start, visited: &visited, result: &result)
    return result
}

// Example usage
let graph = [
    [1, 2],     // 0
    [0, 3, 4],  // 1
    [0, 4],     // 2
    [1, 5],     // 3
    [1, 2, 5],  // 4
    [3, 4]      // 5
]

let traversal = depthFirstSearch(graph: graph, start: 0)
print("DFS Traversal:", traversal)
