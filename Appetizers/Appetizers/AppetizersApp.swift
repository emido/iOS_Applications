//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    var body: some Scene {
        WindowGroup {
            // because we have injected the order object as an environment object to the tab view,
            // we can access it in all the child views of the  tab view
            AppetizerTabView().environmentObject(order)
        }
    }
}
