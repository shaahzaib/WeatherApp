//
//  ContentView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        WelcomeView()
            .environmentObject(locationManager)
    }
}

#Preview {
    MainView()
}
