//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-09.
//

import SwiftUI


struct StandardButtonStyle : ViewModifier  {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}




