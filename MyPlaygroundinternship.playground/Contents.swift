import UIKit

func dayOfWeek(forDate date: Int, month: Int, year: Int) -> Int? {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = date

    guard let date = Calendar.current.date(from: components) else {
        return nil
    }

    let weekday = Calendar.current.component(.weekday, from: date)
    return weekday == 1 ? 7 : weekday - 1
}

func main() {
    
    guard let input1 = readLine()?.split(separator: " ").map({ Int($0) }),
          input1.count == 2,
          let N = input1.first,
          let L = input1.last else {
        print("Invalid input for N and L")
        return
    }


    _ = readLine()


    guard let input2 = readLine()?.split(separator: " ").map({ Int($0) }),
          input2.count == 3,
          let d2 = input2[0],
          let m2 = input2[1],
          let y2 = input2[2] else {
        print("Invalid input for d2, m2, and y2")
        return
    }

    // Calculate and print the day of the week
    if let dayOfWeek = dayOfWeek(forDate: d2, month: m2, year: y2) {
        print(dayOfWeek)
    } else {
        print("Invalid date")
    }
}

main()
