import UIKit

let pairs = Int(readLine()!)!
var dict: [String:String] = [:]
for _ in 1...pairs {
    let line = readLine()!
    let words = line.split(separator: " ").map { String($0) }
    dict[words[0],default: ""] = words[1]
    dict[words[1],default: ""] = words[0]
}
let word = readLine()!
print(dict[word]!)
