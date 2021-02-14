 //
//  MenuView.swift
//  x01
//
//  Created by Alec Henderson on 07/02/2021.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel : GameViewModel
   @State private var score = ""
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
        VStack{
            HStack{
                ScoreView(score: String(viewModel.game.players[0].scoreRemaining), name: viewModel.game.players[0].name)
                ScoreView(score: String(viewModel.game.players[1].scoreRemaining), name: viewModel.game.players[1].name)
                Spacer()
            }
            Text(String(score)).padding()
                .foregroundColor(.white)
                .font(.title)
           KeyPadView()
        }.alert(isPresented: $viewModel.invalidScore, content: {
            Alert(title: Text("Error"), message: Text("Invalid Score Eneted"), dismissButton: .default(Text("OK")))
        })
        }
    }
    
    
    fileprivate func ScoreView(score:String, name:String) -> some View {
        return VStack(){
            Text(score)
                .font(.system(size: 60))
                .padding()
            Text(name)
                .font(.system(size: 20
                ))
        }
        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2.5, alignment: .top)
        .background(Color.green)
    }
    
    
    fileprivate func KeyPadButton(number:String) -> some View {
        return Button(action: {
            print("\(number) pressed.")
            if number.isNumeric{
                score = score+number
            }
            else{
                if number == "OK"{
                    viewModel.addScore(score: Int(score) ?? 0)
                    score = ""
                }
                if number == "C"{
                    score = ""
                }
            }
        }) {
            Text(number)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.headline)
               .foregroundColor(Color.white)
               .contentShape(Rectangle()) // Add this line
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.init("grad1"), Color.init("grad2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(4)
        .buttonStyle(PlainButtonStyle())
    }
    
    fileprivate func KeyPadView() -> some View {
        return VStack(spacing: 8){
            HStack(){
                KeyPadButton(number: "1")
                KeyPadButton(number: "2")
                KeyPadButton(number: "3")
                
            }.frame(maxWidth: .infinity)
            HStack{
                KeyPadButton(number: "4")
                KeyPadButton(number: "5")
                KeyPadButton(number: "6")
                
            }.frame(maxWidth: .infinity)
            HStack{
                KeyPadButton(number: "7")
                KeyPadButton(number: "8")
                KeyPadButton(number: "9")
                
            }.frame(maxWidth: .infinity)
            HStack{
                KeyPadButton(number: "C")
                KeyPadButton(number: "0")
                KeyPadButton(number: "OK")
                
            }.frame(maxWidth: .infinity)
    }
        .padding()
    }
    
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())

    }
}
