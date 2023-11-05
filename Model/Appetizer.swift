//
//  Appetizer.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import Foundation

struct Appetizer:Identifiable
{
    let carbs:Int
    let price:Double
    let id:Int
    let protein:Int
    let calories:Int
    let description:String
    let imageURL:String
    let name:String
}

extension Appetizer
{
    init?(jsonDictionary:JSONdictionary) {
        guard
            let carbs = jsonDictionary["carbs"] as? Int,
            let price = jsonDictionary["price"] as? Double,
            let id = jsonDictionary["id"] as? Int,
            let protein = jsonDictionary["protein"] as? Int,
            let calories = jsonDictionary["calories"] as? Int,
            let description = jsonDictionary["description"] as? String,
            let imageURL = jsonDictionary["imageURL"] as? String,
            let name = jsonDictionary["name"] as? String else { return nil }
        
        self.carbs = carbs
        self.price = price
        self.id = id
        self.protein = protein
        self.calories = calories
        self.description = description
        self.imageURL = imageURL
        self.name = name
    }
}


struct AppetizersResponse{
    let request:[Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(carbs: 0,
                                           price: 20.0, id: 0, protein: 0, calories: 0, description:"This is Description", imageURL: "", name: "Test Appetizers")
    static let sampleAppetizer1 = Appetizer(carbs: 1,
                                           price: 20.0, id: 1, protein: 0, calories: 0, description:"This is Description", imageURL: "", name: "Test Appetizers")
    static let sampleAppetizer2 = Appetizer(carbs: 2,
                                           price: 20.0, id: 2, protein: 0, calories: 0, description:"This is Description", imageURL: "", name: "Test Appetizers")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2]
}

extension Appetizer{
        
    static let all = Resource<[Appetizer]>(url: URL(string: url)!) { json in
        guard let dictionary = json as? JSONdictionary,
              let articles = dictionary["request"] as? [JSONdictionary]
        else{return nil}
        return articles.compactMap(Appetizer.init)
    }
}
