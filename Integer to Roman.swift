//
//  File.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

func toRoman(_ x: Int) -> String {
    let base = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
    let sym = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
    
    var num = x
    var result = ""
    var i = base.count - 1

    while num > 0 {
        let div = num / base[i]
        if div > 0 {
            for _ in 0..<div {
                result += sym[i]
            }
            num %= base[i]
        }
        i -= 1
    }
    
    return result
}

// Example usage
let x = 3549
print(toRoman(x))  // Output: MMMDXLIX
