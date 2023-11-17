//
//  User.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-07.
//

import SwiftUI

// when saving a custom type (e.g. User) in UserDefaults (which is not a regular string or int, ...), we have to turn it to data. User --> Data --> UserDefaults
//therefore we need to conform to Codable prrotocol to handle this for us

struct User:Codable {
    
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
    
}
