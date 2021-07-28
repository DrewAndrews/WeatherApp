//
//  WeatherDayView.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 27.07.2021.
//

import SwiftUI

struct WeatherDayView: View {
    
    var day: WeekDay
    
    var body: some View {
        VStack {
            Text(String(day.date))
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: day.imageName)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .accentColor(.green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Text("\(Int(day.temp))°")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}
