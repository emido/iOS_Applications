//
//  ContentView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem{ Label("Home", systemImage: "house") }
            AccountView()
                .tabItem{ Label("Account", systemImage: "person") }
            OrderView()
                .tabItem{ Label("Order", systemImage: "bag") }
                .badge(order.items.count)
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
