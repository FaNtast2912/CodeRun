import UIKit



//let numbers = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map{ Int($0)! }


let numbers = 5
let arr = [1,2,1,2,2]
let int: UInt


func isPalendrome(array: [Int], numbers: Int) {
    var totalArr = array
    var answerArr = [Int]()
    var numbersAdded = 0

    if array.count < 1 {
        print(numbersAdded)
    } else {
        var right = numbers - 1
        var left = right - 1
        while left >= 0 {
            if totalArr != totalArr.reversed() {
                if array[left] != array[right] {
                    answerArr.append(array[left])
                    totalArr.append(array[left])
                    numbersAdded += 1
                    left -= 1
                } else {
                    left -= 1
                }
            }
        }
        print(numbersAdded)
        print(answerArr.isEmpty ? "" : answerArr.map{String($0)}.joined(separator: " "))
    }
}
isPalendrome(array: arr, numbers: numbers)


