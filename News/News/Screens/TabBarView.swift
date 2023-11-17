//
//  TabBarView.swift
//  News
//
//  Created by Maryam on 2023-11-16.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            RecentNewsView()
                .tabItem {Label("Recent News", systemImage: "newspaper")}
            NewsSourceGridView()
                .tabItem{Label("Sources", systemImage: "text.line.first.and.arrowtriangle.forward")}
            FavSourcesView()
                .tabItem{Label("Favourites", systemImage: "star")}
            AccountView()
                .tabItem{Label("Account", systemImage: "person")}
            
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
