//
//  Dessert.swift
//  DessertRecipes
//
//  Created by Colstin Donaldson on 5/8/23.
//

import Foundation

class Dessert: ObservableObject, Decodable, Identifiable {
    
    var imageData: Data?
    
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    
    
    func getImageData() {
        // Check image url isn't nil
        guard strMealThumb != nil else {
            return
        }
        
        // Download data for the image
        if let url = URL(string: strMealThumb!){
          
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageData = data!

                }
            }
            dataTask.resume()
        }
    }
    
}

