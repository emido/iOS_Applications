//
//  NetworkManager.swift
//  News
//
//  Created by Maryam on 2023-11-16.
//

import UIKit
import Foundation
import SwiftUI


final class NetworkManager {
    
    static let shared  =  NetworkManager()
    
    private var parametersStringURL = ""
    
    static let baseURL = "https://api.thenewsapi.com/v1/news/"
    
    private let apiKey = "Mb2pnyAosrDrBFhFNb9ilfLQyMuC8tCMYM8mVaUK"
    private let headlineURL = baseURL + "headlines"
    private let topURL = baseURL + "top"
    private let allURL = baseURL + "all"
    private let sourcesURL = baseURL + "sources"
    
    private init() {}
    
    
    func createQuery(with parameters : [(String, String)], using urlLink : String) -> URL? {
        var queryItems = [URLQueryItem(name: "api_token", value: apiKey)]
        for parameter in parameters {
            queryItems.append(URLQueryItem(name: parameter.0, value: parameter.1))
        }
        var urlComponents = URLComponents(string: urlLink)!
        urlComponents.queryItems = queryItems
        let queryURL = urlComponents.url
        return queryURL
    }
    
    func getTopArticles() async throws -> [TopNews] {
        let parametersURL = createQuery(with: [("locale","us"), ("limit", "3")], using: topURL)
        guard let url = parametersURL else {
            throw NEError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(NewsResponse.self, from: data)
            return decodedResponse.data
        }catch {
            throw NEError.invalidData
        }
    }
}
