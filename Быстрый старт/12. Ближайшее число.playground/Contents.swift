import UIKit


//let n = Int(readLine()!)!
//let arr = (readLine()!.split(separator: " ").map{ Int($0)! }).sorted()
//let target = Int(readLine()!)!

//Напишите программу, которая находит в массиве элемент, самый близкий по величине к данному числу.
//
//Формат ввода
//В первой строке задается одно натуральное число N, не превосходящее 1000 – размер массива. Во второй строке содержатся N чисел – элементы массива (целые числа, не превосходящие по модулю 1000). В третьей строке вводится одно целое число x, не превосходящее по модулю 1000.
//
//Формат вывода
//Вывести значение элемента массива, ближайшее к x. Если таких чисел несколько, выведите любое из них.

let n = 3
let arr = [1,10,20]
let target = 10

func findClosestValue(in sortedArray: [Int], to x: Int) -> Int {
    // Проверка на пустой массив
    if sortedArray.isEmpty {
        return 0
    }
    
    // Начальные значения для бинарного поиска
    var left = 0
    var right = sortedArray.count - 1
    
    // Бинарный поиск
    while left <= right {
        let mid = (left + right) / 2
        
        // Если нашли точное совпадение, возвращаем его
        if sortedArray[mid] == x {
            return sortedArray[mid]
        }
        
        // Если значение в середине меньше X, то ищем в правой половине
        if sortedArray[mid] < x {
            left = mid + 1
        } else {
            // Иначе - в левой
            right = mid - 1
        }
    }
    
    // Возвращаем значение, которое ближе всего к X
    // left - индекс последнего элемента, который меньше X
    // right - индекс первого элемента, который больше X
    
    if left >= sortedArray.count {
        return sortedArray[right]
    } else if right < 0 {
        return sortedArray[left]
    }
    
    // Сравниваем расстояния между x и соседними элементами
    let distanceToLeft = abs(sortedArray[left] - x)
    let distanceToRight = abs(sortedArray[right] - x)
    
    // Возвращаем элемент с меньшим расстоянием
    if distanceToLeft < distanceToRight {
        return sortedArray[left]
    } else {
        return sortedArray[right]
    }
}

findClosestValue(in: arr, to: target)
