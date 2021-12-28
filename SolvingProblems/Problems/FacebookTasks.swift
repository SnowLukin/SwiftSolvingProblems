//
//  FacebookTasks.swift
//  SolvingProblems
//
//  Created by Snow Lukin on 27.12.2021.
//

import Foundation

/*
 Given an array of numbers
 – Return the number of zeroes in the array
 – Return an array with all zeroes moved to the front of the array
 */

// 1)

// To make it a little bit harder lets say the array we getting has Any type
func getNumberOfZeroesInArray(_ array: [Any]) -> Int {
    
    guard array.count != 0 else { return 0 }
    
    let countedSetArray = NSCountedSet(array: array)
    return countedSetArray.count(for: 0)
}

// 2)

// Nothing much to think of here. Complexity is O(n). (obviosly) :)
func getZeroesToFront(_ array: [Any]) -> [Any] {
    var array = array

    for elementIndex in array.startIndex..<array.endIndex {
        if array[elementIndex] as! AnyHashable == 0 as AnyHashable {
            array.insert(array[elementIndex], at: array.startIndex)
            array.remove(at: elementIndex + 1)
        }
    }
    return array
}
