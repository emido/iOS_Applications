//
//  Image+Ext.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-21.
//

import SwiftUI


extension Image {
    func listImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 90, height: 90)
            .cornerRadius(10)
        
    }
    
    func articlePageImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
            
    }
    
}
