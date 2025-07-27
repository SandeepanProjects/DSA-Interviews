//
//  Flatten a Nested Dictionary.swift
//  
//
//  Created by Apple on 27/07/25.
//

import Foundation

func flatten(dictionary: [String: Any], prefix: String = "") -> [String: Any] {
    var result: [String: Any] = [:]

    for (key, value) in dictionary {
        let fullKey = prefix.isEmpty ? key : "\(prefix).\(key)"
        
        if let nested = value as? [String: Any] {
            let flattenedNested = flatten(dictionary: nested, prefix: fullKey)
            for (nestedKey, nestedValue) in flattenedNested {
                result[nestedKey] = nestedValue
            }
        } else {
            result[fullKey] = value
        }
    }

    return result
}

let nestedDict: [String: Any] = [
    "a": 1,
    "b": [
        "c": 2,
        "d": [
            "e": 3,
            "f": 4
        ]
    ],
    "g": "hello"
]

let flatDict = flatten(dictionary: nestedDict)
print(flatDict)

[
    "a": 1,
    "b.c": 2,
    "b.d.e": 3,
    "b.d.f": 4,
    "g": "hello"
]
