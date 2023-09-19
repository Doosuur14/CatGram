//
//  EntryViewController.swift
//  TodoList
//
//  Created by Faki Doosuur Doris on 30.07.2023.
//

import UIKit

class EntryViewController: UIViewController , UITextFieldDelegate {
    
    //field where a user can enter in a task
    @IBOutlet var field: UITextField!

    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style:.done , target: self, action: #selector(saveTask))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         saveTask()
         return true
    }
           
        
        
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else{
            return
        }
        //user defaults used to save little things.We are going to save how many tasks we have, and also number them
        
        guard let count =  UserDefaults().value(forKey: "count") as? Int else{
            return
            
        }
            let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "text_\(newCount)")
        
        update?()
            navigationController?.popViewController(animated:true)
    }

        // Do any additional setup after loading the view.
    
    

}


