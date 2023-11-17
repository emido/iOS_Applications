//
//  Image+Ext.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-12.
//

import SwiftUI

extension Image {
    
    func cellImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(10)
    }
}
