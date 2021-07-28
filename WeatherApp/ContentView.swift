//
//  ContentView.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @StateObject var weatherLoader = WeatherLoader()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                MainWeatherStatusView(mainWeather: weatherLoader.mainWeather)
                
                 CustomDivider()
                
                HStack {
                    ForEach(weatherLoader.weekDays.daily) { day in
                        WeatherDayView(day: day)
                    }
                }
                
                CustomDivider()
                
                ForEach(weatherLoader.mainWeather.detailsForDayKeys, id: \.self) { key in
                    DetailDayView(description: key, value: weatherLoader.mainWeather.detailsForDay[key]!)
                    CustomDivider()
                        .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .onAppear {
            weatherLoader.loadMainWeatherData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
