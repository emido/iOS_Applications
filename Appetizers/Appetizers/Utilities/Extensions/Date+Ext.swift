//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-15.
//

import SwiftUI



extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
