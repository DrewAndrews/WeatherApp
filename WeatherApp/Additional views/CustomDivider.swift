//
//  CustomDivider.swift
//  WeatherApp
//
//  Created by Andrey Rusinovich on 28.07.2021.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .background(Color.white)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
