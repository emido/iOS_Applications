//
//  LoadingView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack  {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.accentColor)
                .scaleEffect(2)
                .padding()
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
