//
//  ContentView.swift
//  x01
//
//  Created by Alec Henderson on 07/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var viewModel : LoginViewModel
    
    
    
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(destination: MenuView2(viewModel: MenuViewModel())
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true), isActive: $viewModel.isLoggedIn) {Text("") }
                
                NavigationLink(destination: SignupView(viewModel: viewModel), isActive: $viewModel.didTapSignup) {Text("") }
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("x01")
                       // .padding(.top,70)
                        .font(.system(size: 70, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .opacity(0.7)
                    VStack{
                        HStack{
                            Text("Sign in")
                                .padding()
                                .font(.headline)
                      //  Spacer()
                        }
                        TextField("Username", text: $username)
                            .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        
                        SecureField("Password", text: $password)
                            .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        
                        Button("Login"){
                            viewModel.login(username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.black)
                        .cornerRadius(7)
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        Button("Forgotten Password") {
                            
                        }
                        .padding(.top)
                        .foregroundColor(.black)
                        Button("Sign Up") {
                            viewModel.didTapSignup = true
                        }
                        .padding(.top)
                        .foregroundColor(.black)
                    }
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .opacity(0.6)
                    .cornerRadius(9)
                    .padding(.top, 50)
                    Spacer()
                    
                }
            }.navigationBarTitle("")
        }.alert(isPresented: $viewModel.loginError, content: {
            Alert(title: Text("Registration Error"), message: Text(viewModel.loginErrorText), dismissButton: .default(Text("OK")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: LoginViewModel())
    }
}
