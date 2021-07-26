//
//  MainWeatherStatusView.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 27.07.2021.
//

import SwiftUI

struct MainWeatherStatusView: View {
    
    var mainWeather: MainWeatherData
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: mainWeather.imageName)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(Int(mainWeather.temp))°")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}
