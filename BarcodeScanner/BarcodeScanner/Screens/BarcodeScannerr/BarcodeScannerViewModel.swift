//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Maryam on 2023-10-31.
//

import SwiftUI


final class BarcodeScannerViewModel: ObservableObject {
    
    // @State variable : the view is going to be updated when everr this variable is changed ( wherre we use the variables in the same file like in view)
    // but when we use the variables in viewModel (which is observable) we have to use "@published" instead of "@State private"
    @Published var scannedCode = ""
    @Published var alertItem : AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
