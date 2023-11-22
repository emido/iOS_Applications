//
//  NewsSourcesListView.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsSourcesListView: View {
    
    @ObservedObject var viewModel : NewsSourceListViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.category.title) Sources")
                .font(.title)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .center)
                
            List(viewModel.sources) { source in
                NewsSourcesCellView(source: source)
           }
            

        }
        .task {
            viewModel.getNewsSources(by: viewModel.category.title)
        }
        
    }
    
}

struct NewsSourcesListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourcesListView(viewModel: NewsSourceListViewModel(category: MockCategoryData.sampleCategory))
    }
}
