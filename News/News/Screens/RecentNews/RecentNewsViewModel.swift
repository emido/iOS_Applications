//
//  RecentNewsViewModel.swift
//  News
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI


@MainActor final class RecentNewsViewModel : ObservableObject{
    
    @Published var recentNews : [TopNews]  = []
    @Published var didError = false
    @Published var isLoading = false
    @Published var isShowingNewsDetail = false
    
    var alertItem : AlertItem = AlertContext.genericError
    
    func getRecentNews() {
        isLoading = true
        Task {
            do {
                recentNews = try await NetworkManager.shared.getTopArticles()
                isLoading = false
            }catch {
                didError = true
                if let neError = error as? NEError {
                    switch neError {
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
            }
        }
    }
    
}
