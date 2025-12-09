//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//
// Model of the response body we get from calling the OpenWeather API

struct ResponseBody: Decodable{
    
    let coord: CoordinatesResponse
    let weather: WeatherResponse
    let main: MainResponse
    let wind: WindResponse
    let name: String
    
    struct CoordinatesResponse:Decodable{
        let lon: Double
        let lat: Double
    }
    
    struct WeatherResponse: Decodable{
        let id: Double
        let main:String
        let description: String
        let icon: String
    }
    
    struct MainResponse: Decodable{
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct WindResponse: Decodable{
        let speed: Double
        let deg: Double
    }
    
}

extension ResponseBody.MainResponse{
    let feelslike: Double {return feels_like}
    let tempMin: Double{return temp_min}
    let 
}
