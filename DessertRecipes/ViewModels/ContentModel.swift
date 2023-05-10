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
    @Published var dessertsDetail = [DessertDetail]()
  
    @Published var currentDessertId = "53049"
 
    
    init() {
       
        getRecipe()
        //getRecipeDetails(mealId: currentDessertId ?? "53049")
    
        getRecipeDetails(mealId: currentDessertId)

       
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
    
    func getRecipeDetails(mealId: String){
        let url = URL(string: "\(Constants.apiUrl)/lookup.php?i=\(mealId)")
        
        guard url != nil else {
            print("not able to find URL Data")
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error == nil {
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DessertDetailsSearch.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.dessertsDetail = result.meals
                    }
                    
                } catch{
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
}
