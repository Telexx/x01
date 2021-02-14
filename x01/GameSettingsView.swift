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
    @State private var numberOfLegs = 1.0
    let gameTypes = ["501", "301", "701", "1001"]
    let opponentLevels = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        ZStack{
            Form {
                Section(header: Text("GAME FORMAT")) {
                    Picker("Select starting score", selection: $selectedGameType){
                        ForEach(gameTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Toggle("Player throws first?", isOn: $playerThrowsFirst)
                    Slider(value: $numberOfLegs, in: 0...100, step: 1)
                }
                Section(header: Text("OPPONENT LEVEL")) {

                }
                
                Section {
                    Button("Start Game") {
                        // activate theme!
                    }
                }
            }
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView()
    }
}
