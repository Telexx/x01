 //
 //  MenuView.swift
 //  x01
 //
 //  Created by Alec Henderson on 07/02/2021.
 //
 
 import SwiftUI
 
 struct MenuView: View {
    
    @ObservedObject var viewModel : MenuViewModel
    
    fileprivate func MenuButton(title:String, index:Int) -> some View {
        return Button(title) {
            viewModel.didTapMenuItem(item: index)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]), startPoint: .top, endPoint: .bottomLeading))
        .font(.system(size: 35, weight: .semibold, design: .default))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: GameSettingsView()
                                .navigationBarItems(
                                    leading:
                                        Text("Game Setup")
                                        .padding()
                                        .foregroundColor(Color(.black)),
                                    trailing: // Add trailing view
                                        Image(uiImage: viewModel.avatar)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                        .edgesIgnoringSafeArea(.all)
                                )
                                .navigationBarTitleDisplayMode(.automatic)
                                .edgesIgnoringSafeArea(.all)
                               , isActive: $viewModel.didStartGameComputer) {Text("") }
                VStack(){
                    Spacer()
                    MenuButton(title: "vs Computer", index: 0)
                    MenuButton(title: "vs Local",index:1)
                    MenuButton(title: "Play Online",index:2)
                    MenuButton(title: "Stats",index:3)
                    MenuButton(title: "Settings",index:4)
                    Spacer()
                    
                }
            }
            .navigationBarItems(
                leading:
                    Text("Adrian Lewis (99.2)")
                    .font(.title2)
                    .padding()
                    .foregroundColor(Color(.black)),
                trailing: // Add trailing view
                    Image(uiImage: viewModel.avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            ).navigationBarTitleDisplayMode(.inline)
        }
    }
    func tap(hello:String){
    }
 }
 
 struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel())
        
    }
 }
