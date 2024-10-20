import UIKit
//readLine()
//
let arr = readLine()!.split(separator: " ").map { Int($0)!}

func getArr(from: [Int]) -> [(Int,Int)] {
    var arr = [(Int,Int)]()
    for (index,value) in from.enumerated() {
        arr.append((value,index))
    }
    arr = arr.sorted { first, second in
        if first < second {
            return true
        } else {
            return false
        }
    }
    return arr
}

let arrEnemy = getArr(from: arr)

func isPossible(arr: [(Int,Int)]) -> Bool {
    var level = 1
    var health = 3
    for (enemy,index) in arr.enumerated() {
        if level >= enemy {
            level += 1
            if enemy*2 > level {
                health -= 1
                if health == 0 {
                    level == 1 ? 1 : level-1
                    health = 3
                }
            }
        } else {
            return false
        }
    }
    return true
}

let answer = isPossible(arr: arrEnemy)

func printAnswer(ans: Bool) {
    if ans {
        print("Possible")
        for (value,index) in arrEnemy.enumerated() {
            print(index.1 , terminator: " ")
        }
    } else {
        print("Impossible")
    }
}

printAnswer(ans: answer)
