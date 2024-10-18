import UIKit
import Foundation


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

    // Нахождение компонентов связанности для вершины mustV
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
