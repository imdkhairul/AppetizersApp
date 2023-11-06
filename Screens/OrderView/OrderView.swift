//
//  OrderView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListItemView(imageName: appetizer.imageURL,
                                                  title: appetizer.name,
                                                  price: appetizer.price)
                        }
                        .onDelete(perform: { indexSet in
                            order.deleteItem(indexset: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    Button{
                        
                    }label: {
                        Text("$\(order.totalPrice, specifier:"%0.2f") - Add to Order")
                    }
                    .standaryButtonStyle()
                    .padding(.bottom,30)
                }
                if order.items.isEmpty{
                    EmptyState()
                }
            }
            .navigationTitle("🗒️ Orders")
        }
    }
}

#Preview {
    OrderView()
}
