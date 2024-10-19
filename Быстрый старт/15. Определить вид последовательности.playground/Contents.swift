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
    if dict[numbers-1,default: 0] == digit {
    }
    dict[numbers,default: 0] = digit
}


func seqIs(_ dict: [Int:Int]) -> String {
    
    if dict.count <= 1 {
        return "CONSTANT"
    }
    
    guard let first = dict[1], let _ = dict[2], let last = dict[dict.count] else { preconditionFailure("first and second failure") }
    
    var constant = false
    var ascending = false
    var weaklyAscending = false
    var descending = false
    var weaklyDescending = false
    
    if first == last {
        for i in 1...dict.count {
            if first != dict[i] {
                return "RANDOM"
            }
        }
        return "CONSTANT"
    }
    
    for i in 2...dict.count {
        guard let first = dict[i-1], let second = dict[i] else { preconditionFailure("Key Value error") }
        
        if first == second {
            if descending == true {
                descending = false
                weaklyDescending = true
            } else if ascending == true {
                ascending = false
                weaklyAscending = true
            } else {
                constant = true
            }
            
        } else if first < second {
            
            if descending == true || weaklyDescending == true {
                return "RANDOM"
            }
            
            if weaklyAscending != true, constant != true  {
                ascending = true
            } else {
                weaklyAscending = true
            }
            
        } else if second < first {
            
            if ascending == true {
                return "RANDOM"
            }
            
            if weaklyDescending != true, constant != true {
                descending = true
            } else {
                weaklyDescending = true
            }
        }
        
    }
    
    if ascending {
        return "ASCENDING"
    } else if weaklyAscending {
        return "WEAKLY ASCENDING"
    } else if descending {
        return "DESCENDING"
    } else if weaklyDescending {
        return "WEAKLY DESCENDING"
    }
    
    return "RANDOM"
}

print(seqIs(dict))
