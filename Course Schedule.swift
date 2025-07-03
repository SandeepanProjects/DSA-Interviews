//
//  Course Schedule.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Given n courses, labeled from 0 to n - 1 and an array prerequisites[] where prerequisites[i] = [x, y] indicates that we need to take course y first if we want to take course x. Return the ordering of courses we should take to complete all courses. If there are multiple solutions, return any of them. If it is impossible to finish all courses, return an empty array.

Using DFS - O(m+n) Time and O(m+n) Space

DFS is used in this task ordering problem because it naturally supports topological sorting by recursively visiting each task’s dependencies before marking the task itself as complete. This ensures that every prerequisite is processed before the current task, helping to build a valid order. Additionally, DFS makes it easy to detect cycles by tracking the visitation state of each node—if we revisit a node that is still being explored (marked as "visiting"), a cycle exists, and no valid order is possible. Once all dependencies of a task have been visited, the task is added to a stack, which, when reversed, gives the correct topological order of tasks.


func dfs(_ node: Int, _ adj: [[Int]], _ visited: inout [Int], _ stack: inout [Int]) -> Bool {
    // mark as visiting
    visited[node] = 1
    
    for neighbor in adj[node] {
        if visited[neighbor] == 1 {
            // cycle detected
            return false
        } else if visited[neighbor] == 0 {
            if !dfs(neighbor, adj, &visited, &stack) {
                // cycle in deeper recursion
                return false
            }
        }
    }
    
    // mark as visited
    visited[node] = 2
    stack.append(node)
    return true
}

func findOrder(_ n: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adj = Array(repeating: [Int](), count: n)
    for pre in prerequisites {
        let dest = pre[0]
        let src = pre[1]
        adj[src].append(dest)
    }
    
    var visited = Array(repeating: 0, count: n) // 0 = unvisited, 1 = visiting, 2 = visited
    var stack = [Int]()
    
    for i in 0..<n {
        if visited[i] == 0 {
            if !dfs(i, adj, &visited, &stack) {
                // cycle detected
                return []
            }
        }
    }
    
    // reverse stack to get correct order
    return stack.reversed()
}

// Example usage
let n = 4
let prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]

let order = findOrder(n, prerequisites)
for course in order {
    print(course, terminator: " ")
}
print()

