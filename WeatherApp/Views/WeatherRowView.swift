//
//  WeatherRowView.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import SwiftUI

struct WeatherRowView: View {
    var logo : String
    var name : String
    var value : String
    
    var body: some View {
        HStack{
            Image(systemName: logo)
                .font(.title)
                .frame(width: 30,height: 30)
                .padding()
                .background(.blue.opacity(0.1))
                .cornerRadius(50)
            
            VStack(alignment: .leading,spacing: 8){
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

#Preview {
    WeatherRowView(logo: "thermometer", name: "Feels like", value: "37°")
}
