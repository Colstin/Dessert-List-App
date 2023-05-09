//
//  DessertDetailView.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    var dessert: Dessert
    
    var body: some View {
        VStack{
            Text("\(dessert.strMeal ?? "")")
            Text("Instructions")
            Text("Meaurments/ ingredients")
        }
    
    }
}
/*
struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView()
    }
}
*/
