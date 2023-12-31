//
//  NewsSourceListViewModel.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI


@MainActor final class NewsSourceListViewModel : ObservableObject {
    
    @Published var nSources : [NewsSource] = []
    @Published var isLoading =  false
    @Published var didError = false
    var category : NewsCategory

    
    var alertItem : AlertItem = AlertContext.genericError
    
    
    
    init(category: NewsCategory) {
        self.category = category
    }
    
    
    
    func getNewsSources(by category: String) {
        isLoading = true
        // lowercase the category title
        let category = category.lowercased()
        Task {
            do {
                nSources = try await NetworkManager.shared.getSources(by: category)
                isLoading = false
            } catch {
                didError = true
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
    
    
    func search(with query: String) {
        nSources = query.isEmpty ?  nSources : nSources.filter{ $0.name.contains(query) }
    }
}


