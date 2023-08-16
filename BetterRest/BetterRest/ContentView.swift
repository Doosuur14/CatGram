//
//  ContentView.swift
//  BetterRest
//
//  Created by Faki Doosuur Doris on 16.08.2023.
//

import CoreML

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeAmount = 1
    
    //    @State private var alertTitle = ""
    //    @State private var alertMessage = ""
    //    @State private var showingAlert = false
    
    
    
    
    static var defaultWakeTime: Date{
        
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    
    var sleepResults: String{
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute) , estimatedSleep: sleepAmount , coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return  "Your ideal bedtime is " + sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            
            
            
        } catch {
            // something went wrong!
            
            return "There was an error"
        }
    }
    
    
    
    
    var body: some View {
        
        
        NavigationView {
            Form {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                // more to come
                Section{
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours" , value: $sleepAmount , in: 4...12 , step: 0.25)
                }
                
                Section{
                    Text("Daily Coffee intake")
                        .font(.headline)
                    // Stepper(coffeAmount == 1 ? "1 cup" : "\(coffeAmount) cups" , value: $coffeAmount , in: 1...20)
                    Picker("Number of cups" , selection: $coffeAmount){
                        ForEach(1..<10){
                            Text("\($0)")
                        }
                        
                    }
                    //.pickerStyle(.segmented)
                }
                
                
                Section{
                    Text("Recommended bed time")
                        .font(.headline)
                    Text(sleepResults)
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                }
                
                
                
                
            }
            .navigationTitle("BetterRest")
            // .toolbar{
            // Button("Calculate" , action: calculateBedtime)
            //}
        }
        
        
        
        
    }
}
    
    
    






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
