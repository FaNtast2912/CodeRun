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

let dict1: [Int:Int] = [1:1,2:1,3:1,4:1,5:1,6:1] // constant
let dict2: [Int:Int] = [1:4,2:3,3:2,4:1,5:1,6:1] // weak desc
let dict3: [Int:Int] = [1:1,2:1,3:1,4:2,5:3,6:4] // weak asc
let dict4: [Int:Int] = [1:1,2:1,3:2,4:3,5:1,6:1] // random
let dict5: [Int:Int] = [1:1,2:2,3:3,4:4,5:5,6:6] // asc
let dict6: [Int:Int] = [1:6,2:5,3:4,4:3,5:2,6:1] // desc
let dict7: [Int:Int] = [1:1]
let dict8: [Int:Int] = [:]
let dict9: [Int:Int] = [1:1,2:2,3:3,4:1,5:1,6:4] // random
let dict10: [Int:Int] = [1:3,2:2,3:1,4:1,5:1,6:9] // random
let dict11: [Int:Int] = [1:1,2:2,3:1,4:1,5:2,6:2] // random

var numbers = 0
var same = 0
while let line = readLine(), line != "-2000000000" {
    guard let digit = Int(line) else { break }
    numbers += 1
    if dict[numbers-1,default: 0] == digit {
        same += 1
    }
    dict[numbers,default: 0] = digit
}


func seqIs(_ dict: [Int:Int]) -> String {
    
    if numbers == same || numbers == 1 {
        return "CONSTANT"
    }
    guard let first = dict[1], let second = dict[2] else { preconditionFailure("first and second failure") }

    var constant = false
    var ascending = false
    var weaklyAscending = false
    var descending = false
    var weaklyDescending = false
    
    if first > second {
        descending = true
        for i in 2...dict.count {
            guard let first = dict[i-1], let second = dict[i] else { break }
            if first - second > 1 {
                descending = false
                weaklyDescending = true
            } else if first - second < 1 {
                descending = false
                weaklyDescending = false
                break
            }
        }
    }
    
    if first < second {
        ascending = true
        for i in 2...dict.count {
            guard let first = dict[i-1], let second = dict[i] else { break }
            if second - first > 1 {
                ascending = false
                weaklyAscending = true
            } else if second - first < 1 {
                ascending = false
                weaklyAscending = false
                break
            }
        }
    }
    
    if first == second {
        constant = true
        for i in 2...dict.count {
            guard let first = dict[i-1], let second = dict[i] else { break }
            if first < second {
                constant = false
                weaklyAscending = true
                for j in i...dict.count {
                    guard let first = dict[j-1], let second = dict[j] else { break }
                    if second - first > 1 {
                        weaklyAscending = true
                    } else if second - first < 1 {
                        weaklyAscending = false
                        break
                    }
                }
                break
            } else if first > second {
                constant = false
                weaklyDescending = true
                for j in i...dict.count {
                    guard let first = dict[j-1], let second = dict[j] else { break }
                    if first - second > 1 {
                        weaklyDescending = true
                    } else if first - second < 1 {
                        weaklyDescending = false
                        break
                    }
                }
                break
            }
        }
    }
    
    if constant {
        return "CONSTANT"
    } else if ascending {
        return "ASCENDING"
    } else if weaklyAscending {
        return "WEAKLY ASCENDING "
    } else if descending {
        return "DESCENDING"
    } else if weaklyDescending {
        return "WEAKLY DESCENDING"
    }
    
    return "RANDOM"
}

print(seqIs(dict1))
print(seqIs(dict2))
print(seqIs(dict3))
print(seqIs(dict4))
print(seqIs(dict5))
print(seqIs(dict6))
print(seqIs(dict7))
print(seqIs(dict8))
print(seqIs(dict9))
print(seqIs(dict10))
print(seqIs(dict11))




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
