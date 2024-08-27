import UIKit

//Дан список. Определите, является ли он монотонно возрастающим (то есть верно ли, что каждый элемент этого списка больше предыдущего).
//
//Выведите YES, если массив монотонно возрастает и NO в противном случае.

var sarr = [Int]();
while let line = readLine() {
    let words = line.split(separator: " ")
    sarr += words.map { Int($0)! }
}

var a = Int.min
var answer = ""

if sarr.count == 1 {
    answer = "YES"
}

for i in 0...sarr.count-1 {
    if sarr[i] <= a {
        answer = "NO"
    } else {
        a = sarr[i]
    }
}

print(answer == "" ? "YES":answer)
