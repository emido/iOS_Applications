//
//  Alert.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-24.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}



struct AlertContext {
    //MARK: Network Alerts
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue contacting to the server. If this persists, please contact support."),
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
    
}
