//
//  LoadingView.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//

import SwiftUI
import UIKit

struct LoadingView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.primaryColor
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiViewController: UIActivityIndicatorView, context: Context) {}
    
}

#Preview {
    LoadingView()
}
