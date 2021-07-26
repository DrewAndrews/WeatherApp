//
//  MainWeatherData.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 24.07.2021.
//

import Foundation

struct MainWeatherData: Decodable {
    var cityName: String = "London"
    var sunrise: Int = 1
    var sunset: Int = 1
    var temp: Double = 1
    var feels_like: Double = 1
    var humidity: Double = 1
    var weather: [Weather] = [Weather(main: "Cloud", description: "So cloudy")]
    var imageName: String {
        switch weather[0].main {
        case "Thunderstorm":
            return "cloud.bolt.rain.fill"
        case "Drizzle":
            return "cloud.drizzle"
        case "Rain":
            return "cloud.rain"
        case "Snow":
            return "cloud.snow"
        case "Clear":
            return "sun.max"
        case "Clouds":
            return "cloud.sun.fill"
        default:
            return "sun.haze"
        }
    }
    
    private enum WeatherKeys: CodingKey {
        case current
    }
    
    private enum CurrentWeatherKeys: CodingKey {
        case sunrise
        case sunset
        case temp
        case feels_like
        case humidity
        case weather
    }
    
    init() {
        cityName = "________"
        sunrise = 1
        sunset = 1
        temp = 1
        feels_like = 1
        humidity = 1
        weather = [Weather(main: "Clouds", description: "Cloud with rain")]
    }
    
    init(from decoder: Decoder) throws {
        if let weatherContainer = try? decoder.container(keyedBy: WeatherKeys.self) {
            if let currentWeatherContainer = try? weatherContainer.nestedContainer(keyedBy: CurrentWeatherKeys.self, forKey: .current) {
                self.cityName = "Blagoveshensk"
                self.sunrise = try currentWeatherContainer.decode(Int.self, forKey: .sunrise)
                self.sunset = try currentWeatherContainer.decode(Int.self, forKey: .sunset)
                self.temp = try currentWeatherContainer.decode(Double.self, forKey: .temp)
                self.feels_like = try currentWeatherContainer.decode(Double.self, forKey: .feels_like)
                self.humidity = try currentWeatherContainer.decode(Double.self, forKey: .humidity)
                self.weather = try currentWeatherContainer.decode([Weather].self, forKey: .weather)
            }
        }
    }
}