import UIKit
import Foundation

// Очередь для поиска в ширину
struct Queue<T> {
    private var array: [T]
    
    init() {
        array = []
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func add(_ element: T) {
        array.append(element)
    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
}

// Стек для поиска в глубину
struct Stack<T> {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    var top: T? {
        return array.last
    }
}

class Graph {
    var V = 0                       // количество вершин
    var adj = [[Int]]()             // список смежности
    
   
    
    
    init(_ V: Int) {
        self.V = V
        for _ in 0..<V {
            adj.append([Int]())  // создать пустой массив списков смежности
        }
    }
    
    func addEdge(v: Int, w: Int) {
        adj[v].append(w)
        print(adj)
    }
    
    // Обход в ширину (BFS) от заданной начальной вершины s
    func BFS(s: Int) -> [Int] {
        
        var result = [Int]()
        
        // Отметить все вершины как не посещенные
        var visited = adj.map { _ in false }
        
        // Создать очередь для обхода в ширину (BFS Queue)
        var queue = Queue<Int>()
        
        // Отметить первую вершину как посещенную и добавить в очередь
        visited[s] = true
        print("Starting at \(s)")
        queue.add(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.remove()!
            print("De-queueing \(current)")
            
            // Получить все смежные вершины текущей вершины
            // Если смежная вершина еще не посещена,
            // отметить её как посещенную и добавить в очередь
            
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    print("Queuing \(n)")
                    queue.add(n)
                    result.append(n)
                }
            }
        }
        
        return result
    }
    
    // Обход в глубину (DFS) от заданной начальной вершины s
    func DFS(s: Int) -> [Int] {
        print(adj)
        var result = [Int]()
        
        // Отметить все вершины как не посещенные
        var visited = adj.map { _ in false }
        
        // Создать стек для обхода в глубину (DFS Stack)
        var stack = Stack<Int>()
        
        // Отметить первую вершину как посещенную и добавить в стек
            print("Начало с вершины \(s)")
        visited[s] = true
        stack.push(s)
        
        while stack.count > 0 {
            let current = stack.pop()!
                    print("Извлечение из стека \(current)")
            result.append(current)
            
            // Перебрать всех соседей, добавляя их в стек и извлекая по мере углубления
            for n in adj[current] {
                for n in adj[current] {
                    if visited[n] == false {
                        visited[n] = true
                                        print("Добавление в стек - \(n)")
                        stack.push(n)
                    }
                }
            }
        }
        return result
    }
}


let g = Graph(5)
g.addEdge(v: 2, w: 2)
g.addEdge(v: 3, w: 4)
g.addEdge(v: 2, w: 3)
g.addEdge(v: 1, w: 3)
g.addEdge(v: 2, w: 4)

//g.BFS(s: 0)
print(g.DFS(s: 1))


