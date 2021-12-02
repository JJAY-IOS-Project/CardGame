//
//  ScoreView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

import SwiftUI

struct ScoreView: View {
    var scoreToDisplay: [ScoresList]
    var body: some View {
        NavigationView {
            List(scoreToDisplay) {
                group in ListRow(eachScore: group)
            }.navigationBarTitle(Text("High Scores"))
        }

    }
}

struct ListRow: View {
    var eachScore: ScoresList
    var body: some View {
            HStack {
                Text(eachScore.name)
                Spacer()
                Text("\(eachScore.highScore)")
            }
    }
}

public struct ScoresList: Identifiable {
    public var id: String
    var name: String
    var highScore: Int
}

public var sampleList = [
    ScoresList(id: "Sam", name: "Sam", highScore: 250),
    ScoresList(id: "John", name: "John", highScore: 30),
    ScoresList(id: "Max", name: "Max", highScore: 60),
    ScoresList(id: "Ralph", name: "Ralph", highScore: 50),
]

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(scoreToDisplay: sampleList)
    }
}
