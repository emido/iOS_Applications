//
//  ArticlePageViewModel.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-28.
//

import Foundation


final class ArticlePageViewModel: ObservableObject {
    @Published var article : Article
    
    init(article: Article) {
        self.article = article
    }
    
    
    func formattedDateString(from dateString: String) -> String {
        let date = article.publishedAt.toDate
        return date.articleDateString
    }
    
}
