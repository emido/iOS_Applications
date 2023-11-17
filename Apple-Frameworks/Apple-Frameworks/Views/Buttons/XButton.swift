//
//  XButton.swift
//  Apple-Frameworks
//
//  Created by Maryam on 2023-10-25.
//

import SwiftUI

struct XButton: View {
    
    @Binding var isShowingDetailView : Bool
    var body: some View {
        
        HStack {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44) // touch target to be big enough
            }
        }.padding()
        
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton(isShowingDetailView: .constant(false))
    }
}
