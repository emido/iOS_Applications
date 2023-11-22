//
//  ArticleCell.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI

struct ArticleCell: View {
    var article  : Article
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.url)) { image in
                image
                    .listImageModifier()
            } placeholder: {
                Image(systemName: "photo")
                    .listImageModifier()
            }

            Text(article.title)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.leading)
        }
        .padding()
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: MockArticleData.sampleArticle1)
    }
}
