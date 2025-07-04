//
//  Implement Trie.swift
//  
//
//  Created by Apple on 04/07/25.
//

import Foundation

Implementation of Insert, Search and Prefix Searching Operations in Trie Data Structure

Now that we've learned how to insert words into a Trie, search for complete words, and perform prefix searches, let's do some hands-on practice.

We'll start by inserting the following words into the Trie: ["and", "ant", "do", "dad"].
Then, we'll search for the presence of these words: ["do", "gee", "bat"].
Finally, we'll check for the following prefixes: ["ge", "ba", "do", "de"].
Steps-by-step approach:

Create a root node with the help of TrieNode() constructor.
Store a collection of strings that have to be inserted in the Trie in a vector of strings say, arr.
Inserting all strings in Trie with the help of the insertKey() function,
Search strings with the help of searchKey() function.
Prefix searching with the help of isPrefix() function.
                                                                    
                                                                    
class TrieNode {
    var children: [TrieNode?]
    var isLeaf: Bool
    
    init() {
        self.children = Array(repeating: nil, count: 26)
        self.isLeaf = false
    }
}

class Trie {
    private var root: TrieNode
    
    init() {
        self.root = TrieNode()
    }
    
    // Insert a key into the Trie
    func insert(_ key: String) {
        var current = root
        for char in key {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if current.children[index] == nil {
                current.children[index] = TrieNode()
            }
            current = current.children[index]!
        }
        current.isLeaf = true
    }
    
    // Search a key in the Trie
    func search(_ key: String) -> Bool {
        var current = root
        for char in key {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            guard let nextNode = current.children[index] else {
                return false
            }
            current = nextNode
        }
        return current.isLeaf
    }
    
    // Check if a prefix exists in the Trie
    func isPrefix(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            guard let nextNode = current.children[index] else {
                return false
            }
            current = nextNode
        }
        return true
    }
}

// Example usage:
let trie = Trie()
let words = ["and", "ant", "do", "dad"]
for word in words {
    trie.insert(word)
}

let searchKeys = ["do", "gee", "bat"]
for key in searchKeys {
    print(trie.search(key) ? "true" : "false", terminator: " ")
}
print()

let prefixKeys = ["ge", "ba", "do", "de"]
for key in prefixKeys {
    print(trie.isPrefix(key) ? "true" : "false", terminator: " ")
}


Operation    Time Complexity
Insertion    O(n) Here n is the length of the string inserted
Searching    O(n) Here n is the length of the string searched
Prefix Searching

O(n) Here n is the length of the string searched
