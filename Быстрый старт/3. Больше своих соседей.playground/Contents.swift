import UIKit
import Foundation


//Дан список чисел. Определите, сколько в этом списке элементов, которые больше двух своих соседей. Выведите количество таких элементов.
let line = readLine()!
let numbers = line.split(separator: " ")
let intNumbers = numbers.map { Int($0)! }
func howMuchBigger(_ intNumbers: [Int]) -> Int {
    var ans = 0
    for i in 1...intNumbers.count-2 {
        if intNumbers[i] > intNumbers[i-1], intNumbers[i] > intNumbers[i+1] {
            ans += 1
        }
        
    }
    return ans
}

print(intNumbers.count < 3 ? 0 : howMuchBigger(intNumbers))


