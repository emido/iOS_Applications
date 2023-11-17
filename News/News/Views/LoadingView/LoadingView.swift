//
//  LoadingView.swift
//  News
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color(.systemBackground)
            .ignoresSafeArea()
        ProgressView()
            .progressViewStyle(.automatic)
            .tint(.accentColor)
            .scaleEffect(2)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
