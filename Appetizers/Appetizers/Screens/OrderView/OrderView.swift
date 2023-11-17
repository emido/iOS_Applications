//
//  OrderView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems) // it will automatically perform the delete fuction at all indexes
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("order placed")
                    } label: {
//                        APButton(title:"$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty  {
                    EmptyStateView(imageName: "newspaper",
                                   message: "Your shopping cart is empty. \nPlease add an appetizer.")
                }
            }
            .navigationTitle("🍴 Orders")
        }
    }
      
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
