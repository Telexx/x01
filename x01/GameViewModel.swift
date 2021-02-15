//
//  GameViewModel.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import Foundation

class GameViewModel: ObservableObject{
    @Published var invalidScore = false
    @Published var gameWon = false
    let game : Game
    let speech = Speech()
    init(){
        let localPlayer = Player(name: "Alec Henderson", startingScore: 501)
        let otherLocalPlayer = Player(name: "Sophie Mansell", startingScore: 501)
        game = Game(opponentType: .localPlayer, startingScore: 501, players: [localPlayer,otherLocalPlayer], localStart: true, bestOf: 1)
    }
    
    func addScore(score:Int){
        if score > 180{
            invalidScore = true
        }
        else{
            game.addScore(score: score)
            speech.talk(phrase: String(score))
            print(gameWon)
            gameWon = game.matchWon
        }
    }
    
}
