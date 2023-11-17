//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-11-13.
//

import SwiftUI


final class FrameWorkDetailViewModel: ObservableObject {
    
    let framework : Framework
//    @Published var isShowingSafariView = false
    
    init(framework: Framework) {
        self.framework = framework
    }
    
}



