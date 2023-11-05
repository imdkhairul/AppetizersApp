//
//  EmptyState.swift
//  AppetizersApp
//
//  Created by Khairul on 11/3/23.
//

import SwiftUI

struct EmptyState:View{
    
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack{
                Image("empty-order")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:150)
                Text("Right now you have no order Right now you have no order")
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y:-50)
        }
    }
}

#Preview {
    EmptyState()
}
