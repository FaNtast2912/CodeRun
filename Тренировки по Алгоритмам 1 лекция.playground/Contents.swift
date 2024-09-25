import UIKit


//MARK: - Линейный поиск

// MARK: Задача найти максимальный элемент в массиве.
// Текущий максимум лучше инициализировать первым элементом в массиве.

let seq = [1,43,6,79,124,87,12,57,8]
var ans = seq[0]
for i in 0...seq.count-1 {
    if seq[i] > ans {
        ans = seq[i]
    }
}
//print(ans)

// MARK: Задача найти второй по величине элемент (такое, которое будет максимальным, если вычеркнуть из последовательности одно максимальное число)

// Текущий максимум1 и максимум2 также инициализируем из первых элементов

var max1 = max(seq[0],seq[1])
var max2 = min(seq[0],seq[1])
for i in 0...seq.count-1 {
    if seq[i] > max1 {
        max2 = max1
    } else if seq[i] > max2 {
        max2 = seq[i]
    }
}
//print(max2)

// MARK: Задача найти минимальное четное число или -1 если ни одного четного числа нет

ans = -1
for i in 0...seq.count-1 {
    if seq[i] % 2 == 0, (ans == -1 || seq[i] < ans) {
        ans = seq[i]
    }
}
//print(ans)


// MARK: задача построить поле сапер

func makeField(n: Int, m: Int, mines: [[Int]]){
    let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
    let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
    
    var field = [[String]](repeating: [String](repeating: "0", count: m+2), count: n+2)
    
    for mine in mines {
        let minei = mine[0]
        let minej = mine[1]
        
        for k in 0..<dx.count {
            let i = minei + dx[k]
            let j = minej + dy[k]
            
            if i >= 0 && i <= n + 1 && j >= 0 && j <= m + 1 {
                if field[i][j] != "*" { // Проверяем, не является ли ячейка миной
                    field[i][j] = "\(Int(field[i][j])! + 1)"
                }
            }
        }
        
        field[minei][minej] = "*" // Установка мины
    }
    
    for i in 1...field.count-2 {
        print(field[i].dropFirst().dropLast().joined(separator: " "))
    }
}

// Пример использования:
let fieldParameters = ["27","26","674"]
let mines = [[22, 3], [25, 23], [2, 23]]
//makeField(n: Int(fieldParameters[0])!, m: Int(fieldParameters[1])!, mines: mines)


// MARK: задача pitcraft 
// Остров игрока представляет собой абор столбцов различной высоты состоящий из блоков камня и окруженный морем.
// Над островом прошел сильный дождь, который заполнил водой все низины. Определите, сколько блоков воды (0) осталось полсе дождя в низинах

/*
        1
     1 0 1
 1 0 1 1 1 0 0 1
 1 0 1 1 1 0 0 1
 1 1 1 1 1 1 1 1 1
 */

let field = [3,1,4,3,5,1,1,3,1]
var maximum = field[0]
var answer = 0
var maximumPos = 0

for i in 0...field.count-1 {
    if field[i] > maximumPos {
        maximumPos = i
    }
}


for i in 0...maximumPos {
    if field[i] <= maximum {
        answer += maximum - field[i]
    } else {
        maximum = field[i]
    }
}

maximum = field[field.count-1]
for i in stride(from: field.count-1, to: maximumPos, by: -1) {
    if field[i] <= maximum {
        answer += maximum - field[i]
    } else {
        maximum = field[i]
    }
}

//print(answer)

// MARK: Задача RLE
// дана строка (возможно пустая), состоящая из букв А-Z: "AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBB"
// нужно написать функцию RLE которая на выходе даст строку вида: "A4B3C2XYZD4E3F3A6B10"
let string = "AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBB"
if string.isEmpty {
    print("String is empty")
}

func easypeasy(_ s: String) -> String {
    var s = s.split(separator: "")
    var lastSymbol = s[0]
    var ans: [String] = []
    var currentCount = 0
    
    for i in 0...s.count-1 {
        if s[i] != lastSymbol {
            ans.append(String(lastSymbol))
            lastSymbol = s[i]
            if currentCount != 1 {
                ans.append(String(currentCount))
                currentCount = 1
            }
        } else {
            currentCount += 1
        }
    }
    ans.append(String(lastSymbol))
    if currentCount != 1 {
        ans.append(String(currentCount))
        currentCount = 1
    }
    
    return ans.joined(separator: "")
}

print(easypeasy(string))

// MARK: Задача Газон
