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
                VStack(spacing: 20){
                    HStack{
                        Spacer()
                        Button(action: {
                            print("Edit button was tapped")
                        }) {
                            Image(systemName: "text.justify")
                        }.padding(.vertical,45)
                        .padding(.trailing,20)
                        .foregroundColor(.white)
                        
                    }
                    HStack{
                        VStack{
                            HStack{Text("Alec").font(.system(size: 60, weight: .semibold, design: .default)).foregroundColor(.white)
                                Spacer()}
                            HStack{Text("Henderson").font(.system(size: 50, weight: .semibold, design: .default)).foregroundColor(.white)
                                Spacer()}
                        }.padding(.leading)
                        Spacer()
                    }
                    HStack(spacing: 60){
                        
                        VStack{
                            Text("Played").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("949").font(.system(size: 35, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        VStack{
                            Text("Won").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("785").font(.system(size: 35, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        VStack{
                            Text("Average").font(.system(size: 16, weight: .semibold, design: .default)).foregroundColor(.white)
                            Text("97.84").font(.system(size: 35, weight: .heavy, design: .default)).foregroundColor(.white).padding(.top)
                        }
                        
                    }.padding()
                    VStack (){
                        HStack{
                            MenuButton(index: 1, text: "Play Online")
                            MenuButton(index: 1, text: "Play Online")
   
                        }.padding(.bottom)
                        HStack{
                            MenuButton(index: 1, text: "Play Online")
                            MenuButton(index: 1, text: "Play Online")
  
                        }.padding(.bottom)
                    }.padding()
                    
                    Spacer()
                            
                }.navigationBarHidden(true)
            }.ignoresSafeArea()
        }
    }
    
    fileprivate func MenuButton(index:Int, text:String) -> some View {
        return Button(action: {
            print("\(index) pressed.")
            
        }) {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.headline)
               .foregroundColor(Color.black)
               .contentShape(Rectangle()) // Add this line
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
