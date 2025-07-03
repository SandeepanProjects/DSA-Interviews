//
//  Detect Capital.swift
//  
//
//  Created by Apple on 02/07/25.
//

import Foundation

/*
 Given a word, you need to judge whether the usage of capitals in it is right or not.
 
 Reference: https://leetcode.com/problems/detect-capital/
 */
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
class Solution {
    
    func detectCapitalUse(_ word: String) -> Bool {
        
        if word == word.uppercased() {
            return true
        } else if word == word.lowercased().capitalizingFirstLetter() {
            return true
        } else if word == word.lowercased() {
            return true
        }
        return false
    }
    
}
