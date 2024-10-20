import UIKit
import Foundation

let arr = [0,0,1,0,0,0]
//let arr = readLine()!

func isHappyNumber(number: Int) -> Bool {
    
    var strNumber = String(number)
    
    while strNumber.count < 6 {
        strNumber = "0"+strNumber
    }
    
    let firstThreeSum = strNumber.prefix(3).compactMap { Int(String($0)) }.reduce(0, +)
    let lastThreeSum = strNumber.suffix(3).compactMap { Int(String($0)) }.reduce(0, +)

    return firstThreeSum == lastThreeSum
}

func findNearestHappyNumber(number: String) -> String {
    var currentNumber = Int(number)!
    while true {
        if isHappyNumber(number: currentNumber) {
            var strNumber = String(currentNumber)
            
            while strNumber.count < 6 {
                strNumber = "0"+strNumber
            }
            
            return strNumber
        }
        currentNumber += 1
    }
}

print(findNearestHappyNumber(number: "165901"))
