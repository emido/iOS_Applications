//
//  NewsSourcesListView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsSourcesListView: View {
    
    @StateObject var viewModel : NewsSourceListViewModel
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            List(viewModel.nSources) { source in
                NavigationLink(value: source) {
                    NewsSourcesCellView(source: source)
                }
           }
            .navigationDestination(for: NewsSource.self) { source in
                NewsArticleListView(viewModel: NewsArticlesListViewModel(source: source))
                    .navigationTitle("\(source.name.capitalized)")
            }
            .searchable(text: $searchText, prompt: "Look for a news source...")
            .onChange(of: searchText) { newSearch in
                viewModel.search(with: newSearch)
            }
            .task {
                viewModel.getNewsSources(by: viewModel.category.title)
            }
            .alert(isPresented: $viewModel.didError) {
                Alert(title: viewModel.alertItem.title,
                      message: viewModel.alertItem.message,
                      dismissButton: viewModel.alertItem.dismissButton)
            }
            if(viewModel.isLoading) {
                LoadingView()
            }
        }
    }
        
    
}

struct NewsSourcesListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourcesListView(viewModel: NewsSourceListViewModel(category: MockCategoryData.sampleCategory))
    }
}
