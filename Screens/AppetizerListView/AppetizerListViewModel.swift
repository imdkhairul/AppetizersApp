//
//  AppetizerListViewModel.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

final class AppetizerListViewModel:ObservableObject
{
    @Published var appetizers:[Appetizer] = []
    @Published var isLoading:Bool = false
    
    func getAppetizers()
    {
        isLoading = true
        WebService.shared.load(resource: Appetizer.all) {[weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let appetizers):
                if let appetizers = appetizers{
                    self?.appetizers = appetizers
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
