//
//  Extensions.swift
//  WeatherApp
//
//  Created by Macbook Pro on 09/12/2025.
//

import Foundation
import SwiftUI

extension Double{
    func roundDouble() -> String{
        return String(format: "%.0f", self)
    }
    
//    func fahrenheitToCelsius() -> Double {
//        return (self - 32) * 5 / 9
//    }
}


// to shape the cityImage

extension View{
    func cornerRadius(_ radius: CGFloat, corners:UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius,corners: corners))
    }
}


struct RoundedCorner:Shape{
    
    var radius : CGFloat = .infinity
    var corners : UIRectCorner = .allCorners
    
    
    func path(in rect: CGRect)->Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
