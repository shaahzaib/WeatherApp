//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//
import Foundation
import CoreLocation


class WeatherManager{
    
    let api_key = "464d98a0651dd8d6f68080c2fb63c80f"
    
   /// fetching weather by current location
    func fetchWeatherByLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(api_key)&units=metric") else { fatalError("missing url...!") }
        
        let urlRequest = URLRequest(url: url)
        
     let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
       
        print(decodedData)
        
        return decodedData
    }
    
    /// fetching weather by city name
    func fetchWeatherBYCityName(_ city: String) async throws -> ResponseBody{
        let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery)&appid=\(api_key)&units=metric")
        else{
            fatalError("url not found..!")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
       
        print(decodedData)
        
        return decodedData
    }
    
}
