import UIKit

let numbers = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var nums = 0
arr.forEach { a in
    nums += a
}
print(100/nums)
