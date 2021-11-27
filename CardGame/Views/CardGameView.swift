//
//  CardGameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

// Only have 13 cards because we don't really need different suits

import SwiftUI

struct CardGameView: View {
    @State private var randCPUNum1 = 0
    @State private var randCPUNum2 = 0
    @State private var randPlayerNum1 = 0
    @State private var randPlayerNum2 = 0
    @State var offsetX = 30 // x coordinate offest of each card
    @State var deck = Deck()

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("CPU Hand")
                Text("0")
                HStack { // CPU cards
                    ZStack {
                        Image(deck.deck[randCPUNum1])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 180)
                        Image(deck.deck[randCPUNum2])
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
                        deal()
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
                        Image(deck.deck[randPlayerNum1])
                            .resizable()
                            .frame(width: 120, height: 180)
                        Image(deck.deck[randPlayerNum2])
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


extension CardGameView {
    func deal() {
        //self.randCPUNum1 = Int.random(in: 1...52)
        self.randCPUNum2 = Int.random(in: 1...52)
        self.randPlayerNum1 = Int.random(in: 1...52)
        self.randPlayerNum2 = Int.random(in: 1...52)
    }
    
}


struct Deck {
    var deck = ["back",
                "1C", "1D", "1H", "1S",
                "2C", "2D", "2H", "2S",
                "3C", "3D", "3H", "3S",
                "4C", "4D", "4H", "4S",
                "5C", "5D", "5H", "5S",
                "6C", "6D", "6H", "6S",
                "7C", "7D", "7H", "7S",
                "8C", "8D", "8H", "8S",
                "9C", "9D", "9H", "9S",
                "10C", "10D", "10H", "10S",
                "11C", "11D", "11H", "11S",
                "12C", "12D", "12H", "12S",
                "13C", "13D", "13H", "13S",]

}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
