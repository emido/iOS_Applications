//
//  String+Ext.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-28.
//

import SwiftUI


extension String {
    
    var toDate : Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? dateFormatter.date(from: "2023-11-30T18:38:00Z")!
    }
    
}
