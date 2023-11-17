//
//  RecentNewsCellViews.swift
//  News
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct RecentNewsCellViews: View {
    var news: TopNews
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: news.image_url)) { image in
                image
                    .cellImageModifier()
            } placeholder: {
                Image(systemName: "photo")
                    .cellImageModifier()
            }

            Text(news.title)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.leading)
        }
    }
}

struct RecentNewsCellViews_Previews: PreviewProvider {
    static var previews: some View {
        RecentNewsCellViews(news: MockData.sampleNews)
    }
}
