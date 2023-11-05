//
//  AppetizersAppApp.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var body: some Scene {
        var order = Order()
        
        WindowGroup {
            AppetizersTabView()
                .environmentObject(order)
        }
    }
}
