//
//  NewsHeadlinesListView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-25.
//

import SwiftUI

struct NewsArticleListView: View {
    @StateObject var viewModel : NewsArticlesListViewModel
    var body: some View {
        ZStack {
            List(viewModel.articles) { article in
                NavigationLink(value: article) {
                    ArticleListCell(article: article)
                }
                
            }
            .navigationDestination(for: Article.self){ article in
                ArticlePageView(viewModel: ArticlePageViewModel(article: article))
            }
            .task {
                viewModel.LoadArticles(by: viewModel.source.url.absoluteString)  //.name
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

struct NewsArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleListView(viewModel: NewsArticlesListViewModel(source:MockSourcesData.sampleSource1))
    }
}
