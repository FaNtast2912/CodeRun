import UIKit

let setup = readLine()!.split(separator: " ").map { Int($0)! }

func readText() {
    
    var currentSite = ""
    var dict = [String: Int]()
    
    while let line = readLine() {
        
        let words = line.split(separator: " ")
        
        if words.count == 1 {
            currentSite = String(words[0])
        } else {
            dict[currentSite, default: 0] += gooseCount(in: words)
        }
    }
    
    var answer = [String]()
    
    for key in dict.keys.sorted() {
        if dict[key]! <= setup[0] {
            answer.append(key)
        }
    }
    
    if answer.count == 0 {
        print(0)
    } else {
        print(answer.count)
        answer.forEach { word in
            print(word)
        }
    }
    
}

func gooseCount(in words: [String.SubSequence]) -> Int {
    let wordsArr = words.map { String($0) }
    var gooseCount = 0
    wordsArr.forEach { word in
        if word.lowercased() == "goose" {
            gooseCount += 1
        }
    }
    return gooseCount
}

