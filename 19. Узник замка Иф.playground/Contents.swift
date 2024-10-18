import UIKit
struct Brick {
    let a: Int
    let b: Int
    let c: Int
}

struct Window {
    let d: Int
    let e: Int
}

let brick = Brick(
    a: Int(readLine()!)!,
    b: Int(readLine()!)!,
    c: Int(readLine()!)!
)

let window = Window(d: Int(readLine()!)!, e: Int(readLine()!)!)

func sameOrLess(a: Int, b: Int, e: Int, d:Int) -> Bool{
    if a <= e, b <= d {
        return true
    } else if a <= d, b <= e {
        return true
    }
    return false
}

func isPossible(brick: Brick, window: Window) -> Bool {
    
    if sameOrLess(a: brick.a, b: brick.b, e: window.e, d: window.d) {
        return true
    }
    if sameOrLess(a: brick.b, b: brick.a, e: window.e, d: window.d) {
        return true
    }
    if sameOrLess(a: brick.a, b: brick.c, e: window.e, d: window.d) {
        return true
    }
    if sameOrLess(a: brick.c, b: brick.a, e: window.e, d: window.d) {
        return true
    }
    if sameOrLess(a: brick.b, b: brick.c, e: window.e, d: window.d) {
        return true
    }
    if sameOrLess(a: brick.c, b: brick.b, e: window.e, d: window.d) {
        return true
    }
    
    return false
}

if isPossible(brick: brick, window: window) {
    print("YES")
} else {
    print("NO")
}
