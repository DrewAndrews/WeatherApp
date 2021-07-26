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
                CityTextView(cityName: weatherLoader.mainWeather.cityName)
                MainWeatherStatusView(mainWeather: weatherLoader.mainWeather)
                
                Spacer()
                
                HStack(spacing: 20) {
                    ForEach(weatherLoader.weekDays.daily) { day in
                        WeatherDayView(day: day)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
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
