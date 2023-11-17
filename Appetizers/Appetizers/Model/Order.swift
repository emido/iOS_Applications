//
//  Order.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-08.
//

import SwiftUI


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    
    var totalPrice : Double {
        items.reduce(0) { $0 + Double($1.difficulty) }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
}
