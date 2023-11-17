//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-07.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName : String
    let message   : String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.thin)
                    .frame(height: 120)
                    .foregroundColor(Color.brandPrimary)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(14)
            }
            .offset(y:-70)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "newspaper", message: "it is a test message. \nI'm making it a  little long for testing")
    }
}
