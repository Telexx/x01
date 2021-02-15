//
//  EditProfileView.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import SwiftUI

struct EditProfileView: View {

    var weights = [11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]
    var dexteritys = ["Right", "Left"]
   @ObservedObject var viewModel : EditProfileViewModel
    
    init(viewModel:EditProfileViewModel = EditProfileViewModel()){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack{
        HStack{
            Spacer()
            Image(uiImage: UIImage(named: "phil")!).resizable().scaledToFill().frame(width: 150, height:150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipShape(Circle())  .overlay(Circle().stroke(Color.white, lineWidth: 2)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.top).padding(.bottom, 10)
            Spacer()
        }
            Spacer()
        Form{
            
            Section(header: Text("PERSONAL INFORMATION")) {
                TextField("Firstname", text: $viewModel.firstname)
                TextField("Surname", text: $viewModel.surname)
                DatePicker("Date of Birth", selection: $viewModel.dob, displayedComponents: .date)
            }
            Section(header: Text("DARTS PROFILE")) {
                TextField("Darts Brand", text: $viewModel.brand)
                TextField("Darts Model", text: $viewModel.model)
                Picker("Weight", selection: $viewModel.selectedWeight) {
                        ForEach(weights, id: \.self) {
                            Text(String($0))
                        }
                    }
                Picker("Dexterity", selection: $viewModel.selectedDexterity) {
                        ForEach(dexteritys, id: \.self) {
                            Text(String($0))
                        }
                    }
            }
            Section {
                Button("Save changes") {
                    // activate theme!
                }
            }
        }
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(viewModel.firstname) \(viewModel.surname)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(viewModel: EditProfileViewModel())
    }
}
