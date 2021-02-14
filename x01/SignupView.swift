//
//  ContentView.swift
//  x01
//
//  Created by Alec Henderson on 07/02/2021.
//

import SwiftUI

struct SignupView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @ObservedObject var viewModel : LoginViewModel
    
    
    
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(destination: MenuView(viewModel: MenuViewModel()), isActive: $viewModel.didSignUp) {Text("") }
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
                            Text("Sign Up")
                                .padding()
                                .font(.headline)
                      //  Spacer()
                        }.padding()
                        
                        TextField("Email Address", text: $username)
                            .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        
                        SecureField("Password", text: $password)
                            .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        SecureField("Confirm Password", text: $passwordConfirm)
                            .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        
                        Button("Register!"){
                            if password != passwordConfirm{
                                viewModel.loginError = true
                                viewModel.loginErrorText = "Passwords do not match"
                            }
                            else{
                                viewModel.register(username: username, password: password)
                            }
                            
                
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        .frame(width: 270, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.black)
                        .cornerRadius(7)
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        
        
                    }
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .opacity(0.6)
                    .cornerRadius(9)
                    .padding(.top, 50)
                    Spacer()
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $viewModel.signupError, content: {
            Alert(title: Text("Login Error"), message: Text(viewModel.signupErrorText), dismissButton: .default(Text("OK")))
        })
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: LoginViewModel())
    }
}
