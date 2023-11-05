//
//  AccountViewModel.swift
//  AppetizersApp
//
//  Created by Khairul on 11/2/23.
//

import SwiftUI

struct AlertItem: Identifiable
{
    var id = UUID()
    var title:String
    var message:String
    var dissmissButton:Alert.Button
}

struct AlertItemContext{
    static let invalidForm = AlertItem(title: "Invalid Form",
                                              message: "Please input all values",
                                              dissmissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: "Invalid Email address",
                                              message: "Please Enter Valid Email Address",
                                              dissmissButton: .default(Text("OK")))
}

final class AccountViewModel:ObservableObject{
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var frequentRefils = false
    @Published var alertItem:AlertItem?
    
    var isValidForm:Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertItemContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertItemContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        print("Save Changes Succefully")
    }
}
