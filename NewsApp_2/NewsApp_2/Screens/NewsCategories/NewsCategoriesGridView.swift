//
//  NewsSourcesGridView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsCategoriesGridView: View {
    @StateObject var viewModel = NewsCategoriesGridViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.newsCategories) { category in
                        NavigationLink(value: category) { 
                            NewsCategoryView(category: category)
                        }
                        
                    }
                }
                
            }
            .navigationTitle("News Categories")
            .navigationDestination(for: NewsCategory.self) { category in
                NewsSourcesListView(viewModel: NewsSourceListViewModel(category: category))
            }
        }
    }
}

struct NewsSourcesGridView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoriesGridView()
    }
}
