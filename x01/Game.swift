//
//  Game.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import Foundation

class Game{
    private var opponentType:OpponentType
    private var startingScore : Int
    var players: [Player]
    init(opponentType:OpponentType, startingScore:Int, players:[Player]){
        self.opponentType = opponentType
        self.startingScore = startingScore
        self.players = players
    }
}

enum OpponentType{
    case computer
    case localPlayer
}


class Player{
    var name: String
    var startingScore: Int
    var scores = [Int]()
    var scoreRemaining: Int{
        var remaining = startingScore
        for score in scores{
            remaining = remaining - score
        }
        return remaining
    }
    
    var totalScore:Int{
        return scores.reduce(0, +)
    }
    
    var average: Double{
        Double(totalScore/(scores.count))
    }
    
    func undoLastScore(){
        scores.removeLast()
    }
    
    func addScore(score:Int){
        scores.append(score)
    }
        
    init(name:String, startingScore:Int){
            self.name = name
            self.startingScore = startingScore
        }
          
    }




