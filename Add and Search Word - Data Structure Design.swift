//
//  Add and Search Word - Data Structure Design.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

Design a data structure GFGDictionary that enables to support the feature of adding new words and searching for words. The GFGDictionary class should have the following implementation:

GFGDictionary(): constructor to initialize the object
void insertWord(word): function to insert word into the data structure.
bool findWord(word): function to return true if word is present in the data structure, else return false. The word may contain dots '.' which can be matched with any letter.

                                                                                                                    
Time Complexity: O(M * (26 ^ N)), where M is the number of words to be searched, and N is the length of the word.
Auxiliary Space: O(M)


class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
}

// GFGDictionary class
class GFGDictionary {
    private let root = TrieNode()
    
    // Insert a word into the Trie
    func insertWord(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    // Find a word in the Trie (supports '.' wildcard)
    func findWord(_ word: String) -> Bool {
        func dfs(_ node: TrieNode, _ index: Int) -> Bool {
            if index == word.count {
                return node.isEndOfWord
            }
            
            let chars = Array(word)
            let currentChar = chars[index]
            
            if currentChar == "." {
                for child in node.children.values {
                    if dfs(child, index + 1) {
                        return true
                    }
                }
            } else if let child = node.children[currentChar] {
                return dfs(child, index + 1)
            }
            
            return false
        }
        
        return dfs(root, 0)
    }
}

// Sample Usage
let gfgDict = GFGDictionary()
gfgDict.insertWord("bad")
gfgDict.insertWord("dad")
gfgDict.insertWord("mad")

print(gfgDict.findWord("pad"))  // false
print(gfgDict.findWord("bad"))  // true
print(gfgDict.findWord(".ad"))  // true
print(gfgDict.findWord("b.."))  // true
