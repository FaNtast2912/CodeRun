import UIKit
import Foundation


//let numbers = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map{ Int($0)! }


let numbers = 5
let array = [1,2,3,4,5]

//let imputLenght = Int(readLine()!)!
//let array = readLine()!.split(separator: " ").map{ Int($0)!}

func isPalendrome(for arr: [Int], startIdx: Int, endIdx: Int) -> Bool {
    var startIdx = startIdx
    var endIdx = endIdx
    while startIdx < endIdx {
        if arr[startIdx] != arr[endIdx] {
            return false
        }
        startIdx += 1
        endIdx -= 1
    }
    return true
}

var result: [String] = []
var startPosition = 0
var endPosition = array.count - 1

while startPosition <= endPosition && array.count > 1 {
    guard !isPalendrome(for: array, startIdx: startPosition, endIdx: endPosition) else {
        break
    }
    result.append("\(array[startPosition])")
    startPosition += 1
}

print(result.count)
if !result.isEmpty {
    print(result.reversed().joined(separator: "  "))
}
