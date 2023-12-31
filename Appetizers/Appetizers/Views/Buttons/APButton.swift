//
//  APButton.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-06.
//

import SwiftUI

struct APButton: View {
    
    let title : LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(15)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title")
    }
}
