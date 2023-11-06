//
//  StandardButtonStyle.swift
//  AppetizersApp
//
//  Created by Khairul on 11/6/23.
//

import SwiftUI

struct StandardButtonStyle:ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color.primaryColor)
            .controlSize(.large)
    }
}

extension View{
    func standaryButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
