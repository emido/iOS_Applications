//
//  DetailCardView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-06.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order : Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 310, height: 220)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbos)
                    NutritionInfo(title: "Protein", value: appetizer.proteins)
                }
            }
            
            Spacer()
            
            Button {
                // add the chosen  appetizer to the environment object in the parent view
                order.add(appetizer)
                //dismiss the view after adding to the orrder
                isShowingDetail = false
            } label: {
//                APButton(title: "$\(appetizer.difficulty) - Add to Order")
                Text("$\(appetizer.difficulty) - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(15)
                
        }
        .frame(width: 310, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
    }
}


struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}




struct NutritionInfo: View {
    let title : String
    let value : String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
