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
    var turnIndex: Int
    var bestOf : Int
    var legWon:Bool{
        if players[0].scoreRemaining == 0{
            players[0].legs = players[0].legs+1
        return true
        }
        if players[1].scoreRemaining == 0{
           players[1].legs = players[1].legs+1
        return true
        }
        return false
    }
    
    var matchWon:Bool{
        if players[0].legs == bestOf{
            return true
        }
        if players[1].legs == bestOf{
            return true
        }
        return false
    }
    
    
    init(opponentType:OpponentType, startingScore:Int, players:[Player], localStart:Bool, bestOf:Int){
        self.opponentType = opponentType
        self.startingScore = startingScore
        self.players = players
        self.bestOf = bestOf
        if localStart{
            turnIndex = 0
        }
        else{
            turnIndex = 1
        }
    }
    
    func addScore(score:Int){
        switch turnIndex{
        case 0:
            players[turnIndex].addScore(score: score)
            turnIndex = 1
        case 1:
            players[turnIndex].addScore(score: score)
            turnIndex = 0
        default:
            return
        }
    }
    
    func undoScore(){
        switch turnIndex{
        case 0:
            players[1].undoLastScore()
            turnIndex = 1
        case 1:
            players[0].undoLastScore()
            turnIndex = 0
        default:
            return
        }
    }
}

enum OpponentType{
    case computer
    case localPlayer
}


class Player{
    var legs = 0
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
        if totalScore == 0 {
            return 0
        }
        else{
       return Double(totalScore/(scores.count))
        }
    }
    
    func undoLastScore(){
        scores.removeLast()
    }
    
    func addScore(score:Int){
        if score <= scoreRemaining{
        scores.append(score)
        }
    }
    
    init(name:String, startingScore:Int){
        self.name = name
        self.startingScore = startingScore
    }
    
}




