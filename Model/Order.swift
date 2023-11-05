//
//  Order.swift
//  AppetizersApp
//
//  Created by Khairul on 11/4/23.
//

import SwiftUI

final class Order:ObservableObject{
    
    @Published var items:[Appetizer] = []
    
    var totalPrice:Double{ items.reduce(0){ $0 + $1.price}}
    
    func addItem(appetizer:Appetizer)
    {
        items.append(appetizer)
    }
    
    func deleteItem(indexset:IndexSet)
    {
        items.remove(atOffsets: indexset)
    }
}
