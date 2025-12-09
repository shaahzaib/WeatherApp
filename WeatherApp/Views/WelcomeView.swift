//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    @ObservedObject var vm : WeatherViewModel
    var body: some View {
        VStack {
            VStack{
                
                Text("Sun & Shade")
                    .font(.system(size: 50))
                    .bold()
                
                Text("Please share your current location or search by city name to get weather updates.")
                    .font(.system(size: 20))
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            // Search Section
            searchBar
                .padding(.bottom)
                .padding(.horizontal)
            
            AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")){image in
                image
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 370)
                    
            }
            placeholder: {
                ProgressView()
            }
            
            Spacer()
                
                locationBtn
            
            Spacer()
                .frame(height: 40)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView(vm: WeatherViewModel())
}


extension WelcomeView{
    
    private var locationBtn: some View{
        LocationButton(.shareCurrentLocation){
            locationManager.requestLocation()
        }
        .symbolVariant(.fill)
        .foregroundStyle(.white)
    }
    
    private var searchBar:some View{
        HStack {
            TextField("Search city name", text: $vm.cityInput)
                .textFieldStyle(.roundedBorder)
            
            Button("Search") {
                Task {
                    if let result = await vm.fetchUsingCity() {
                        vm.weather = result
                        vm.showWeatherView = true
                    }
                }
            }
            .buttonStyle(.automatic)
            
        }
    }
}
