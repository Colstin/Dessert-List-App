//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import SwiftUI

struct DessertListView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                NavigationLink {
                    DessertDetailView()
                } label: {
                    Text("Go to View")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
            .environmentObject(ContentModel())
    }
}
