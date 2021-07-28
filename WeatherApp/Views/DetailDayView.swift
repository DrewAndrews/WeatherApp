//
//  DetailDayView.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 27.07.2021.
//

import SwiftUI

struct DetailDayView: View {
    
    var description: String
    var value: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(description)
                    .foregroundColor(Color.white)
                Text(description == "SUNRISE" || description == "SUNSET" ? WeatherLoader.prepareTimes(for: value) : "\(Int(value))")
                    .font(.title2)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
        }
        .padding(.leading)
    }
}

struct DetailDayView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDayView(description: "SUNRISE", value: 1)
    }
}
