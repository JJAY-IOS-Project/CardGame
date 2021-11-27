//
//  GameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        TabView {
            CardGameView()
                .tabItem {
                    Text("Play game")
                }
            ScoreView()
                .tabItem {
                    Text("Scores")
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}



