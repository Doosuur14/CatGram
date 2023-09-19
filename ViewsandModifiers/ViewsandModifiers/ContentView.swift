 //
//  ContentView.swift
//  ViewsandModifiers
//
//  Created by Faki Doosuur Doris on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            
            //foregroundColor(.black)
            
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())

            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            
            
            Text("Hello world")
                .titleStyle()
            
            
            Text("I love you!")
                .titleForm()
            
               
        }
    }
}


struct Title: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius:10))
    }
}


struct title: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            
    }
}




//when working with custom modifiers we should create extensions
extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}

extension View{
    func titleForm() -> some View{
        modifier(title())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
