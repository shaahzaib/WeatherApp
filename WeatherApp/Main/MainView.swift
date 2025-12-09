//
//  ContentView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var vm = WeatherViewModel()

    var body: some View {
        WelcomeView(vm: vm)
            .environmentObject(locationManager)

            .sheet(isPresented: $vm.showWeatherView) {
                if let weather = vm.weather {
                    WeatherView(weather: weather)
                }
            }

            // LOCATION fetch listener
            .onReceive(locationManager.$location) { newLoc in
                if let loc = newLoc {
                    Task {
                        if let result = await vm.fetchUsingLocation(loc) {
                            vm.weather = result
                            vm.showWeatherView = true   // 👈 OPEN SHEET
                        }
                    }
                }
            }
    }
}

#Preview {
    MainView()
}
