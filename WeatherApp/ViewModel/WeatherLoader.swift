//
//  WeatherLoader.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 24.07.2021.
//

import Foundation

final class WeatherLoader: ObservableObject {
    
    @Published var mainWeather = MainWeatherData()
    @Published var weekDays = WeekDays()
    
    func loadMainWeatherData() {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            let url = "https://api.openweathermap.org/data/2.5/onecall?"
            let params = [
                "lat": "50.272778",
                "lon": "127.540405",
                "appid": "e9cf5ce835334125ff3c727398f2b2d4",
                "exclude": "minutely,hourly,alerts",
                "units": "metric"
            ]
            let jsonDecoder = JSONDecoder()
            
            var urlWithParams = URLComponents(string: url)
            urlWithParams?.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
            
            let task = URLSession.shared.dataTask(with: (urlWithParams?.url)!) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self.mainWeather = try! jsonDecoder.decode(MainWeatherData.self, from: data)
                        self.weekDays = try! jsonDecoder.decode(WeekDays.self, from: data)
                    }
                }
            }
            task.resume()
        }
    }
}
