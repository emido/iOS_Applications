//
//  File.swift
//  WeatherApp
//
//  Created by Maryam on 2023-10-24.
//

import SwiftUI

struct weatherButton: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold))
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}


struct weatherButton_Previews: PreviewProvider {
    static var previews: some View {
        weatherButton(buttonText: "test title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
