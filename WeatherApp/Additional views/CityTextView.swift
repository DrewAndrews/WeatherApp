//
//  CityTextView.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 27.07.2021.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
    }
}
