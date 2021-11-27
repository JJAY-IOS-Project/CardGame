//
//  CardGameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

// Only have 13 cards because we don't really need different suits

import SwiftUI

struct CardGameView: View {
    @State private var randCPUNum1 = 2
    @State private var randCPUNum2 = 2
    @State private var randPlayerNum1 = 2
    @State private var randPlayerNum2 = 2
    @State var offsetX = 30 // x coordinate offest of each card
    @State var blackjack = 21 // Win Condition

    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("CPU Hand")
                Text("0")
                HStack { // CPU cards
                    ZStack {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 180)
                        Image("card" + String(randCPUNum2))
                            .resizable()
                            .frame(width: 120, height: 180)
                            .offset(x: CGFloat(offsetX))
                    }
                    
                }
                
                // Logo and Deal button
                Spacer()
                Image("Logo")
                Spacer()
                HStack {
                    Button("Hit", action : {
                        
                    })
                        .padding(.leading, 20)
                    Spacer()
                    Button("Deal", action: {
                        // Randomizes CPU and Player Card
                        self.randCPUNum1 = Int.random(in: 2...14)
                        self.randCPUNum2 = Int.random(in: 2...14)
                        self.randPlayerNum1 = Int.random(in: 2...14)
                        self.randPlayerNum2 = Int.random(in: 2...14)
                    })
                    Spacer()
                    Button("Stop", action : { //
                        
                    })
                        .padding(.trailing, 20)
                }
                .foregroundColor(.black)
                
                Spacer()
                
                HStack { // Player cards
                    ZStack {
                        Image("card" + String(randPlayerNum1))
                            .resizable()
                            .frame(width: 120, height: 180)
                        Image("card" + String(randPlayerNum2))
                            .resizable()
                            .frame(width: 120, height: 180)
                            .offset(x: CGFloat(offsetX))
                    }
                    
                }
                
                HStack { // Player score and hand
                    VStack {
                        Text("Player Score")
                        Text("0")
                    }
                    .padding(.leading, 20)
                    Spacer()
                    VStack {
                        Text("Player Hand")
                        Text("0")
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
