//
//  GameView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().barTintColor = .gray
    }
    var body: some View {
        TabView {
            CardGameView()
                .tabItem {
                    Label("Play", systemImage: "play.fill")
                }
            ScoreView()
                .tabItem {
                    Label("Scores", systemImage: "list.number")
                }
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}



