//
//  NewsDetailView.swift
//  News
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI

struct NewsDetailView: View {
    
    let news : TopNews
//    @Binding var isShowingNewsDetail : Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: news.image_url)) { image in
                image
                    .DetailNewsImageModifier()
            } placeholder: {
                Image(systemName: "photo")
                    .DetailNewsImageModifier()
            }
            
            Text(news.description)
                .font(.body)
                .padding()
            
            
            Spacer()
            Button {
                print("button in detail tapped")
//                isShowingNewsDetail  = false
                
            } label: {
                Text("Close")
            }

        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: MockData.sampleNews) //, isShowingNewsDetail: .constant(true)
    }
}
