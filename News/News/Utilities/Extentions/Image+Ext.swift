//
//  Image+Ext.swift
//  News
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI


extension Image {
    
    func cellImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 130, height: 100)
            .cornerRadius(10)
    }
    
    func DetailNewsImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 240)
            .cornerRadius(5)
    }
}
