//
//  GameSettingsView.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import SwiftUI

struct GameSettingsView: View {
    @State private var selectedGameType = "501"
    @State private var selectedOpponentLevel = 6
    @State private var playerThrowsFirst = true
    @State private var numberOfLegs = 7.0
    @State private var adaptiveAI = false
    @State private var didStartGame = false
    @State private var opponentName = ""
    var gameType: OpponentType
    init(gameType: OpponentType){
        self.gameType = gameType
    }
    
    let gameTypes = ["501", "301", "701", "1001"]
    let opponentLevels = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        ZStack{
            
            NavigationLink(destination: GameView(viewModel: GameViewModel())
                            .navigationBarTitleDisplayMode(.automatic)
                           , isActive: $didStartGame) {Text("") }
            
            Form {
                Section(header: Text("GAME FORMAT")) {
                    Picker("Select starting score", selection: $selectedGameType){
                        ForEach(gameTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Toggle("Adrian throws first?", isOn: $playerThrowsFirst)
                    Slider(value: $numberOfLegs, in: 1...30, step: 2)
                    Text("Best of \(Int(numberOfLegs)) leg(s)")
                }

                if gameType == .computer{
                    Section(header: Text("OPPONENT LEVEL")) {
                        Toggle("Adaptive AI? 🤖", isOn: $adaptiveAI)
                        if !adaptiveAI{
                            Picker("Select AI level 🤖", selection: $selectedOpponentLevel){
                                ForEach(opponentLevels, id: \.self) {
                                    Text(String($0))
                                }
                            }
                        }
                        else{
                            Text("The AI will give you a good game, playing close to your level.").font(.callout).foregroundColor(.gray)
                        }
                    }
                    
                }
                if gameType == .localPlayer{
                    Section(header: Text("OPPONENT INFORMATION")) {
                        TextField("Opponent Name", text: $opponentName)
           
                    }
                    
                }
    
                Section {
                    Button("Start Game") {
                        didStartGame = true
                    }
                }
            }
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameType: .localPlayer)
    }
}
