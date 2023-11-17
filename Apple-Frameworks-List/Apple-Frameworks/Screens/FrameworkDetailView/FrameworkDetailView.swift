//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-10-25.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework  : Framework
    @Binding var isShowingDetailView : Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
                        
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
               AFButton(title: "Learrn More")
            }
        }.fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)  ?? URL(string: "www.apple.com")!)
        }   // therre is sheet and there is also fullScreenCover with the same arrguments that covers the while page
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}
