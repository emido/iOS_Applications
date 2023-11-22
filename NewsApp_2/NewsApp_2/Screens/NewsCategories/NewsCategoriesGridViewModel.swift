//
//  NewsSourceGridViewModel.swift
//  NewsApp_2
//
//  Created by Maryam on 2023-11-17.
//

import SwiftUI


final class NewsCategoriesGridViewModel: ObservableObject {

    
    let newsCategories = [NewsCategory(title: "Business", image: "bitcoinsign"),
                                 NewsCategory(title: "Entertainment", image: "film"),
                                 NewsCategory(title: "General", image: "info"),
                                 NewsCategory(title: "Health", image: "stethoscope"),
                                 NewsCategory(title: "Science", image: "book"),
                                 NewsCategory(title: "Sports", image: "figure.baseball"),
                                 NewsCategory(title: "Technology", image: "laptopcomputer")]
   
    
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible())]
}




