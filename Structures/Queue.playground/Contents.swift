import UIKit

/*
  ___
 / _ \ _  _ ___ _  _ ___ ___
 | (_) | || / -_) || / -_|_-<
 \__\_\\_,_\___|\_,_\___/__/
 
 */


// First-in first-out (FIFO)


class Queue<T> {
    private var array: [T] = []

    // Добавить элемент в очередь - O(1)
    func enqueue(_ item: T) {
        array.append(item)
    }
  
    // Возвращает первый элемент из очереди - O(n)
    func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    // Возвращает информацию о том, пуста ли очередь - O(1)
    var isEmpty: Bool {
        return array.isEmpty
    }

    // Считает количество элеменов в очереди - O(n)
    var count: Int {
        return array.count
    }
  
    // Позволяет просмотреть первый элемент в очереди - O(1)
    func peek() -> T? {
        return array.first
    }
}

struct QueueStruct<T> {
    private var array: [T] = []
    
    mutating func enqueue(_ item: T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func peek() -> T? {
        return array.first
    }
}
