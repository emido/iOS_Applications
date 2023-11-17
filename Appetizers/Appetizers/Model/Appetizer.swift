//
//  Appetizer.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import Foundation


struct Appetizer : Decodable, Identifiable {
    let id : String
    let name : String
    let description : String
    let headline : String
    let image  : String
    let thumb : String
    let calories : String
    let carbos : String
    let fats : String
    let proteins : String
    let difficulty : Int
    let time : String
}


//struct AppetizerResponse: Decodable {
//    let request: [Appetizer]
//}



struct MockData {
    static let sampleAppetizer = Appetizer(id: "0001",
                                           name: "Pizza",
                                           description: "cheesy, yummy comfort food for movie nights",
                                           headline: "Italian food",
                                           image: "https://en.wikipedia.org/wiki/Pizza#/media/File:Pizza-3007395.jpg",
                                           thumb: "https://blog.papajohns.co.uk/wp-content/uploads/2015/12/Pizza-Thumbnail.jpg",
                                           calories: "285",
                                           carbos: "35.6 gr",
                                           fats: "10.4 gr",
                                           proteins: "12.2 gr",
                                           difficulty: 0,
                                           time: "PT35M")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: "0001",
                                           name: "Pizza 1",
                                           description: "cheesy, yummy comfort food for movie nights",
                                           headline: "Italian food",
                                           image: "https://en.wikipedia.org/wiki/Pizza#/media/File:Pizza-3007395.jpg",
                                           thumb: "https://blog.papajohns.co.uk/wp-content/uploads/2015/12/Pizza-Thumbnail.jpg",
                                           calories: "285",
                                           carbos: "35.6 gr",
                                           fats: "10.4 gr",
                                           proteins: "12.2 gr",
                                           difficulty: 0,
                                           time: "PT35M")
    static let orderItemTwo = Appetizer(id: "0002",
                                           name: "Pizza 2",
                                           description: "cheesy, yummy comfort food for movie nights",
                                           headline: "Italian food",
                                           image: "https://en.wikipedia.org/wiki/Pizza#/media/File:Pizza-3007395.jpg",
                                           thumb: "https://blog.papajohns.co.uk/wp-content/uploads/2015/12/Pizza-Thumbnail.jpg",
                                           calories: "285",
                                           carbos: "35.6 gr",
                                           fats: "10.4 gr",
                                           proteins: "12.2 gr",
                                           difficulty: 0,
                                           time: "PT35M")
    static let orderItemThree = Appetizer(id: "0003",
                                           name: "Pizza 3",
                                           description: "cheesy, yummy comfort food for movie nights",
                                           headline: "Italian food",
                                           image: "https://en.wikipedia.org/wiki/Pizza#/media/File:Pizza-3007395.jpg",
                                           thumb: "https://blog.papajohns.co.uk/wp-content/uploads/2015/12/Pizza-Thumbnail.jpg",
                                           calories: "285",
                                           carbos: "35.6 gr",
                                           fats: "10.4 gr",
                                           proteins: "12.2 gr",
                                           difficulty: 0,
                                           time: "PT35M")
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
