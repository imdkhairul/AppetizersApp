//
//  AppetizersTabView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView{
            AppetizersListView()
                .tabItem {
                    Image(systemName:"house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color.primaryColor)
    }
}

#Preview {
    AppetizersTabView()
}
