//
//  TaskViewController.swift
//  TodoList
//
//  Created by Faki Doosuur Doris on 30.07.2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        
        // Do any additional setup after loading the view.
    }
    
    @objc func deleteTask(){
        //        let newCount = count - 1
        //        UserDefaults().setValue(newCount, forKey: "count") //decremention of task
        //        UserDefaults().setValue(nil, forKey: )
        //    }
        
    }
}
