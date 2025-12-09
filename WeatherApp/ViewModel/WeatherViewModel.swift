//
//  WeatherViewmodel.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//
import SwiftUI
import CoreLocation
import Combine

@MainActor
class WeatherViewModel: ObservableObject{
    
    @Published var weather: ResponseBody?
    @Published var isLoading = false
    @Published var cityInput = ""
    @Published var errorMessage = ""
    @Published var showWeatherView = false
    private let weatherManager = WeatherManager()
    
    
    func fetchUsingLocation(_ location: CLLocationCoordinate2D) async -> ResponseBody? {
        isLoading = true
        errorMessage = ""
        
        do{
            weather = try await weatherManager.fetchWeatherByLocation(latitude: location.latitude, longitude: location.longitude)
        }catch{
            errorMessage = "Failed to  get weather using location."
        }
        isLoading = false
        
        return weather
    }
    
    func fetchUsingCity() async -> ResponseBody?{
        
        guard !cityInput.isEmpty else{
            errorMessage = "Please enter city name"
            return nil
        }
        
        isLoading = true
        errorMessage = ""
        
        do {
            weather = try await weatherManager.fetchWeatherBYCityName(cityInput)
        } catch  {
            errorMessage = "City not found"
        }
        isLoading = false
        
        return weather
    }
}
