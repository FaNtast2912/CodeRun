import UIKit
import Foundation
/*
 Для чтения входных данных необходимо получить их
 из стандартного потока ввода (stdin).
 Данные во входном потоке соответствуют описанному
 в условии формату. Обычно входные данные состоят
 из нескольких строк.
 
 Можно использовать несколько методов:
 * readLine() -- читает одну строку из потока;
 * readLine(strippingNewline: Bool) -- читает одну строку без символа переноса строки из потока;
 * readLine()?.split(separator: " ") -- читает одну строку и делит ее на слова, используя заданный разделитель.
 
 Чтобы прочитать из строки стандартного потока:
 * число -- let var = Int(readLine()!)!;
 * строку -- let svar = readLine()!;
 * массив чисел известной длины --
 let arr = readLine()!.split(separator: " ").map{ Int($0)! };
 * последовательность слов до конца файла --
 var sarr = [String]();
 while let line = readLine() {
 let words = line.split(separator: " ")
 sarr += words.map { String($0) }
 }
 
 Чтобы вывести результат в стандартный поток вывода (stdout),
 можно использовать функцию print().
 
 Возможное решение задачи "Вычислите сумму A+B":
 let line = readLine()!
 let numbers = line.split(separator: " ")
 print(Int(numbers[0])! + Int(numbers[1])!)
 */
var sarr = [String]();

while let line = readLine() {
    let words = line.split(separator: " ")
    sarr.append(words.joined(separator: " "))
    //   sarr += words.map { String($0) }
}

sarr = ["6 6 1","5 1","6 2","4 3","5 1"]

func makeField(x: Int, y: Int) -> [Int:[String]] {
    var dict: [Int:[String]] = [:]
    for i in 0...x-1 {
        var str: [String] = []
        for j in 0...y-1 {
            str.append("0")
            dict[i] = str
        }
    }
    return dict
}


//func putBombs(_ field: inout [Int:[String]], _ x: Int, _ y: Int){
//    let x = x-1
//    let y = y-1
//    field[x]![y] = "*"
//    for i in x-1...x+1 {
//        for j in y-1...y+1 {
//            if let row = field[i] {
//                if let colomn = field[j] {
//                    if field[i]![j] != "*" {
//                        var number = field[i]![j]
//                        field[i]![j] = String(Int(number)!+1)
//                    }
//                }
//            }
//        }
//    }
//}


func putBombs2(_ field: inout [Int:[String]], _ x: Int, _ y: Int){
    let x = x-1
    let y = y-1
    if field[x]![y] != "*" {
        field[x]![y] = "*"
        for i in x-1...x+1 {
            if let row = field[i] {
                let indexColomn = row.count
                for j in y-1...y+1 {
                    if j < indexColomn, j >= 0 {
                        if field[i]![j] != "*" {
                            var number = field[i]![j]
                            field[i]![j] = String(Int(number)!+1)
                            
                        }
                    }
                }
            }
        }
    }
}



let string = sarr[0]
let arr = string.split(separator: " ")
let x:Int = Int(String(arr[0]))!
let y:Int = Int(String(arr[1]))!

var field = makeField(x: x, y: y)

if sarr[0].last! != "0" {
    for i in 1...sarr.count-1 {
        let xStr = sarr[i].split(separator: " ")
        let x:Int = Int(String(xStr[0]))!
        let y:Int = Int(String(xStr[1]))!
        
        putBombs2(&field, x, y)
    }
}

for i in 0...x-1 {
//    print(field[i]!)
    print(field[i]!.joined(separator: " "))
}







































