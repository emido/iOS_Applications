//
//  ArticleCell.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI

struct ArticleListCell: View {
    var article  : Article
    let imageURLPlaceholderString = "https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg"
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.urlToImage ?? imageURLPlaceholderString)) { image in
                image
                    .listImageModifier()
            } placeholder: {
                Image(systemName: "photo")
                    .listImageModifier()
            }

            Text(article.title ?? "No Title Available")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.leading)
        }
        
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListCell(article: MockArticleData.sampleArticle1)
    }
}
