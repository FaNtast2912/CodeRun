import UIKit

var firstString = "Москва Россия, Вена Австрия"
let secondString = "Россия Москва, Франция Париж"
//let a = readLine()!
//let b = readLine()!
//var firstString = removeLastCharacter(from: a)
//let secondString = removeLastCharacter(from: b)

func removeLastCharacter(from string: String) -> String {
    guard !string.isEmpty else { return string }
    return String(string.prefix(string.count - 1))
}


func makeArr(from string: String) -> [String] {
    let arr = string.components(separatedBy: ", ")
    var answer = [String]()
    let arrWords: () = arr.forEach { pair in
        answer.append(contentsOf: pair.components(separatedBy: " "))
    }
    return answer.sorted()
}

let firstArr = makeArr(from: firstString)
let secondArr = makeArr(from: secondString)

func isSame(firstArr: [String], secondArr: [String]) {
    if firstArr == secondArr {
        print("YES")
    } else {
        print("NO")
    }
}

isSame(firstArr: firstArr, secondArr: secondArr)
