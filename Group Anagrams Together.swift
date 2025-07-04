//
//  Group Anagrams Together.swift
//  
//
//  Created by Apple on 04/07/25.
//

Given an array of words arr[], the task is to groups strings that are anagrams. An anagram is a word or phrase formed by rearranging the letters of another, using all the original letters exactly once.


Using Frequency as keys - O(n*k) Time and O(n*k) Space

The idea is to that if two strings are anagrams of each other, then the frequency of all characters in both strings will always be the same. So, we can maintain a hash map with the count of characters as keys and the index of the anagram group in the result array as the value. For each word, we can first construct a frequency array of size 26 to store the frequency of each character in the word. Then, we can append the frequency of each character separated by a delimiter, say '$' to form the key for hash map.
                        
import Foundation
                        
let MAX_CHAR = 26
                        
// Function to generate a hash key for a word
func getHash(_ s: String) -> String {
    var freq = [Int](repeating: 0, count: MAX_CHAR)
    
    for ch in s {
        if let ascii = ch.asciiValue {
            freq[Int(ascii - Character("a").asciiValue!)] += 1
        }
    }
    
    var hashList: [String] = []
    for count in freq {
        hashList.append(String(count))
        hashList.append("$")
    }
    
    return hashList.joined()
}

// Function to group anagrams
func anagrams(_ arr: [String]) -> [[String]] {
    var res: [[String]] = []
    var map: [String: Int] = [:]
    
    for word in arr {
        let key = getHash(word)
        
        if let index = map[key] {
            res[index].append(word)
        } else {
            map[key] = res.count
            res.append([word])
        }
    }
    
    return res
}

// Example usage
let arr = ["act", "god", "cat", "dog", "tac"]
let grouped = anagrams(arr)

for group in grouped {
    print(group.joined(separator: " "))
}



## Using Sorting
Using Sorted Words as Keys

The idea is that if we sort two strings which are anagrams of each other, then the sorted strings will always be the same. So, we can maintain a hash map or dictionary with the sorted strings as keys and the index of the anagram group in the result array as the value.
                        
Time Complexity: O(n * k * log(k)), where n is the number of words and k is the maximum length of a word.
Auxiliary Space: O(n * k), to store the result.
                        
func groupAnagrams(_ arr: [String]) -> [[String]] {
    var res = [[String]]()
    var mp = [String: Int]()
    
    for word in arr {
        // Sort the string to get the key
        let sortedWord = String(word.sorted())
        
        if mp[sortedWord] == nil {
            // Create a new group and store its index
            mp[sortedWord] = res.count
            res.append([String]())
        }
        
        // Append the word to its group
        res[mp[sortedWord]!].append(word)
    }
    
    return res
}

// Example usage
let input = ["act", "god", "cat", "dog", "tac"]
let result = groupAnagrams(input)

for group in result {
    print(group.joined(separator: " "))
}

