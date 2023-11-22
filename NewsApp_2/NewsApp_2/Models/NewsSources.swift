//
//  NewsSources.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import Foundation


struct NewsSource:Decodable, Identifiable, Hashable{
    let id : String
    let name: String
    let description : String
    let url: URL
    let category: String
    let language: String
    let country: String
}



struct NewsSourceResponse : Decodable {
    let status : String
    let sources  : [NewsSource]
}

struct MockSourcesData {
    static let sampleSource1 = NewsSource(id: "argaam",
                                          name: "Argaam",
                                          description: "ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده ",
                                          url: URL(string: "http://www.argaam.com")!,
                                          category: "business",
                                          language: "ar",
                                          country: "sa")
    
    static let sampleSource2 = NewsSource(id: "australian-financial-review",
                                          name: "Australian Financial Review",
                                          description: "The Australian Financial Review reports the latest news from business, finance, investment and politics, updated in real time. It has a reputation for independent, award-winning journalism and is essential reading for the business and investor community.",
                                          url: URL(string: "http://www.afr.com")!,
                                          category: "business",
                                          language: "en",
                                          country: "au")
    
    static let sources = [sampleSource1, sampleSource2, sampleSource2, sampleSource2, sampleSource1]
}
