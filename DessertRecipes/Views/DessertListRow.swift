//
//  DessertListRow.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/9/23.
//

import SwiftUI

struct DessertListRow: View {
    
    var dessert: Dessert
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack{
                //Image
                AsyncImage(url: URL(string: dessert.strMealThumb!)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 58, height: 58)
                        .cornerRadius(15)
                } placeholder: {
                    Color.red
                }
                .frame(width: 58, height: 58)
                .clipShape(RoundedRectangle(cornerRadius: 25))

                
                //Title
                Text(dessert.strMeal ?? "")
                
            }
            .foregroundColor(.black)
            
            Divider()
        }
       
    }
}


