//
//  ViewController.swift
//  FlagGameUIkit
//
//  Created by Faki Doosuur Doris on 30.08.2023.
//

import UIKit



class ViewController: UIViewController {
    
    
   
    @IBOutlet var Button1: UIButton!
    
    
    @IBOutlet var Button2: UIButton!
    
    
    @IBOutlet var Button3: UIButton!
    
    
    var countries = [String]() // this creates an empty array
    var Score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
       
        
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
        
        
       
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        questionsAsked += 1
        
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
        
        
        if questionsAsked == 4 {
            let final = UIAlertController(title: "WELL DONE!", message: "You've completed the Level one. Your final score is \(Score)", preferredStyle: .alert)
            final.addAction(UIAlertAction(title: "OK", style: .default))
            present(final, animated: true)
            
        }
                
    }
    
    
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            Score += 1
            
        }else {
            title = "Wrong"
            Score -= 1
            
            let msg = UIAlertController(title: title, message: "Wrong! That is the flag of \(countries[sender.tag]). Your score is \(Score)." , preferredStyle: .alert)
            
            msg.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(msg, animated: true)
            
            
            
        }
        let ac = UIAlertController(title: title, message: "Your score is \(Score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
        
        var scoreBoard = UILabel(frame: CGRect(x: 81 , y: 103 , width: 200 , height:35))
        scoreBoard.font = UIFont.preferredFont(forTextStyle: .subheadline)
        scoreBoard.text = "Your score is \(Score)"
        self.view.addSubview(scoreBoard)
        
        
    }

}

//CA layer is a core animation data type that is responsible for handling the way our view looks in IOS.it uses CGcolor to set colors.

