import UIKit
import Foundation

//let fileName = "input.txt"
//
//func readNums() {
//guard let line = try? String(contentsOfFile: fileName) else { return }
//    
//let split = line.split(separator: "\n")
//    
//guard split.count > 0 else { return }
//    
//let nums = split[0].split(separator: " ")
//    
//guard nums.count == 2, let a = Int(nums[0]), let b = Int(nums[1]) else { return }
//let result = String(a + b)
//    
//try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
//    
//}
//
//readNums()
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


//
//var sarr = [String]()
//
//while let line = readLine() {
//    let words = line.split(separator: " ")
//    sarr += words.map { String($0) }
//}
var sarr = ["str3","1smth","bla2bla"]

func createDictionary(_ fromStrings: [String]) -> [Int: String] {
    var dictionary: [Int: String] = [:]
    for string in fromStrings {
        if let digit = Int(string.filter {$0.isNumber}) {
            let word = string.filter {!$0.isNumber}
            dictionary[digit] = word
        }
    }
    return dictionary
}

let resultDictionary = createDictionary(sarr)

for index in 1...10000 {
    if let string = resultDictionary[index] {
        print(string)
    } else {
        break
    }
}



