//
//  Alert.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}



struct AlertContext {
    //MARK: Network Alerts
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue contacting to the server. If this perrsists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection and try again."),
                                            dismissButton: .default(Text("OK")))
    static let genericError     = AlertItem(title: Text("Server Error!"),
                                            message: Text("Sorry, we are unable to complete your call. Please check the newtwork connection and try again later"),
                                            dismissButton: .default(Text("OK")))
    
    //MARK: Account Alerts
    static let invalidForm      = AlertItem(title: Text("Invalid Fform"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    static let invalidEmail     = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct"),
                                            dismissButton: .default(Text("OK")))
    static let userSaveSuccess     = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("OK")))
    static let invalidUserData     = AlertItem(title: Text("Profile Error!"),
                                            message: Text("There was an error saving orr retrieving your profile."),
                                            dismissButton: .default(Text("OK")))
    
    
    

}
