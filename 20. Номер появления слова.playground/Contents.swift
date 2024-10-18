import UIKit

var greeting = "Hello, playground"


let fileName = "input.txt"

func readText() {
guard let line = try? String(contentsOfFile: fileName, encoding: .utf8) else { return }

let arrOfLines = line.split(separator: "\n")

guard arrOfLines.count > 0 else { return }
    
    var resultArr: [Int] = []
    var dict: [String:Int] = [:]
    
    for line in arrOfLines {
        let arrOfWords = line.split(separator: " ")
        for word in arrOfWords {
            dict[String(word), default: 0] += 1
        }
    }
    
    for line in arrOfLines {
        let arrOfWords = line.split(separator: " ")
        for word in arrOfWords {
            resultArr.append(dict[String(word)]!)
        }
    }
    
    let result = resultArr.map {String($0)}.joined(separator: " ")
    print(result)

}

readText()
let arr = [1, 2, 3]

print(arr.map {String($0)}.joined(separator: " "))
