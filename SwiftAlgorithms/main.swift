//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Matta, Ralph (PEPW) on 31/10/2023.
//

import Foundation

// Linear Search

func linearSearch(array: [Int], target: Int) -> Int? {
    for i in 0..<array.count {
        
        if array[i] == target {
            return i
        }
    }
    
    return nil
}

// Binary Search

func binarySearch(array: [Int], target: Int) -> Int? {
    var low = 0
    var high = array.count-1

    for i in 0..<array.count {
        
        let mid = (low+high)/2
        let midValue = array[mid]

        if midValue == target {
            return mid
        }
        
        else if midValue > target {
            high = mid - 1
        }
        
        else {
            low = mid + 1
        }
    }

    return nil
}

// Merge Sort

func mergeSort(array: [Int]) -> [Int] {
    
    // BASE CASE
    if array.count <= 1 {
        return array // EXITS FUNCTION
    }
    
    // RECURSIVE CASE
    let midIndex = array.count/2
    let left = mergeSort(array: Array(array[..<midIndex]))
    let right = mergeSort(array: Array(array[midIndex...]))

    var sorted = [Int]()
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            sorted.append(left[leftIndex])
            leftIndex += 1
        } else {
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
    }

    sorted += left[leftIndex...]
    sorted += right[rightIndex...]

    return sorted
}

// Bubble Sort

func bubbleSort(array: [Int]) -> [Int] {
    var sortedArray = array
    for i in 0..<sortedArray.count-1 {
        for j in 0..<sortedArray.count-1 {
            if sortedArray[j] > sortedArray[j+1] {
                let temp = sortedArray[j]
                sortedArray[j] = sortedArray[j+1]
                sortedArray[j+1] = temp
            }
        }
    }
    
    return sortedArray
}

// Insertion Sort

func insertionSort(array: [Int]) -> [Int] {
    var sorted = array
    
    for i in 1..<sorted.count {
        if sorted[i-1] > sorted[i] {
            var j = i-1
            while j >= 0 && sorted[i] < sorted[j] {
                let temp = sorted[i]
                sorted[i] = sorted[j]
                sorted[j] = temp
                j -= 1
            }
        }
    }
    
    return sorted
    
}

// Quick Sort

func quickSort(array: [Int]) -> [Int] {

    // BASE CASE
    if array.count <= 1 {
        return array // EXITS FUNCTION
    }
    
    // RECURSIVE CASE
    let midValue = array[array.count/2]
    let first = array[0]
    let last = array[array.count-1]
    let pivot = medianOfThree(first: first, middle: midValue, last: last)
    
    var left = [Int]()
    var right = [Int]()
    
    for datum in array {
        if datum <= pivot {
            left.append(datum)
        }
        
        else if datum > pivot {
            right.append(datum)
        }
    }
    
    var leftSorted = quickSort(array: left)
    var rightSorted = quickSort(array: right)

    var rightIndex = 0
    var leftIndex = 0
    var output = [Int]()

    while leftIndex < leftSorted.count && rightIndex < rightSorted.count {
        if leftSorted[leftIndex] >= rightSorted[rightIndex] {
            output.append(rightSorted[rightIndex])
            rightIndex += 1
        }

        else {
            output.append(leftSorted[leftIndex])
            leftIndex += 1
        }
    }

    output.append(contentsOf: leftSorted[leftIndex...])
    output.append(contentsOf: rightSorted[rightIndex...])

    return output
    
}

func medianOfThree(first: Int, middle: Int, last: Int) -> Int {
    if (first < middle && middle < last) || (first > middle && middle > last) {
        return middle
    }
    
    else if (middle < first && first < last) || (last < first && first < middle) {
        return first
    }
    
    else if (first < last && last < middle) || (middle < last && last < first) {
        return last
    }
    
    return -1
}
