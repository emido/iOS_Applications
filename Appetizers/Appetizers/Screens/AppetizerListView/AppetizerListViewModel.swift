//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import SwiftUI


// @MainActor : anything in the ViewModel that is UI related will automatically put in the main thread (main queue)
@MainActor final class AppetizerListViewModel: ObservableObject  {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    @Published var isShowingDetail = false
    @Published var selectedAppetizer : Appetizer?
    
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers  = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.genericError
                }
                isLoading  = false
            }
        }
       
        
    }
    
        
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            // because we are getting the network call back and it leads -- to UI change, then --> it needs to be in the main thread
//            DispatchQueue.main.async { [self] in // capture self in here so that we don't need to write self multiple times in closure
//                // for turning the spinner off, we don't care if the rresult is success or failure
//                isLoading = false
//                switch result {
//                    case .success(let appetizers):
//                        self.appetizers = appetizers
//
//                    case .failure(let error):
//                        switch error{
//                        case .invalidData:
//                            alertItem = AlertContext.invalidData
//                        case .invalidURL:
//                            alertItem = AlertContext.invalidURL
//                        case .invalidResponse:
//                            alertItem = AlertContext.invalidResponse
//                        case .unableToComplete:
//                            alertItem = AlertContext.unableToComplete
//                        }
//
//                }
//            }
//        }
//    }
    
    
    
    
    
}
