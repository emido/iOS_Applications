//
//  RecentNewsView.swift
//  News
//
//  Created by Maryam on 2023-11-16.
//

import SwiftUI

struct RecentNewsView: View {
    
    @StateObject var viewModel = RecentNewsViewModel()
    var body: some View {
        ZStack {
            NavigationStack {
                VStack{
                    List(viewModel.recentNews) { news in
                        NavigationLink(value: news) {
                            RecentNewsCellViews(news: news)
                        }
                            
                    }
                    .listStyle(.plain)
                    .navigationTitle("Recent News")
                    .navigationDestination(for: TopNews.self) { news in
                        NewsDetailView(news: news)
                    }
                }
            }
            .task {
                viewModel.getRecentNews()
            }
            .alert(isPresented: $viewModel.didError) {
                Alert(title: viewModel.alertItem.title,
                      message: viewModel.alertItem.message,
                      dismissButton: viewModel.alertItem.dismissButton)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
       

    }
}

struct RecentNewsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentNewsView()
    }
}
