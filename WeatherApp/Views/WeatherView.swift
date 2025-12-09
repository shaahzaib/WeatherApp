//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//


import SwiftUI

struct WeatherView: View {
    
    @Environment(\.dismiss) var dismiss
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                
                // location and time
                VStack{
                    Text(weather.name)
                        .bold() .font(.title)
                        
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                
                // weather
                
                VStack{
                    HStack{
                        VStack{
                            if (weather.weather[0].main == "Clear"){
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Clouds"){
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                            }
                            else{
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            }
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150,alignment: .leading)
                       
                        Spacer()
                        
                        Text(weather.main.feelslike.roundDouble()+"°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                    }
                   
                    
                }
                .frame(maxWidth: .infinity)
                
                
                
                Spacer()
                
            }
            .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack(alignment: .center){
                // cityImage
                
                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")){image in
                    image
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 370)
                        
                }
                placeholder: {
                    ProgressView()
                }
                Spacer()
                    .frame(height: 100)
            }
            .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            // weather components view
            
            VStack{
                Spacer()
                
               weatherNow
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            
            .foregroundStyle(.white)
            .background( LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.2)]),
                                        startPoint: .top, endPoint: .bottom)
                             .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    WeatherView(weather: previewWeather)
    
}

extension WeatherView{
    private var weatherNow: some View{
        VStack(alignment: .leading,spacing: 20){
            Text("Weather now")
                .bold()
                .padding(.bottom)
            
            HStack{
                WeatherRowView(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble()+"°")
                Spacer()
                
                WeatherRowView(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble()+"°")
            }
            
            HStack{
                WeatherRowView(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                Spacer()
                
                WeatherRowView(logo: "humidity", name: "humidity", value: weather.main.humidity.roundDouble()+"%")
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .padding(.bottom,20)
        .foregroundStyle(Color(hue: 0.650, saturation: 0.785, brightness: 0.350))
        .background(.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}
