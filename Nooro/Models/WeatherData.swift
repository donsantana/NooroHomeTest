//
//  WeatherResponse.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import UIKit

struct WeatherLocation: Decodable {
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var tz_id: String
    var localtime_epoch: Int
    var localtime: String
}

struct WeatherData: Decodable {
    var location: WeatherLocation
    var current: CurrentWeather
    
    
    static let weatherMock: WeatherData = Bundle.main.decode(file: "WeatherDataMock.json")
}
