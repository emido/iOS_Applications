//
//  APError.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import Foundation

enum APError: Error{
    case invalidURL
    case invalidResponse    // when we gt an invalid response like 404, 405
    case invalidData       // when we cannot parse the data
    case unableToComplete // for generral errror
}
