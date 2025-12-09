//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}

