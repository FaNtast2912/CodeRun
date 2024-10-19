import UIKit
import Foundation
// Структура для представления вершины графа
struct Vertex: Hashable, CustomStringConvertible {
    let id: Int
    var description: String {
        "Vertex \(id)"
    }
}

// Структура для представления ребра графа
struct Edge: Hashable {
    let from: Vertex
    let to: Vertex

    var description: String {
        "Edge \(from) -> \(to)"
    }
}

// Структура для представления неориентированного графа
struct UndirectedGraph {
    private var adjacencyList: [Vertex: Set<Vertex>] = [:]

    // Добавление вершины в граф
    mutating func addVertex(_ vertex: Vertex) {
        adjacencyList[vertex] = []
    }

    // Добавление ребра в граф
    mutating func addEdge(_ edge: Edge) {
        adjacencyList[edge.from, default: []].insert(edge.to)
        adjacencyList[edge.to, default: []].insert(edge.from) // Для неориентированного графа добавляем ребро в обе стороны
    }

    // Поиск в глубину (DFS)
    func depthFirstSearch(startVertex: Vertex) -> Set<Vertex> {
        var visited = Set<Vertex>()
        var stack = [startVertex]

        while !stack.isEmpty {
            let currentVertex = stack.removeLast()
            if !visited.contains(currentVertex) {
                visited.insert(currentVertex)
                for neighbor in adjacencyList[currentVertex, default: []] {
                    stack.append(neighbor)
                }
            }
        }

        return visited
    }

    // Нахождение компонентов связанности
    func connectedComponents() -> [[Vertex]] {
        var components = [[Vertex]]()
        var visited = Set<Vertex>()
        let mustV = Vertex(id: 1)
        for vertex in adjacencyList.keys {
            if !visited.contains(vertex) {
                let component = depthFirstSearch(startVertex: vertex)
                if component.contains(mustV) {
                    components.append(Array(component))
                }
                visited.formUnion(component)
            }
        }

        return components
    }
}

// Пример использования:
var graph = UndirectedGraph()

let setup = readLine()!.split(separator: " ").map({Int($0)!})

if setup[1] > 0 {
    
    for i in 1...setup[0] {
        
        let vertex = Vertex(id: i)
        graph.addVertex(vertex)
        
    }
    
    for _ in 1...setup[1] {
        
        let line = readLine()!.split(separator: " ").map({Int($0)!})
        graph.addEdge(Edge(from: Vertex(id: line[0]), to: Vertex(id: line[1])))
        
    }
    
    // Нахождение компонентов связанности
    let components = graph.connectedComponents()
    var arr = [Int]()
    for vertex in components[0] {
        arr.append(vertex.id)
    }
    let sortedArr = arr.sorted()
    print(sortedArr.count)
    for i in sortedArr {
        print(i,terminator: " ")
    }
} else {
    print(1)
    print(1)
}

