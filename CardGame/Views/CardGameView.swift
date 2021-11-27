//
//  CardGameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//



import SwiftUI

struct CardGameView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                
                HStack {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                    Image("back")
                        .resizable()
                        .frame(width: 120, height: 180)
                }
                
                Image("AppIcon")
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Deal")
                }
                Spacer()
                
                HStack {
                    Image("back")
                        .resizable()
                        .frame(width: 120, height: 180)
                    Image("back")
                        .resizable()
                        .frame(width: 120, height: 180)
                }
                
                HStack {
                    VStack {
                        Text("Player Score")
                        Text("0")
                    }
                    VStack {
                        Text("Player Hand")
                        Text("0")
                    }
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
