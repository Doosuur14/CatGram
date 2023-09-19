//
//  ContentView.swift
//  Animations
//
//  Created by Faki Doosuur Doris on 20.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    @State private var isShowingRed =  false
    
    
    var body: some View {
        
        //.animation(.spring(), value: dragAmount)
        
        VStack {
            Button("Tap Me") {
                // do nothing
                withAnimation{
                    isShowingRed.toggle()
                }
                
            }
            
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        
        
        .onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
    }

        
    
}


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}







//These binding animations effectively turn the tables on implicit animations: rather than setting the animation on a view and implicitly animating it with a state change, we now set nothing on the view and explicitly animate it with a state change. In the former, the state change has no idea it will trigger an animation, and in the latter the view has no idea it will be animated – both work and both are important.

