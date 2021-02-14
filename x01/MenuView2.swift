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
                LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "grad1")!), Color(UIColor(named: "grad2")!), Color(UIColor(named: "grad3")!)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                VStack(){
                    HStack{
                        Image(uiImage: viewModel.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3)).padding()
                            Spacer()
                        Button(action: {
                            print("Edit button was tapped")
                        }) {
                            Image(systemName: "text.justify")
                        }.padding(.vertical,20)
                        .padding(.trailing,20)
                        .foregroundColor(.white)
                        
                    }
                    .padding(.top, 30)
                    Spacer()
                    HStack{
                        VStack{
    
                            HStack{Text("Alec").font(.system(size: 60, weight: .semibold, design: .default)).foregroundColor(.white)
                            //    Spacer()
                                Spacer()
                            }
                            HStack{Text("Henderson").font(.system(size: 50, weight: .semibold, design: .default)).foregroundColor(.white)
                                Spacer()
                                
                            }
                        }.padding(.leading)
                        Spacer()
                    }
                    HStack(spacing: 60){
                        
                        VStack{
                            Text("Played").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("949").font(.system(size: 29, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        VStack{
                            Text("Won").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("785").font(.system(size: 29, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        VStack{
                            Text("Average").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("97.84").font(.system(size: 28, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        
                    }.padding()
                    .scaledToFill()
                    VStack (){
                        HStack{
                            MenuButton(index: 0, text: "Play Computer", image: "desktopcomputer")
                            MenuButton(index: 1, text: "Play Local", image: "person.fill")
   
                        }.padding(.bottom)
                        HStack{
                            MenuButton(index: 2, text: "Play Online", image: "network")
                            MenuButton(index: 3, text: "View Stats", image: "chart.bar.xaxis")
  
                        }.padding(.bottom)
                    }.padding()
                    
                    Spacer()
                            
                }.navigationBarHidden(true)
            }.ignoresSafeArea()
        }
    }
    
    fileprivate func MenuButton(index:Int, text:String, image:String) -> some View {
        return Button(action: {
            print("\(index) pressed.")
            
        }) {
            VStack{
                Spacer()
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 20, weight: .semibold, design: .default))
               .foregroundColor(Color.black)
               .contentShape(Rectangle())
                Spacer()
                Image(systemName: image)
                    .font(.system(size: 40, weight: .bold))
                    .padding()
                    
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
