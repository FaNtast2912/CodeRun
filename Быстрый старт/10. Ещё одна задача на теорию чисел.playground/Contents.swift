import UIKit

//let line = readLine()!.split(separator: " ").map { Int($0) }
//let a = line[0]!
//let b = line[1]!

let a = 20, b = 8

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while a > 0, b > 0 {
        if a >= b {
            a = a % b
        } else {
            b = b % a
        }
    }
    return max(a,b)
}

func lcm(a: Int, b: Int) -> Int {
    return (a * b) / gcd(a,b)
}


print(gcd(a, b),lcm(a: a, b: b))
