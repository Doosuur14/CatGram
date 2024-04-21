//
//  main.swift
//  HigherOrderFunctionHW4
//
//  Created by Faki Doosuur Doris on 28.09.2023.
//

import Foundation

struct Tasks {
    var taskName: String
    var startDate: Date
    var finishDate: Date
    init(taskName: String, startDate: Date, finishDate: Date) {
        self.taskName = taskName
        self.startDate = startDate
        self.finishDate = finishDate
    }
}

var taskList = [
    Tasks(taskName: "Building an app", startDate:Date(month: 9 , day: 13, year: 2023), finishDate: Date(month: 9 , day: 20, year: 2023)),
    Tasks(taskName: "Cleaning the house", startDate: Date(month: 9 , day: 20, year: 2023), finishDate: Date(month: 9 , day: 21, year: 2023)),
    Tasks(taskName: "Grocery shopping", startDate: Date(month: 10 , day: 20, year: 2023), finishDate: Date(month: 10 , day: 20, year: 2023)),
    Tasks(taskName: "Visa renewal", startDate: Date(month: 10 , day: 14, year: 2023), finishDate: Date(month: 10 , day: 14, year: 2023)),
    Tasks(taskName: "Dog walking", startDate: Date(month: 9 , day: 29, year: 2023), finishDate: Date(month: 9 , day: 29, year: 2023)),
]


//Sorting by name
private func sortAlphabetically() {
        let sortedTasks = taskList.sorted {
            $0.taskName < $1.taskName
        }
        print(sortedTasks)
    }
//Sorting by creationDate
private func sortByCreationDate() {
    let sortedTasks = taskList.sorted {
        $0.startDate < $1.startDate
    }
    print(sortedTasks)
}
//Sorting by completionDate
private func sortByCompletionDate() {
    let sortedTasks = taskList.sorted {
        $0.finishDate < $1.finishDate
    }
    print(sortedTasks)
}
//filtering by month
private func filterByMonth(_ month: Int) {
    let filteredTaskList = taskList.filter {
        return Calendar.current.component(.month, from: $0.startDate) == month
    }
    print(filteredTaskList)
}

class RunCode {
    func run() {
        while true {
            let prompt = """
        a/A: sort task alphabetically
        b/B: sort by date of creation
        c/C: sort by date of completion
        d/D: filter by month
        q/Q: quit
        """
            print(prompt)
            guard let input = readLine()?.lowercased()
            else {
                break
            }
            print(input)
            switch input {
            case "a":
                sortAlphabetically()
            case "b":
                sortByCreationDate()
            case "c":
                sortByCompletionDate()
            case "d":
                print("Enter month number")
                guard let number = readLine() else { return }
                filterByMonth(Int(number) ?? 0)
            case "q":
                return
             
            default:
                print("Unknown Key, Please try again")
            }
        }
    }
}
//Running the code
let tester = RunCode()
tester.run()


extension Date {
    init(month: Int, day: Int, year: Int) {
        var dateComponents = DateComponents()
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.year = year
        dateComponents.timeZone = .current
        dateComponents.calendar = .current
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }
}
