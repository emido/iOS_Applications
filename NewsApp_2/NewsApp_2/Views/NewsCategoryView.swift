//
//  NewsCategoryView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsCategoryView: View {
    
    var category : NewsCategory
    var body: some View {
        VStack {
            Image(systemName: category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .cornerRadius(8)
            Text(category.title)
                .font(.headline)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
            
        }
        .foregroundColor(.accentColor)
        .padding()
    }
}

struct NewsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoryView(category: MockCategoryData.sampleCategory)
    }
}
