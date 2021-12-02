//
//  CardGameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

// Only have 13 cards because we don't really need different suits

import SwiftUI

struct CardGameView: View {
    @State private var randCPUNum = [52,52]
    @State private var randPlayerNum = [52,52]
    @State private var randNum = 1
    @State private var playerHandScore = 0
    @State private var cpuHandScore = 0
    @State private var foldCount = 3
    @State private var showAlert = false
    @State private var showAlert2 = false
    @State private var firstCPUCard = 52
    @State private var isPlaying = false
    @State private var winHandStatus = ["won. Wait 2.5s for next pair." , "lost. Press Play to play again" ,"tied. Wait 2.5s for next pair."]
    @State private var winString = -1
    @State var offsetX = 30 // x coordinate offest of each card
    @State var deck = Deck()
    @State var index = 0...1
    @State var playerScore = 0
    @State var index2 = 2

    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
            }
            
                
            VStack {
                Text("CPU Hand")
                Text("\(cpuHandScore)")
                HStack { // CPU cards
                    ZStack {
                        ForEach(0..<index2) { i in
                            if i == 0 {
                                Image(deck.deck[firstCPUCard])
                                    .resizable()
                                    .frame(width: 120, height: 180)
                                    .offset(x: CGFloat(offsetX*i))
                            } else {
                                Image(deck.deck[randCPUNum[i]])
                                    .resizable()
                                    .frame(width: 120, height: 180)
                                    .offset(x: CGFloat(offsetX*i))
                            }
                            
                        }
                    }
                    
                }
                
                // Logo and Deal button
                Spacer()
                    .frame(height: 20)
                Image("Logo")
                Spacer()
                    .frame(height: 20)
                HStack {
                    Button("Fold")  {
                        showAlert = true
                        fold()
                    }
                        .padding(.leading, 20)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Folds left:  \(foldCount)"))
                        }

                    Spacer()
                    Button("Play", action: {
                        // Randomizes CPU and Player Card
                        play()
                    })
                    Spacer()
                    Button("War") {
                        war()
                        showAlert2 = true
                    }
                        .padding(.trailing, 20)
                        .alert(isPresented: $showAlert2) {
                            Alert(title: Text("You \(winHandStatus[winString])"))
                        }
                }
                .foregroundColor(.black)
                
                Spacer()
                    .frame(height: 20)
                
                HStack { // Player cards
                    ZStack {
                        ForEach(0..<index2) { i in
                            Image(deck.deck[randPlayerNum[i]])
                                .resizable()
                                .frame(width: 120, height: 180)
                                .offset(x: CGFloat(offsetX*i))
                        }
                    }
                    
                }
                
                HStack { // Player score and hand
                    VStack {
                        Text("Player Score")
                        Text("\(playerScore)")
                    }
                    .padding(.leading, 20)
                    Spacer()
                    VStack {
                        Text("Player Hand")
                        
                        Text("\(playerHandScore)")
                    }
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 90)
            }
        }
        
    }
    
}


extension CardGameView {
    func fold() {
        if foldCount != 0 {
            foldCount -= 1
            playerHandScore = 0
            cpuHandScore = 0
            for i in index {
                let x = Int.random(in: 0...51)
                let y = Int.random(in: 0...51)
                randPlayerNum[i] = x
                randCPUNum[i] = y
                playerHandScore += x/4 + 1 // Calc hand score
                if i > 0 {
                    cpuHandScore += y/4 + 1
                }
            }
        }
    }
    
    func play() {
        isPlaying = true
        playerScore = 0
        newHand()
    }

    func newHand() {
        foldCount = 3
        playerHandScore = 0
        cpuHandScore = 0
        for i in index {
            let x = Int.random(in: 0...51)
            let y = Int.random(in: 0...51)
            randPlayerNum[i] = x
            randCPUNum[i] = y
            playerHandScore += x/4 + 1 // Calc hand score
            if i > 0 {
                cpuHandScore += y/4 + 1
            }
            if i == 0 {
                randCPUNum[0] = 52
            }
            firstCPUCard = randCPUNum[0]
        }
    }
    
    
    func makeCardsBlank() {
        playerHandScore = 0
        cpuHandScore = 0
        for i in index {
            randPlayerNum[i] = 52
            randCPUNum[i] = 52
        }
        
    }
    
    func war() {
        var countWar = 1
        if isPlaying == true && countWar != 0{
            firstCPUCard = Int.random(in: 0...51)
            randCPUNum[0] = firstCPUCard
            cpuHandScore += firstCPUCard/4 + 1
            if (playerHandScore > cpuHandScore) { // win
                winString = 0
                playerScore += 1
                DispatchQueue.main.asyncAfter(deadline:.now() + 2.5) {
                    newHand()
                }
                
                
            } else if (playerHandScore < cpuHandScore) { // lose
                winString = 1
                isPlaying = false
                DispatchQueue.main.asyncAfter(deadline:.now() + 2.5) {
                    makeCardsBlank()
                    firstCPUCard = 52
                }
                
            } else { // tie
                winString = 2
                DispatchQueue.main.asyncAfter(deadline:.now() + 2.5) {
                    newHand()
                }
                
            }
            countWar -= 1
        }
        
    }
}


struct Deck { // Holds deck of images
    var deck = ["1C", "1D", "1H", "1S",
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
                "13C", "13D", "13H", "13S",
                "back"]

}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
