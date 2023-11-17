//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import SwiftUI

struct AppetizerListView: View {
    
    // when passing viewmodel from one to another view we are using the @StateObject
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍔 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            // .task is when we first come to a view and we want to do something at initial  step
            // if user navigates to another screen before network call completed, it will
            // automatically cancel  the network call
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            // add the detail view in the zstack
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            // add spinnerView
            if viewModel.isLoading {
                LoadingView()
            }
            
            
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
