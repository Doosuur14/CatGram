//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Faki Doosuur Doris on 14.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Moves = ["✊🏾"  , "🖐🏾" , "✌🏾"]
    let winningMoves = ["Paper" , "Scissors" , "Rock"]
    
    @State private var currentchoice = ""
    @State private var shouldWin = false
    @State private var Score = ""
    @State private var scorecount = 0
    
    @State private var randomMove = Int.random(in:0..<3)
    
    @State private var showingAlert = false
    
    var body: some View {
        
        
        
        //        ZStack{
        //            Color.gray
        //        }
        //
        
        
        //        Text("LET THE GAME BEGIN!!!")
        //            .font(.largeTitle)
        //            .foregroundColor(.pink)
        
        
        NavigationView{
            VStack{
                
                
                Text("Your score is: \(scorecount)")
                    .font(.subheadline)
                    .font(.system(size: 30))
                
                
                
                Text(" The computer chose: ")
                    .font(.system(size: 20))
                    .font(.headline)
                
                Text("\(Moves[randomMove])")
                    .font(.system(size: 200))
                
                
                
            }
            
            .navigationTitle("LET THE GAME BEGIN")
            
               
            
        }
            
            
        HStack{
            Button ("Rock 🪨"){
                
                if  Moves[randomMove] ==  "✌🏾" {
                    shouldWin = true
                    scorecount += 1
                    reset()
                }else{
                    shouldWin = false
                    reset()
                }
            }
            
            
            
            Button("Scissors ✂️"){
                if Moves[randomMove] == " 🖐🏾 "{
                    shouldWin = true
                    scorecount += 1
                    reset()
                }else{
                    shouldWin = false
                    reset()
                }
            }
            
            
          
            
            
            Button("Paper 📃"){
                if Moves[randomMove] ==  "✊🏾"{
                    shouldWin = true
                    scorecount += 1
                    reset()
                    //            }else if Moves[randomMove] == "Paper"{
                    //                shouldWin = false
                    //                reset()
                }else{
                    shouldWin = false
                    reset()
                }
                
            }
        }
            
              Spacer()
              Spacer()
            
            
                        
        }
        
   
    
    
    
    
    func reset(){
        randomMove = Int.random(in:0...2)
        currentchoice = Moves[randomMove]
        //scorecount = 0
        
    }
}
    

    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


