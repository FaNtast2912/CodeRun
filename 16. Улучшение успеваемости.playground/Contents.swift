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

//let a = Double(readLine()!)!
//let b = Double(readLine()!)!
//let c = Double(readLine()!)!
//
func minFives(a: Double, b: Double, c: Double) {
    var x:Double = 0
    x = ceil((3*a+b-c)/3)
    print(x < 0 ? 0 : Int(x))

}

minFives(a:  0, b: 1, c: 10)


