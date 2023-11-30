//
//  Article.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI




struct Article : Hashable, Codable, Identifiable {
    let id = UUID()
    let source : Source
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String
    let content : String?
    
    private enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

struct Source : Codable, Hashable {
    let id  : String
    let name: String
}

struct ArticleResponse : Codable {
    let status : String
    let totalResults : Int
    let articles : [Article]
}


struct MockArticleData {
    
    static let sampleArticle1  = Article(source: Source(id: "bbc-news", name: "BBC News"),
                                        author: "BBC News",
                                        title: "Israel Gaza live news: Gaza doctor says more 'intermittent shooting' heard at hospital",
                                        description: "The Indonesian Hospital boss tells the BBC hundreds of patients are still inside - but raises hopes of evacuations.",
                                         url: "http://www.bbc.co.uk/news/live/world-middle-east-67481139",
                                        urlToImage: "https://m.files.bbci.co.uk/modules/bbc-morph-news-waf-page-meta/5.3.0/bbc_news_logo.png",
                                        publishedAt: "2023-11-21T04:07:18.1477571Z",
                                        content: "If you're just joining us, you can catch up on our previous live coverage of the Israel-Hamas war here.\r\nAnd here's a quick summary of what we know so far:\r\n<ul><li>\r\n The director of Gaza's Indonesi… [+1263 chars]")
    
    static let sampleArticle2  = Article(source: Source(id: "bbc-news", name: "BBC News"),
                                        author: "BBC News",
                                        title: "Obama, Clooney and Gates: 'We can end child marriage in a generation",
                                        description: "Michelle Obama, Amal Clooney and Melinda French Gates tell the BBC about need to end child marriage.",
                                        url: "http://www.bbc.co.uk/news/world-67473254",
                                        urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/E747/production/_131770295_c32a2ab5-4711-478f-b5fd-5b403fc5e0af.jpg",
                                        publishedAt: "2023-11-21T03:52:15.2024374Z",
                                        content: "Three of the world's most influential women have told BBC News they want to end child marriage within a generation.\r\nMichelle Obama, Amal Clooney and Melinda French Gates announced last year a collab… [+8127 chars]")
    
    
    static let articleLists  = [sampleArticle1, sampleArticle2]
}
