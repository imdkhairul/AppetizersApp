//
//  AppetizerDetailsView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/29/23.
//

import SwiftUI

struct AppetizerDetailsView: View {
    
    @Binding var willShowDetails:Bool
    var appetizer:Appetizer
    @EnvironmentObject var order:Order
    
    var body: some View {
        VStack{
            ZStack(alignment:.top){
                AsyncImage(url: URL(string: appetizer.imageURL), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    ProgressView()
                })
                .frame(width:300, height: 225)
                
                HStack{
                    Spacer()
                    Button{
                        willShowDetails = false
                    }label: {
                        XDismissButtonView(imageName:"xmark")

                    }
                }
                .padding()
            }
            
            VStack{
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                    .fontWeight(.semibold)
                    Text(appetizer.description)
                        .font(.body)
                }
                .padding()
                
                HStack(alignment:.center,spacing: 30.0){
                    IngredientItemView(name: "Calories", quantity: "\(appetizer.calories)")
                    IngredientItemView(name: "Carbs", quantity: "\(appetizer.carbs)")
                    IngredientItemView(name: "Protein", quantity: "\(appetizer.protein)")
                }
                .padding()
            }
            Spacer()
            Button{
                order.addItem(appetizer: appetizer)
                willShowDetails = false
            } label: {
                GridButtonView(price: appetizer.price)
                    .padding(.bottom, 30)
            }
            
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12.0)
        .shadow(radius: 40)
        
    }
}

#Preview {
    AppetizerDetailsView(willShowDetails: .constant(false), appetizer: MockData.sampleAppetizer)
}

struct IngredientItemView: View {
    let name:String
    let quantity:String
    var body: some View {
        VStack{
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(quantity)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}
