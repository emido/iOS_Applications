//
//  NewsHeadlinesListViewModel.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-25.
//

import SwiftUI


@MainActor final class NewsArticlesListViewModel : ObservableObject {
   
    @Published var articles : [Article] = []
    var source: NewsSource

    @Published var isLoading = false
    @Published var didError = false
    var alertItem : AlertItem = AlertContext.genericError

    
    init(source: NewsSource) {
        self.source = source
    }
    
    func LoadArticles(by source: String) {
        isLoading  = true
        Task {
            do {
                articles = try await NetworkManager.shared.getTopArticles(from: source)
                isLoading = false
            } catch {
                didError  = true
                if let nsError = error as? NSError {
                    switch nsError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                else {
                    alertItem = AlertContext.genericError
                }
                isLoading = false
            }
        }
        
    }
    
}
