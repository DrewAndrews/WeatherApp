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
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: day.imageName)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .accentColor(.green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(Int(day.temp))°")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}
