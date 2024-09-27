//
//  main.swift
//  5. 29 задача аналитики
//
//  Created by Maksim Zakharov on 27.09.2024.
//

import Foundation

let scanner = Scanner(string: readLine() ?? "")
let a = scanner.scanDouble()!
let b = scanner.scanDouble()!
let c = scanner.scanDouble()!

func quadraticEquation(a: Double, b: Double, c: Double) {
    let d = (b*b) - (4 * a * c)
    
    if d > 0 {
        let x1 = ((-b + sqrt(d))/(a*2))
        let x2 = ((-b - sqrt(d))/(a*2))
        print(2)
        print(min(x1, x2),max(x1, x2))
    } else if d == 0 {
        let x1 = (b/(a*2))
        print(1)
        print(-x1)
    } else {
        print(0)
    }
}

quadraticEquation(a: a, b: b, c: c)
