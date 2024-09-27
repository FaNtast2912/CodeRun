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
var sarr = ["str3","1smth","abla2bla"]


func createDictionary(_ fromStrings: [String]){
    
    while let line = readLine() {
        let words = line.split(separator: " ")
        sarr += words.map { String($0) }
    }
    
    var dictionary: [Int: String] = [:]
    var currentRow = 1
    for string in fromStrings {
        if let digit = Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
            let word = string.components(separatedBy: CharacterSet.letters.inverted).joined()
            dictionary[digit] = word
        }
    }
    for i in 1...fromStrings.count {
        if let row = dictionary[i] {
            print(row)
        }
    }
}

//createDictionary(sarr)


func printRows(_ input: [String]) {
    
    func quicksort(_ a: [String]) -> [String] {
        guard a.count > 1 else { return a }
        
        let pivot = Int(a[a.count/2].components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
        let less = a.filter { Int($0.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())! < pivot }
        let equal = a.filter { Int($0.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())! == pivot }
        let greater = a.filter { Int($0.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())! > pivot }
        
        return quicksort(less) + equal + quicksort(greater)
    }
    
    let answerArr = quicksort(input)
    
    for value in answerArr {
        print(value.components(separatedBy: CharacterSet.letters.inverted).joined())
    }
}
//printRows(sarr)

func printRows2(_ input: [String]) {
    for i in 1...input.count {
        for value in input {
            if value.contains(String(i)) {
                print(value.components(separatedBy: CharacterSet.letters.inverted).joined())
            }
        }
    }
}

//printRows2(sarr)

func printRows3(_ input: [String]) {
    for value in input.sorted() {
        print(value.components(separatedBy: CharacterSet.letters.inverted).joined())
    }
}

//printRows3(sarr)

let str1 = "asdaf231qweq"
let str2 = "231"
let Array = ["2asfg","1asfgrg","10vfdeg3fasds", "20afef", "30agraw", "40veve"]
//print(str1.components(separatedBy: CharacterSet.letters))




func createDictionary3(){
    var dictionary: [Int: String] = [:]
    let numbers = "0123456789"
    var currentNumber = 1
    var keys: [Int] = []
    while let line = readLine() {
        var numberString = ""
        var lettersString = ""
        for char in line {
            if numbers.contains(char) {
                numberString.append(char)
            } else {
                lettersString.append(char)
            }
        }
        if let number = Int(numberString) {
            if number == currentNumber {
                print(lettersString)
                currentNumber += 1
            } else {
                dictionary[number] = lettersString
                keys.append(number)
            }
        }
    }
    for i in keys.sorted() {
        print(dictionary[i]!)
    }
}
//createDictionary3()

let file = FileHandle.standardInput

while true {
    let data = file.availableData
    print("\(String(bytes: data, encoding: .utf8)!)")
    let scanner = Scanner(string: String(bytes: data, encoding: .utf8)!)
    print(scanner.scanUpToCharacters(from: CharacterSet.decimalDigits)!)
    print(scanner.scanUpToCharacters(from: CharacterSet.letters)!)
    print(scanner.scanUpToCharacters(from: CharacterSet.decimalDigits)!)
}
