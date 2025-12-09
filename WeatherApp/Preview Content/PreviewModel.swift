//
//  PreviewModel.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import Foundation

var previewWeather:ResponseBody = Load("weatherData.json")
func Load<T: Decodable>(_ filename:String) ->T{
    
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Could'nt find \(filename) in main bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Could'nt load \(filename) from main bundle:\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Could'nt parse \(filename)as \(T.self)")
    }
}
