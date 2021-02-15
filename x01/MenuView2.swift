 //
 //  MenuView.swift
 //  x01
 //
 //  Created by Alec Henderson on 07/02/2021.
 //
 
 import SwiftUI
 
 struct MenuView2: View {
    
    @ObservedObject var viewModel : MenuViewModel
    let colors: [Color] = [.red, .green, .blue, .blue, .blue, .blue, .black]
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: SettingsView()
                                .navigationBarItems(
                                    leading:
                                        Text("Settings")
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
                               , isActive: $viewModel.didOpenSettings) {Text("") }
                
                NavigationLink(destination: GameSettingsView(gameType: .computer)
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
                
                NavigationLink(destination: GameSettingsView(gameType: .localPlayer)
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
                               , isActive: $viewModel.didStartGameLocal) {Text("") }
                
                LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "grad1")!), Color(UIColor(named: "grad2")!), Color(UIColor(named: "grad3")!)]), startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
                VStack(){
                    HStack{
                        Image(uiImage: viewModel.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                            
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3)).padding()
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                        Button(action: {
                            print("Edit button was tapped")
                            viewModel.didOpenSettings = true
                        }) {
                            Image(systemName: "text.justify")
                        }
                        .padding(.trailing,20)
                        .foregroundColor(.white)
                        
                    }
               
                    Spacer()
                    HStack{
                        VStack{
    
                            HStack{Text((viewModel.firstName)).font(.system(size: 70, weight: .semibold, design: .default)).foregroundColor(.white).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            //    Spacer()
                                Spacer()
                            }
                            HStack{Text(viewModel.lastName).font(.system(size: 50, weight: .semibold, design: .default)).foregroundColor(.white).shadow(radius: 7)
                                Spacer()
                                
                            }
                        }.padding(.leading)
                        Spacer()
                    }
                    HStack(spacing: 60){
                        
                        VStack{
                            Text("Played").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("949").font(.system(size: 29, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top, 5)
                        }
                        VStack{
                            Text("Won").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("785").font(.system(size: 29, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top,5)
                        }
                        VStack{
                            Text("Average").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("97.84").font(.system(size: 28, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top,5)
                        }
                        
                    }.padding()
                    .scaledToFill()
                    VStack (){
                        HStack{
                            MenuButton(index: 0, text: "Play Computer", image: "desktopcomputer").shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            MenuButton(index: 1, text: "Play Local", image: "person.fill").shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
   
                        }.padding(.bottom)
                        HStack{
                            MenuButton(index: 2, text: "Play Online", image: "network").shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            MenuButton(index: 3, text: "View Stats", image: "chart.bar.xaxis").shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
  
                        }.padding(.bottom)
                    }.padding()
                    .navigationViewStyle(StackNavigationViewStyle())
                    Spacer()
                            
                }.navigationBarHidden(true)
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    fileprivate func MenuButton(index:Int, text:String, image:String) -> some View {
        return Button(action: {
            print("\(index) pressed.")
            viewModel.didTapMenuItem(item: index)
        }) {
            VStack{
                Spacer()
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 20, weight: .semibold, design: .default))
               .foregroundColor(Color.black)
               //.contentShape()
                Spacer()
                Image(systemName: image)
                    .font(.system(size: 40, weight: .bold))
                    .padding(.bottom)
                    
                Spacer()
            }
        }
        .background(Color(.white))
        .cornerRadius(10)
        .buttonStyle(PlainButtonStyle())
    }
    
 }
 
 
 struct MenuView2_Previews: PreviewProvider {
    static var previews: some View {
        MenuView2(viewModel: MenuViewModel())
        
    }
 }
