//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

struct AccountView: View {
   
    @StateObject var viewModel:AccountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.birthday)
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header:Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refils", isOn: $viewModel.frequentRefils)
                }
                .toggleStyle(SwitchToggleStyle(tint: .red))
            }
            .navigationTitle("Muntasir 🏀 🇧🇩")
        }
        .alert(item: $viewModel.alertItem) { alertitem in
            Alert(title: Text(alertitem.title),
                  message: Text(alertitem.message),
                  dismissButton: alertitem.dissmissButton)
        }
    }
}

#Preview {
    AccountView()
}
