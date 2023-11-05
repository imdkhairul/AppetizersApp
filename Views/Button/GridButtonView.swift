//
//  File.swift
//  SwiftUI-Grid
//
//  Created by Khairul on 10/26/23.
//

import SwiftUI

struct GridButtonView: View {
    let price:Double
    var body: some View {
        Text("$\(price, specifier:"%0.2f") - Add to Order")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 260, height: 50)
            .background(.green)
            .cornerRadius(10.0)
    }
}
