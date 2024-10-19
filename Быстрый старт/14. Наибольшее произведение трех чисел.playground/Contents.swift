import UIKit
let arr = [3,5,1,7,9,0,9,-3,10]
//let arr = readLine()!.split(separator: " ").map{ Int($0)! }

func maxProductOfThree(numbers: [Int]) {
    // Проверяем, что в массиве есть хотя бы три элемента
    guard numbers.count >= 3 else {
        return  // Возвращаем 0, если элементов меньше трёх
    }

    // Сортируем массив по возрастанию
    let sortedNumbers = numbers.sorted()

    // Находим три наибольших элемента
    let max1 = sortedNumbers[sortedNumbers.count - 1]
    let max2 = sortedNumbers[sortedNumbers.count - 2]
    let max3 = sortedNumbers[sortedNumbers.count - 3]

    // Находим два наименьших элемента
    let min1 = sortedNumbers[0]
    let min2 = sortedNumbers[1]

    // Сравниваем произведения
    let product1 = max1 * max2 * max3
    let product2 = min1 * min2 * max1
    var answer = ""
    
    if product1 > product2 {
        answer = "\(max1) \(max2) \(max3)"
    } else {
        answer = "\(min1) \(min2) \(max1)"
    }
    print(answer)
}

// Пример использования
let numbers = [1, 2, 3, 4, -1, -2, -3]
maxProductOfThree(numbers: arr) // Вывод: 24
