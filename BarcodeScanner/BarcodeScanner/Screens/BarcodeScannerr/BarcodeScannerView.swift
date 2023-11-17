//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Maryam on 2023-10-26.
//

import SwiftUI


struct BarcodeScannerView: View {
    
    // when creating a NEW view model --> use @StateObject
    // when passing an existing view model from the preview layer ---> use @ObservedObject
    @StateObject var viewModel  = BarcodeScannerViewModel()
    var body: some View {
        NavigationView {
            VStack {
               
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                    
                Spacer().frame(height: 60)
                
               
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
