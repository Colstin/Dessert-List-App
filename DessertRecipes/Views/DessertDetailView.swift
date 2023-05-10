//
//  DessertDetailView.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    var dessertDetail: DessertDetail

    var body: some View {
        VStack{
            Text("How to Make:")
                .font(.title2)
                .bold()
            Text("\(dessertDetail.strMeal ?? "")")
                .italic()
            Divider()
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading ){
                    //MARK: INSTRUCTIONS
                    Text("Instructions: ")
                        .font(.title2)
                        .padding(.bottom, 5)
                        .bold()
                    Text("\(dessertDetail.strInstructions ?? "")")
                    
                    //MARK: INGREDIENTS
                    VStack(alignment: .leading){
                        Text("Ingredients: ")
                            .font(.title2)
                            .padding(.bottom, 5)
                            .bold()
                        ForEach(0..<dessertDetail.ingredients.count, id: \.self){ index in
                            if dessertDetail.ingredients[index]!.count < 1 {
                               Text("")

                            } else {
                                VStack(alignment: .leading) {
                                    Text("• \(dessertDetail.measurements[index] ?? "" ) \(dessertDetail.ingredients[index] ?? "") ")
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .padding()
        .background(.brown.opacity(0.1))
    }
}
/*
struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView()
    }
}
*/
