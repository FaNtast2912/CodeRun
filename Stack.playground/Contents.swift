import UIKit

/*
 ___ _           _
 / __| |_ __ _ __| |__ ___
 \__ \  _/ _` / _| / /(_-<
 |___/\__\__,_\__|_\_\/__/
 
 */


 // Last-in first-out (LIFO)
class Stack<T> {
    private var array: [T] = []

    // Добавляет элемент на вершину стека - O(1)
    func push(_ item: T) {
        array.append(item)
    }

    // Удаляет последний добавленный в стек элемент - O(1)
    func pop() -> T? {
        array.popLast()
    }

    // Позволяет просмотреть элемент на вершине стека - O(1)
    func peek() -> T? {
        array.last
    }

    // Возвращает информацию о том, пуст ли стек или нет - O(1)
    var isEmpty: Bool {
        array.isEmpty
    }

    // Количество элементов - O(1)
    var count: Int {
        array.count
    }
}

struct StackStruct<T> {
    fileprivate var array = [T]()
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        array.popLast()
    }
    
    var peek: T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}
