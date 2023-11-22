//
//  NewsArticles.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI

struct NewsArticles: View {
    var body: some View {
        VStack {
            Text("BBC News")
                .font(.title)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .center)
            List(MockArticleData.articleLists) { article in
               NavigationLink(value: article) {
                   ArticleCell(article: article)
               }
           }
        }
    }
}

struct NewsArticles_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticles()
    }
}
