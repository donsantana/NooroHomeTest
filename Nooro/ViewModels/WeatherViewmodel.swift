//
//  WeatherViewmodel.swift
//  Nooro
//
//  Created by Done Santana on 1/28/25.
//



struct WeatherViewmodel {
    private var weatherData: WeatherData
    
    init(weather: WeatherData) {
        self.weatherData = weather
    }
    
    var city: String {
        return weatherData.location.name
    }
    
    var temperature: String {
        return String(format: "%.1f", weatherData.current.temp_f)
    }
    
    var conditionIcon: String {
        return weatherData.current.condition.icon
    }
    
    var humidity: String {
        return String(format: "%.1f", weatherData.current.humidity)
    }
    
    var UVIndex: String {
        return String(format: "%.1f", weatherData.current.uv)
    }
    
    var feelsLike: String {
        return String(format: "%.1f", weatherData.current.feelslike_f)
    }
    
    static var mockData: WeatherViewmodel {
        return WeatherViewmodel(weather: WeatherData.weatherMock)
    }
}
