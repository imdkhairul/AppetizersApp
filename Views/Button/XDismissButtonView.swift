//
//  XDismissButtonView.swift
//  SwiftUI-Grid
//
//  Created by Khairul on 10/26/23.
//

import SwiftUI

struct XDismissButtonView: View {
    var imageName:String
    var body: some View {
        Image(systemName:imageName)
            .foregroundColor(.black)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}
