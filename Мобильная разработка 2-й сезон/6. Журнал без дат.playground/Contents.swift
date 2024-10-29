import UIKit

let mock = []

func convertTimeToSeconds(timeString: String) -> Int {
  let formatter = DateFormatter()
  formatter.dateFormat = "HH:mm:ss"
  let date = formatter.date(from: timeString)!
  let seconds = Int(date.timeIntervalSinceReferenceDate)
  return seconds
}

func makeArr() -> [Int] {
    var intArr = [Int]()
    while let line = readLine() {
        intArr.append(convertTimeToSeconds(timeString: line))
    }
    return intArr
}

let arr = makeArr()

func countDays(in arr: [Int]) -> Int {
    let totalSeconds = 86400
    var dayStart = 86400
    var count = 0
    
    for secons in arr {
        dayStart = totalSeconds - secons
        print(dayStart)
    }
    return 0
}
countDays(in: arr)
//print(countDays(in: arr))


var statix: Int? 
