//
//  NewsSourcesCellView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsSourcesCellView: View {
    var source: NewsSource
    var body: some View {
        VStack {
            Text(source.name)
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
//            Text(source.id)
//                .font(.body)
//                .fontWeight(.regular)
//                .multilineTextAlignment(.trailing)
        }
        .padding()
        
    }
}

struct NewsSourcesCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourcesCellView(source: MockSourcesData.sampleSource2)
    }
}
