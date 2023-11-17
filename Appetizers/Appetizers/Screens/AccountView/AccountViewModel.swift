//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-06.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    //"user" is a key for saving the userdata into the userdefaults
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem : AlertItem?

    var isValidForm :  Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem  =  AlertContext.invalidForm
            return false
            
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        // the form is valid
        return true
    }
    
    
    func saveChanges() {
        // if the value of the invalid form is false the isValidForm  will handle the alerrt itself
        guard isValidForm else { return }
        
        // if the forrm is valid
        do {
            // encode our user into data
            let data = try JSONEncoder().encode(user)
            // save the data in userDefaults
            userData = data
            // notify user about the save
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func retrieveUser(){
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
}
