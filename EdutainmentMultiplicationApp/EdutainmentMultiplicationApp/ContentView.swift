//
//  ContentView.swift
//  EdutainmentMultiplicationApp
//
//  Created by Faki Doosuur Doris on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tableNumber = 2
    @State private var numberArray = [2,3,4,5,6,7,8,9,10,11,12]
   
    
    
    var body: some View {
        
        VStack{
            
            Text("Which multiplication do you want to practice")
                .font(.headline)
                .foregroundColor(.pink)
            Stepper("\(tableNumber) times table" ,value: $tableNumber , in: 2...12)
            
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
