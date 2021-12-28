//
//  PascalTriangle.swift
//  SolvingProblems
//
//  Created by Snow Lukin on 26.12.2021.
//

import Foundation

// Pascal's Triangle
/*
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
...
*/


// Probably the most obviouse way to do it is to use combinatorics
// to count each element.

// Bcuz element of Pascal Triangle is equal to
// number of combinations from total number of rows for elements in row

//  Can crash if values > Int.max
func getPascalTrianle(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        print("Inccorrect value")
        return []
    }
    var result = [[Int]]()
    result.reserveCapacity(numRows)
    
    for rowIndex in 0..<numRows {
        var rowValues = [Int]()
        rowValues.reserveCapacity(rowIndex)
        
        for elementInRowIndex in 0...rowIndex {
            if elementInRowIndex == 0 || elementInRowIndex == rowIndex {
                rowValues.append(1)
                continue
            }
            let elementValue = combinationSequence(n: rowIndex, k: elementInRowIndex)
            rowValues.append(elementValue)
        }
        
        // print here to get at least something
        // in case of large values or crash cuz values > Int.max
        print(rowValues)
        
        result.append(rowValues)
    }
    
    // returning value in case we need to further work with it
    return result
}

// C(n,k)
func combinationSequence(n: Int, k: Int) -> Int {
    k == 0 || n == k
        ? 1
        : combinationSequence(n: n - 1, k: k - 1) + combinationSequence(n: n - 1, k: k)
}
