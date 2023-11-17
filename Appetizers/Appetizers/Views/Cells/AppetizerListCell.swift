//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.image)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
//                .aspectRatio(contentMode: .fit)
            AsyncImage(url: URL(string: appetizer.image)) { image in
                image
                    .cellImageModifier()
            } placeholder: {
                Image("food-placeholder")
                    .cellImageModifier()
            }
                
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(appetizer.calories)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)

        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
