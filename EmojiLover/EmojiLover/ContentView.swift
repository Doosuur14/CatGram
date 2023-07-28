//
//  ContentView.swift
//  EmojiLover
//
//  Created by Faki Doosuur Doris on 28.07.2023.
//

import SwiftUI


enum Emoji: String , CaseIterable{ // A list of cases you can define and pick from.
    case  🥹,🥰,🥳,😱
}

struct ContentView: View {
    @State var EmojiSelection: Emoji = .🥹
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text(EmojiSelection.rawValue)
                    .font(.system(size: 200))
                
                
                Picker("Select Emoji", selection: $EmojiSelection){
                    ForEach(Emoji.allCases, id:\.self){ emoji in
                        Text(emoji.rawValue)
                    }
                }
                .navigationTitle("My First App!")
                .pickerStyle(.wheel)
            }
            .padding() //It helps to change the dimension of the picker
        }
    }
}

struct ContentView_Previews: PreviewProvider { //this is what shows the canvas on the right
    static var previews: some View {
        ContentView()
    }
}
