//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Faki Doosuur Doris on 14.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Moves = ["Rock" , "Paper" , "Scissors"]
    let winningMoves = ["Paper" , "Scissors" , "Rock"]
    
    @State private var currentchoice = ""
    @State private var shouldWin = false
    @State private var Score = ""
    @State private var scorecount = 0
    
    @State private var randomMove = Int.random(in:0...2)
    
    @State private var showingAlert = false
    
    var body: some View {
        
        
        
//        ZStack{
//            Color.gray
//        }
//        
       Spacer()
        
        Text("LET THE GAME BEGIN!!!")
            .font(.largeTitle)
            .foregroundColor(.pink)
        
        Spacer()
       
        
        VStack(spacing:15){
            
            
            Text("Your score is: \(scorecount)")
                .font(.system(size: 30))
           
            
            
            Text(" The computer chose: " + Moves[randomMove])
                .font(.system(size: 20))
            
            
            
        }
        
      
        Spacer()
        
        
        Button("Rock 🪨"){
            
            if  Moves[randomMove] == "Scissors"{
                shouldWin = true
                scorecount += 1
                reset()
            }else{
                shouldWin = false
                reset()
            }
        }
        
        Spacer()
        
        
        Button("Scissors ✂️"){
            if Moves[randomMove] == "Rock"{
                shouldWin = true
                scorecount += 1
                reset()
            }else{
                shouldWin = false
                reset()
            }
        }
        
        
        Spacer()
        
        
        Button("Paper 📃"){
            if Moves[randomMove] == "Scissors"{
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
        
      //  Spacer()
        //Spacer()
        
        
        
        
    }
        
    
        func reset(){
            randomMove = Int.random(in:0...2)
            currentchoice = Moves[randomMove]
            
        }
    }

    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


