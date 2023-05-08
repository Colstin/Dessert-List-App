//
//  ContentModel.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject{
    
    init() {
        getRecipe()
    }
    
    // MARK: TheMealDB API Methods
    
    func getRecipe() {
        
        // API URL
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        
        guard url != nil else {
            print("not able to find URL Data")
            return
        }
        
        // API URL Request
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // Check there's no error
            if error == nil {
                print(response as Any)
            }
            
        }
        // Start Data Task
        dataTask.resume()
        
    }
}
