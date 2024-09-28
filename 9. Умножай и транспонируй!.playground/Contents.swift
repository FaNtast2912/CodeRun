import UIKit

let arr = readLine()!.split(separator: " ").map{ Int($0)! }
let n = arr[0]
let m = arr[1]
let k = arr[2]


func makeMatrix(_ i: Int) -> [[Int]] {
    var matrix: [[Int]] = []
    for _ in 1...i {
        let row = readLine()!.split(separator: " ").map{ Int($0)! }
        matrix.append(row)
    }
    return matrix
}

let firstMatrix = makeMatrix(n)
let secondMatrix = makeMatrix(m)

func multiplyMatrices(matrix1: [[Int]], matrix2: [[Int]]) -> [[Int]] {
    let rows1 = matrix1.count
    let columns1 = matrix1[0].count
    let columns2 = matrix2[0].count

    if columns1 != matrix2.count {
        print("Матрицы несовместимы для умножения")
        return []
    }

    var resultMatrix = [[Int]](repeating: [Int](repeating: 0, count: rows1), count: columns2)

    for i in 0..<columns2 {
        for j in 0..<rows1 {
            for k in 0..<columns1 {
                resultMatrix[i][j] += matrix1[j][k] * matrix2[k][i]
            }
        }
    }

    return resultMatrix
}

let resultMatris = multiplyMatrices(matrix1: firstMatrix, matrix2: secondMatrix)

func printMatrix(matrix: [[Int]]) {
    for row in matrix {
        for element in row {
            print(element, terminator: " ")
        }
        print()
    }
}


printMatrix(matrix: resultMatris)
