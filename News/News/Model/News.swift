//
//  News.swift
//  News
//
//  Created by Maryam on 2023-11-16.
//

import SwiftUI
import Foundation


struct TopNews : Decodable, Identifiable, Hashable{
    //: Decodable
//    var id = UUID()
    let uuid : String
    var id: String { uuid }
    let title : String
    let description  : String
    let keywords : String
    let snippet : String
    let url : String
    let image_url : String
    let language : String
    let published_at : String
    let source : String
    let categories : [String]
    let relevance_score : String?
    let locale :  String
//    let similar : [News]?
}



struct NewsResponse : Decodable { 
    let meta : Dictionary<String, Int64>// {String : Int}
    let data : [TopNews]
}


struct MockData {
    
    static let sampleNews =  TopNews(uuid: "a4a9d029-8b3b-4667-bad1-99479757fa30",
                                  title: "The mounting evidence Biden got rich from dictators like China's Xi",
                                  description: "All the evidence about the Biden family’s money-making schemes mean President Joe Biden has been lying to the public.",
                                  keywords: "",
                                  snippet: "NEW You can now listen to Fox News articles!\n\nA reporter asked me the other day if all the evidence about the Biden family’s money-making schemes (checks, sec...",
                                  url: "https://www.foxnews.com/opinion/mounting-evidence-biden-got-rich-dictators-china-xi",
                                  image_url: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/694940094001/e5b99331-27ab-49ab-b99e-e8aeaece4227/e5a7091b-1c38-4f4d-9ba7-5ecc824e3381/1280x720/match/image.jpg",
                                  language: "en",
                                  published_at: "2023-11-15T07:00:05.000000Z",
                                  source: "foxnews.com",
                                  categories:  ["general","politics"],
                                  relevance_score: nil,
                                  locale: "us")
                                 // similar: [singleSimilarNews, singleSimilarNews, singleSimilarNews, singleSimilarNews, singleSimilarNews])
        
                                  
    static let singleSimilarNews = TopNews(uuid: "bcd162b9-84dd-4ff9-a4f7-07b0e171be29",
                                        title: "As Biden and Xi meet, Asian manufacturing slowdown returns to a 2020 low, led by a softer China",
                                        description: "Asia-based suppliers are seeing largest rise in idle manufacturing since 2020 as region's economy slows, raising stakes for Biden and Xi tariff talks.",
                                        keywords: "World economy, Asia Economy, Trade, Xi Jinping, China, business news",
                                        snippet: "The GEP Global Supply Chain Volatility Index, produced by S&P Global and GEP, tracks supply chain orders which show rising spare supplier capacity as a result o...",
                                        url: "https://www.cnbc.com/2023/11/15/asia-manufacturing-slowdown-returns-to-2020-low-led-by-softer-china.html",
                                        image_url: "https://image.cnbcfm.com/api/v1/image/107334054-1700047194723-gettyimages-531829980-90659841.jpeg?v=1700047268&w=1920&h=1080",
                                        language: "en",
                                        published_at: "2023-11-15T11:53:43.000000Z",
                                        source: "cnbc.com",
                                        categories: ["general","business"],
                                        relevance_score: nil,
                                        locale: "us")
    
    static let listOfNews = [sampleNews, sampleNews, sampleNews]
}
