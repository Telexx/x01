 //
//  MenuView.swift
//  x01
//
//  Created by Alec Henderson on 07/02/2021.
//

import SwiftUI

struct GameView: View {
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
        VStack{
            HStack{
                ScoreView(score: "501", name: "Alec Henderson")
                ScoreView(score: "501", name: "Phil Taylor")
                Spacer()
            }
            Spacer()
           KeyPadView()
        }
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
        MenuView(viewModel: MenuViewModel())

    }
}