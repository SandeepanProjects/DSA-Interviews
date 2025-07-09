//
//  Longest Common Prefix.swift
//  
//
//  Created by Apple on 09/07/25.
//

import Foundation

Input: arr[] = [“geeksforgeeks”, “geeks”, “geek”, “geezer”]
Output: “gee”
Explanation: “gee” is the longest common prefix in all the given strings: “geeksforgeeks”, “geeks”, “geeks” and “geezer”.


Operation    Complexity
Time    O(n · m)
Space    O(n · m)


using Trie

The idea is to insert all the string one by one in the trie. After inserting we perform a walk on the trie. In this walk, we go deeper until we find a node having more than 1 children(branching occurs) or 0 children (one of the string gets exhausted). This is because the characters (nodes in trie) which are present in the longest common prefix must be the single child of its parent, i.e- there should not be branching in any of these nodes.

class TrieNode {
    var children: [TrieNode?] = Array(repeating: nil, count: 26)
    var childCount: Int = 0
    var isLeaf: Bool = false
}

func insert(_ root: TrieNode, _ word: String) {
    var current = root
    for ch in word {
        let idx = Int(ch.asciiValue! - Character("a").asciiValue!)
        if current.children[idx] == nil {
            current.children[idx] = TrieNode()
            current.childCount += 1
        }
        current = current.children[idx]!
    }
    current.isLeaf = true
}

func walkTrie(_ root: TrieNode, _ word: String) -> String {
    var current = root
    var i = 0
    let chars = Array(word)
    
    while current.childCount == 1 && !current.isLeaf {
        let idx = Int(chars[i].asciiValue! - Character("a").asciiValue!)
        guard let next = current.children[idx] else { break }
        current = next
        i += 1
    }
    
    return String(chars[0..<i])
}

func longestCommonPrefix(_ arr: [String]) -> String {
    if arr.isEmpty { return "" }
    
    let root = TrieNode()
    
    for word in arr {
        insert(root, word)
    }
    
    return walkTrie(root, arr[0])
}

// Example usage:
let arr = ["geeksforgeeks", "geeks", "geek", "geezer"]
print(longestCommonPrefix(arr)) // Output: "gee"

