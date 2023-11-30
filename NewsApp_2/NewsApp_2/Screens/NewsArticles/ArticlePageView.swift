//
//  ArticlePage.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-28.
//

import SwiftUI

struct ArticlePageView: View {
    
    let imageURLPlaceholderString = "https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg"
    @ObservedObject var viewModel : ArticlePageViewModel
    var body: some View {
        VStack(spacing: 20){
            AsyncImage(url: URL(string: viewModel.article.urlToImage ?? imageURLPlaceholderString)) { image in
                image
                    .articlePageImageModifier()
            } placeholder: {
                Image(systemName: "photo")
                    .articlePageImageModifier()
            }
            Text(viewModel.article.title  ?? "No Title Available")
                .font(.title2)
                .fontWeight(.medium)
                .fontDesign(.serif)
                .padding(5)
            Text(viewModel.article.content ?? "no more information")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            Text(viewModel.formattedDateString(from: viewModel.article.publishedAt))
            Spacer()
        }
    }
}

struct ArticlePageView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlePageView(viewModel: ArticlePageViewModel(article: MockArticleData.sampleArticle1))
    }
}
