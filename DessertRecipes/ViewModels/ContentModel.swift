//
//  ContentModel.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/7/23.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject{
    
    @Published var desserts = [Dessert]()
    
    
    init() {
        getRecipe()
    }
    
    // MARK: TheMealDB API Methods
    
    func getRecipe() {
        
        // API URL
        let url = URL(string: Constants.apiDessertUrl)
        
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
                //print(response as Any)
                
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DessertSearch.self, from: data!)
                    //print(result)
                    
                    // Call the getImage function of the Dessert
                   // for d in result.meals{
                   //     d.getImageData()
                  //  }
                         
                    
                    DispatchQueue.main.async {
                        self.desserts = result.meals
                    }
                    
                } catch {
                    print(error)
                }
                
                
            }
            
        }
        // Start Data Task
        dataTask.resume()
        
    }
}
