//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Matta, Ralph (PEPW) on 31/10/2023.
//

import Foundation

let array = [1, 2, 3, 4, 5, 6, 7]
let target = 6

\\ Linear Search

for i in 0..<array.count {
    let element = array[i]
    if element == target {
        print("\(target) is at index \(i)")
    }
}

\\ Binary Search


