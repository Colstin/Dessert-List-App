//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import SwiftUI

struct DessertListView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    @State var currentDetailId: String?
   
    
    var body: some View {
        
        if contentModel.desserts.count != 0 { // TODO: change to !=
            NavigationStack{
                ScrollView{
                    ForEach(contentModel.desserts){ dessert in
                       
                        ForEach(contentModel.dessertsDetail) { detail in
                            NavigationLink {
                                DessertDetailView(dessertDetail: detail)
                                    .onAppear(){
                                        contentModel.getRecipeDetails(mealId: currentDetailId ?? "52893")
                                    }
                                  
                            } label: {
                                DessertListRow(dessert: dessert)
                        }
                        }
                    }
                }
                .navigationTitle("Dessert Recipes")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
            }
            
        } else {
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
            .environmentObject(ContentModel())
    }
}
