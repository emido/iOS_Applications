//
//  NewsSourceListViewModel.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI


final class NewsSourceListViewModel : ObservableObject {
    
    @Published var category : NewsCategory
    @Published var sources : [NewsSource] = []
    
    init(category: NewsCategory) {
        self.category = category
    }
    
    
    
    func getNewsSources(by category: String) {
        // lowercase the category title
        let category = category.lowercased()
        Task {
            do {
                sources = try await NetworkManager.shared.getSources(by: category)
                print(sources)
            } catch {
                print("error happened")
            }
        } 
    }
}
