//
//  LoadingView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import SwiftUI

//struct ActivityIndicator: UIViewRepresentable {
//
//    // **********  VERY IMPORTANT ************
//    // makeUIView variable is the body that is going to replace our body in the view
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        let activityIndicatorView = UIActivityIndicatorView(style: .large)
//        activityIndicatorView.color = UIColor.brandPrimary
//        activityIndicatorView.startAnimating()
//        return activityIndicatorView
//    }
//
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
//    }
//}


struct LoadingView : View  {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
//            ActivityIndicator()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Color.brandPrimary)
                .scaleEffect(2)
//                .controlSize(.large)
        }
    }
    
    
}
