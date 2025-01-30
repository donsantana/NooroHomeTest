//
//  WeatherView.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import SwiftUI

struct WeatherView: View {
    @State var weatherData: WeatherViewmodel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https:\(weatherData.conditionIcon)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                //Image(.defaultLogo)
            }
            HStack {
                Text(weatherData.city)
                    .font(.system(size: 30))
                    .bold()
                Image(systemName: "location.fill")
                
            }
            
            Text("\(weatherData.temperature)°")
                .font(.system(size: 70))
                .bold()
            
            CardView(weatherData: weatherData)
                .frame(width: UIScreen.main.bounds.width - 80, height: 100)
        }
        
        //        .onAppear() {
        //            Task {
        //                weatherData = try await APIServices.shared.fetchWeatherData(city: cityName)
        //            }
        //        }
    }
}

#Preview {
    WeatherView(weatherData: WeatherViewmodel.mockData)
}


struct CardView: View {
    let weatherData: WeatherViewmodel
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(Color(.customLightGray))
                HStack(spacing: 60) {
                    DataView(title: GlobalStrings.humidityLabel, value: weatherData.humidity,unit: "%")
                    DataView(title: GlobalStrings.uVLabel, value: weatherData.UVIndex)
                    DataView(title: GlobalStrings.feelsLikeLabel, value: weatherData.feelsLike,unit: "°")
                }
                .padding()
                
            }
            .padding()
        }
    }
}

struct DataView: View {
    var title: String
    var value: String
    var unit: String?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
            Spacer()
            HStack(spacing:1){
                Text(value)
                    .font(.caption)
                    .frame(alignment: .trailing)
                    .foregroundStyle(.gray)
                if let unit = unit {
                    Text(unit)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
        }
    }
}
