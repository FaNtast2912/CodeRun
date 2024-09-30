import UIKit


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
var dict: [Int:Int] = [:]
var numbers = 0
while let line = readLine(), line != "-2000000000" {
    guard let digit = Int(line) else { break }
    numbers += 1
    dict[numbers,default: 0] = digit
}


func seqIs(_ set: Set<Int>) -> String {
    
    if numbers == 1 {
        return "CONSTANT"
    }
    
    
    return ""
}




//func seqIs(_ arr: Set<Int>) -> String {
//    if arr.count == 1 {
//        return "CONSTANT"
//    }
//    
//    var left = 0
//    var right = left + 1
//    
//
//    while right <= arr.count-1 {
//        if arr[left] == arr[right] {
//            left += 1
//            right += 1
//        } else {
//            break
//        }
//    }
//    
//    if arr[left] < arr[right] {
//        while right <= arr.count-1 {
//            if arr[left] + 1 == arr[right] {
//                left += 1
//                right += 1
//            } else if arr[left] + 1 > arr[right] {
//                return "RANDOM"
//            } else {
//                while right <= arr.count-1 {
//                    if arr[left] > arr[right] {
//                        return "RANDOM"
//                    } else {
//                        left += 1
//                        right += 1
//                    }
//                    return "WEAKLY DESCENDING"
//                }
//            }
//        }
//        return "ASCENDING"
//    }
//    
//    if arr[left] > arr[right] {
//        while right <= arr.count-1 {
//            if (arr[left] + 1) == arr[right] {
//                left += 1
//                right += 1
//            } else {
//                return "WEAKLY DESCENDING"
//            }
//            return "DESCENDING"
//        }
//    }
//    return "RANDOM"
//}
//
//seqIs(sarr)
