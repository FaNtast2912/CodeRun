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
    sarr += words.map { String($0) }
}

sarr = ["3 2 2","1 1","2 2"] // mock data


var firstString = sarr[0].components(separatedBy: " ")
let parametersArray = firstString.compactMap { Int($0)}
let size = String(parametersArray[0]) + String(parametersArray[1])
var bombs = parametersArray[2]

var coordinates: [String] = []
for i in 1...sarr.count - 1 {
    coordinates.append(sarr[i])
}


struct parameters {
    var size: String
    var bombs: Int
    var bombCoordinates: [String]
}



struct field {
    var dictionary: [String:Int] = [:]
}

func makeField(input: parameters) -> field {
    var rows = input.size.first
    var colomns = input.size.last
    
    
    
    
    
    return field()
}


for i in 0...parametersArray[0]  {
    for j in 0...parametersArray[1] {
        print(0)
    }
}
