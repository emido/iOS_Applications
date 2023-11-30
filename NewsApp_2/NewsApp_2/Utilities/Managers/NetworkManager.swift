//
//  NetworkManager.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    static let baseURL  = "https://newsapi.org/v2"
    static let topHeadlinesURL = baseURL + "/top-headlines"
    static let sourcesURL = baseURL + "/top-headlines/sources"
    static let apiKey = "546901209aa14cf2819c9dc2e71f86a7"
    
    
    private init() {}
    
    
    func createQuery(with parameters: [(String, String)], using urlLink: String) -> URL? {
        var queryItems = [URLQueryItem(name: "apiKey", value: NetworkManager.apiKey)]
        for parameter in parameters {
            queryItems.append(URLQueryItem(name: parameter.0, value: parameter.1))
        }
        var urlComponents = URLComponents(string: urlLink)!
        urlComponents.queryItems = queryItems
        let queryURL = urlComponents.url
        return queryURL
    }
    
    
    
    func getSources(by category: String) async throws -> [NewsSource] {
        let parametersURL = createQuery(with: [("category", category)], using: NetworkManager.sourcesURL)
        guard let url = parametersURL else {
            throw NSError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let decodedResponse  = try decoder.decode(NewsSourceResponse.self, from: data)
            return decodedResponse.sources
        } catch {
            throw NSError.invalidData
        }
    }
    

    func getTopArticles(from Source: String) async throws -> [Article] {
        let parametersURL = createQuery(with: [("sources", Source)], using: NetworkManager.topHeadlinesURL)
        
        guard let url = parametersURL else {
            throw NSError.invalidURL
        }
//        print(url)
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(ArticleResponse.self, from: data)
            print(decodedResponse.totalResults)
            return decodedResponse.articles
        } catch {
            throw NSError.invalidData
        }
    }
    
    
    
    
    
    
    
    
}

