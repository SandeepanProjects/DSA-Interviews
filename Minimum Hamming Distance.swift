//
//  Minimum Hamming Distance.swift
//  
//
//  Created by Apple on 04/07/25.
//

import Foundation

Minimum Hamming Distance is the shortest hamming distance between any two codewords. It is also the measure of comparing and correcting two binary codes or data strings in the information theory and computer networks. It is used in linear block coding in information theory for error detection. For a better understanding of minimum hamming distance, first understand its basic terminologies: hamming weight and hamming distance.
import Foundation
/*
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
Given two integers x and y, calculate the Hamming distance.
Reference: https://leetcode.com/problems/hamming-distance/
*/
func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var count = 0
    var n = x ^ y
    
    while n > 0 {
        n &= n - 1
        count += 1
    }
    
    return count
}

