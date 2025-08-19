//
//  Reverse Words in a String.swift
//  
//
//  Created by Apple on 19/08/25.
//

import Foundation

| Metric    | Complexity |
| --------- | ---------- |
| **Time**  | O(n)       |
| **Space** | O(n)       |


func reverseWords(_ s: String) -> String {
    let reversedS = String(s.reversed())
    let n = reversedS.count
    var result: [Character] = []
    var i = 0

    let chars = Array(reversedS)
    var l = 0

    while l < n {
        if chars[l] != "." {
            // Add a dot before the next word (if not first word)
            if i != 0 {
                result.append(".")
                i += 1
            }

            var r = l
            while r < n && chars[r] != "." {
                result.append(chars[r])
                i += 1
                r += 1
            }

            // Reverse the just-added word in-place
            let start = i - (r - l)
            let end = i - 1
            result[start...end] = result[start...end].reversed()

            l = r
        }
        l += 1
    }

    return String(result)
}
