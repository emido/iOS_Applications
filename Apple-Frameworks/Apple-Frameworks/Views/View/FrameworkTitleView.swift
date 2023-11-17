//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-10-26.
//

import SwiftUI


struct FrameworkTitleView : View {
    let framework: Framework
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
}

struct FrameworkTitleView_previews: PreviewProvider {
    static var  previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}

