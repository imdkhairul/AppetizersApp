//
//  AppetizersListView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State var willShowDetails:Bool = false
    @State var selectedAppetizer:Appetizer = MockData.sampleAppetizer
    
    var body: some View {
        NavigationView{
            ZStack {
                if viewModel.isLoading
                {
                    LoadingView()
                }
                List{
                    ForEach(viewModel.appetizers){ appetizer in
                        AppetizerListItemView(imageName: appetizer.imageURL,
                                              title: appetizer.name,
                                              price: appetizer.price)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            willShowDetails = true
                        }
                    }
                }
                .navigationTitle("🍔 Appetizers")
                .disabled(willShowDetails)
                .listStyle(.plain)
                .blur(radius: willShowDetails ? 20.0 : 0.0)
                .onAppear(){
                    viewModel.getAppetizers()
                }
                if willShowDetails{
                    AppetizerDetailsView(willShowDetails: $willShowDetails,
                                         appetizer: selectedAppetizer)
                }
            }
            
        }
    }
}

#Preview {
    AppetizersListView(selectedAppetizer: MockData.sampleAppetizer)
}

struct AppetizerListItemView: View {
    let imageName:String
    let title:String
    let price:Double
    var body: some View {
        HStack(){
            AsyncImage(url: URL(string: imageName), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 120, height: 90)
            
            VStack(alignment:.leading,spacing:5){
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(price, specifier:"%.2f")")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}
