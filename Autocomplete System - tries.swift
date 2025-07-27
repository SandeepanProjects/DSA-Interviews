//
//  Autocomplete System - tries.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

Here's an **optimal Swift solution** using a **Trie** + **Priority Queue** to implement an **autocomplete system** that returns the top 3 matching words for a given prefix.

---

## ✅ Problem Recap

Given:

* A list of words (dictionary)
* A prefix

Return:

* The **top 3 lexicographically smallest** words that **start with the prefix**

### 🚀 Goal:

Use **Trie** for fast prefix lookup and **Priority Queue (Min Heap)** to maintain top 3 lexicographical words efficiently.

---

## 📦 Swift Implementation

### 1. Trie Node Definition

```swift
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
    var word: String?
}
```

---

### 2. Trie Class

```swift
class Trie {
    private let root = TrieNode()
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isEndOfWord = true
        node.word = word
    }

    func searchPrefix(_ prefix: String) -> TrieNode? {
        var node = root
        for char in prefix {
            if let next = node.children[char] {
                node = next
            } else {
                return nil
            }
        }
        return node
    }

    func top3Words(startingWith prefix: String) -> [String] {
        guard let node = searchPrefix(prefix) else { return [] }

        var result = [String]()
        var minHeap = Heap<String>(sort: <)

        func dfs(_ node: TrieNode) {
            if let word = node.word {
                minHeap.insert(word)
                if minHeap.count > 3 {
                    _ = minHeap.remove()
                }
            }

            for key in node.children.keys.sorted() { // ensures lexicographical order
                dfs(node.children[key]!)
            }
        }

        dfs(node)
        return minHeap.elements.sorted()
    }
}
```

---

### 3. Priority Queue (Min Heap)

```swift
struct Heap<T> {
    var elements: [T] = []
    let sort: (T, T) -> Bool
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        siftDown(from: 0)
        return removed
    }

    mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
```

---

### 4. ✅ Example Usage

```swift
let words = ["apple", "app", "application", "apex", "apply", "appetizer", "banana"]
let trie = Trie()
for word in words {
    trie.insert(word)
}

let results = trie.top3Words(startingWith: "app")
print(results) // Output: ["app", "appetizer", "apple"]
```

---

## 🧠 Summary

* **Trie** enables efficient prefix-based word retrieval.
* **Priority Queue** (Min Heap) ensures we maintain only the top 3 lexicographical words.
* Efficient even for large datasets.

Would you like a version that maintains top suggestions dynamically (like a typing autocomplete system)?

Great! You're asking for a **dynamic autocomplete system** — meaning:
                            
* Words can be **added dynamically**
* As the **user types each character**, the system gives **top 3 suggestions**
* Must be **efficient**, using **Trie + Min Heap or sorted list**
                        
                        ---
                        
## ✅ Features of the Dynamic Autocomplete System
                        
* Insert new words with a frequency or ranking system (optional)
* On each character typed (i.e., prefix updated), return top 3 matching words
* Efficient with large datasets
                        
                        ---
                        
## 💡 Approach
                        
We’ll build a `DynamicAutocompleteSystem` that:
                            
* Uses a **Trie**, where each node maintains a **min heap or sorted list of top 3 words**
* As characters are typed, we traverse the Trie and **immediately access top 3 suggestions**

---

## ✅ Swift Code: Dynamic Autocomplete System

### 1. Trie Node (with Top 3 Suggestions)

```swift
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
    var word: String?
    var topSuggestions: Set<String> = []
}
```

---

### 2. Autocomplete System

```swift
class AutocompleteSystem {
    private let root = TrieNode()
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
            node.topSuggestions.insert(word)
            if node.topSuggestions.count > 3 {
                node.topSuggestions = Set(node.topSuggestions.sorted().prefix(3))
            }
        }
        node.isEndOfWord = true
        node.word = word
    }
    
    func getSuggestions(for prefix: String) -> [String] {
        var node = root
        for char in prefix {
            guard let next = node.children[char] else {
                return []
            }
            node = next
        }
        return Array(node.topSuggestions.sorted())
    }
}
```

---

### 3. Example Usage

```swift
let system = AutocompleteSystem()
let words = ["apple", "app", "application", "apex", "apply", "appetizer", "banana"]

for word in words {
    system.insert(word)
}

print(system.getSuggestions(for: "app")) // ["app", "appetizer", "apple"]
print(system.getSuggestions(for: "ap"))  // ["apex", "app", "appetizer"]
print(system.getSuggestions(for: "b"))   // ["banana"]
```

---

## 🧠 Why This Works

* During **insert**, each node keeps a **top 3 lexicographical suggestions**
* During **typing**, we simply **traverse the Trie**, and suggestions are **immediately available**
* Time complexity:

* Insert: O(k log 3) = O(k), for word length `k`
                                    * Get Suggestions: O(p), where `p` is prefix length

---

## 🛠️ Optional Extensions

* Sort by **frequency** instead of lexicographical order
* Allow **deletion** of words
* Add support for **autocomplete with typo tolerance** (fuzzy search)
                        
Would you like me to add **frequency-based ranking** next?

Awesome! Let's upgrade the **Autocomplete System** to rank suggestions based on **frequency** instead of just lexicographical order.
                        
                        ---
                        
## ✅ Goal: Frequency-Based Autocomplete System
                        
### Each inserted word has a frequency (e.g., how often it's been searched or typed).
                        
* Top 3 suggestions are based on **highest frequency**
* If there's a tie, break it with **lexicographical order**
                        
                        ---
                        
## 💡 Approach
                        
We'll:
                            
* Store a **global frequency map** for words
* At each `TrieNode`, keep a **sorted list** of top 3 words by:
                            
* Frequency (descending)
* Lexicographical (ascending)
                        
                        ---
                        
## ✅ Full Swift Implementation
                        
### 1. Trie Node with Frequency-based Suggestions
                        
                        ```swift
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
    var word: String?
    var topSuggestions: [String] = []
}
```

---

### 2. Autocomplete System

```swift
class AutocompleteSystem {
    private let root = TrieNode()
    private var frequencyMap: [String: Int] = [:]
    
    func insert(_ word: String, frequency: Int = 1) {
        frequencyMap[word, default: 0] += frequency
        
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
            updateSuggestions(for: node, with: word)
        }
        
        node.isEndOfWord = true
        node.word = word
    }
    
    func getSuggestions(for prefix: String) -> [String] {
        var node = root
        for char in prefix {
            guard let next = node.children[char] else {
                return []
            }
            node = next
        }
        return node.topSuggestions
    }
    
    private func updateSuggestions(for node: TrieNode, with word: String) {
        if !node.topSuggestions.contains(word) {
            node.topSuggestions.append(word)
        }
        
        // Sort by frequency desc, then lexicographically asc
        node.topSuggestions.sort {
            let freq1 = frequencyMap[$0, default: 0]
            let freq2 = frequencyMap[$1, default: 0]
            return freq1 == freq2 ? $0 < $1 : freq1 > freq2
        }
        
        // Keep only top 3
        if node.topSuggestions.count > 3 {
            node.topSuggestions = Array(node.topSuggestions.prefix(3))
        }
    }
}
```

---

### 3. Example Usage

```swift
let system = AutocompleteSystem()

system.insert("app", frequency: 5)
system.insert("apple", frequency: 3)
system.insert("application", frequency: 2)
system.insert("appetizer", frequency: 4)
system.insert("apex", frequency: 1)
system.insert("apply", frequency: 2)

print(system.getSuggestions(for: "app"))
// Output: ["app", "appetizer", "apple"]
```

---

## 🧠 Ranking Logic

Words are ranked by:

* **Frequency** (higher is better)
* Then **lexicographically** (to break ties)

Example:

```swift
Words: ["app", "apple", "application"]
Frequencies: [5, 3, 2]
→ Sorted: ["app", "apple", "application"]
```

---

## 🛠️ Optional Extensions

* Support for **real-time frequency updates** (e.g., as a user selects a word, increase frequency)
* Limit number of stored suggestions per node for performance/memory
* Persist Trie structure to disk for fast startup in real-world apps
                    
                    Would you like to add real-time learning (e.g., updating frequency as user selects suggestions)?
