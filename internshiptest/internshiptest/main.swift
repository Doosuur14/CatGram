//
//  main.swift
//  internshiptest
//
//  Created by Faki Doosuur Doris on 01.05.2024.
//

import Foundation

func dayOfWeek(forDate date: Int, month: Int, year: Int) -> Int? {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = date

    guard let date = Calendar.current.date(from: components) else {
        return nil
    }

    var weekday = Calendar.current.component(.weekday, from: date)
// Adjust the weekday so that Sunday is considered the first day of the week (1)
    if weekday == 1 {
        weekday = 7
    } else {
        weekday -= 1
    }

    return weekday
}


func main() {
    print("Enter the number of months in a year and the number of days in a week (N L):")
    guard let input1 = readLine()?.split(separator: " ").compactMap({ Int($0) }), input1.count == 2 else {
        print("Invalid input")
        return
    }
    let N = input1[0]
    let L = input1[1]

    print("Enter the number of days in each month (D1 D2 ... DN):")
    guard let daysInMonth = readLine()?.split(separator: " ").compactMap({ Int($0) }), daysInMonth.count == N else {
        print("Invalid input")
        return
    }

    print("Enter today's date (d1 m1 y1 t1):")
    guard let input2 = readLine()?.split(separator: " ").compactMap({ Int($0) }), input2.count == 4 else {
        print("Invalid input")
        return
    }
    let d1 = input2[0]
    let m1 = input2[1]
    let y1 = input2[2]
    let t1 = input2[3]

    print("Enter the date you're interested in (d2 m2 y2):")
    guard let input3 = readLine()?.split(separator: " ").compactMap({ Int($0) }), input3.count == 3 else {
        print("Invalid input")
        return
    }
    let d2 = input3[0]
    let m2 = input3[1]
    let y2 = input3[2]

    if let dayOfWeek = dayOfWeek(forDate: d2, month: m2, year: y2) {
        print("The day of the week for \(d2)/\(m2)/\(y2) is \(dayOfWeek)")
    } else {
        print("Invalid date")
    }
}

main()
