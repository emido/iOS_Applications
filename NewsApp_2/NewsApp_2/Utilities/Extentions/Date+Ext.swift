//
//  Date+Ext.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-28.
//

import SwiftUI

extension Date {
    
    var articleDateString: String {
        self.formatted(.dateTime
            .year(.defaultDigits)
            .month(.abbreviated)
            .day(.twoDigits)
            .hour(.twoDigits(amPM: .abbreviated))
            .minute(.twoDigits)
        )
    }
    
//    var toString: String {
//        let dateFormatter  = DateFormatter()
//        return dateFormatter.string(from: self)
//    }
    
}
