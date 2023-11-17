//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-10-25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel : FrameWorkDetailViewModel
    
    var body: some View {
        VStack {
        
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            
            Link(destination: URL(string: viewModel.framework.urlString)  ?? URL(string: "www.apple.com")!)  {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .foregroundColor(.white)
            .buttonBorderShape(.capsule)
            .tint(.red)
            
//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
//               //AFButton(title: "Learn More")
//                Label("Learn More", systemImage: "book.fill")
//            }
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .foregroundColor(.white)
//            .buttonBorderShape(.capsule)
//            .tint(.red)
//
            
            
        }
//            .fullScreenCover(isPresented: $viewModel.isShowingSafariView) {
//            SafariView(url: URL(string: viewModel.framework.urlString)  ?? URL(string: "www.apple.com")!)
//        }   // there is sheet and there is also fullScreenCover with the same arguments that covers the while page
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameWorkDetailViewModel(framework: MockData.sampleFramework))
    }
}
