//
//  ViewController.swift
//  Intenship Practice
//
//  Created by Faki Doosuur Doris on 01.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        main()
    }


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
        print("Enter the day:")
        guard let day = Int(readLine() ?? "") else {
            print("Invalid input for day")
            return
        }

        print("Enter the month:")
        guard let month = Int(readLine() ?? "") else {
            print("Invalid input for month")
            return
        }

        print("Enter the year:")
        guard let year = Int(readLine() ?? "") else {
            print("Invalid input for year")
            return
        }

        if let dayOfWeek = dayOfWeek(forDate: day, month: month, year: year) {
            print("The day of the week for \(day)/\(month)/\(year) is \(dayOfWeek)")
        } else {
            print("Invalid date")
        }
    }
}






