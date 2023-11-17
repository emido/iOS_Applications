//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-10-25.
//

import SwiftUI

final class FrameworkGridViewModel : ObservableObject {
    
    var selectedFramework : Framework? {
        didSet { isShowingDetailView = true }
    }
    
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    @Published var isShowingDetailView  = false
    
}
