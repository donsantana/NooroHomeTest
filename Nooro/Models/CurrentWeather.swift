//
//  Weather.swift
//  Nooro
//
//  Created by Done Santana on 1/28/25.
//

struct Condition: Decodable {
    var text: String
    var icon: String
    var code: Int
}

struct CurrentWeather: Decodable {
    var last_updated_epoch: Int
    var last_updated: String
    var temp_c: Double
    var temp_f: Double
    var is_day: Int
    var condition: Condition
    var wind_mph: Double
    var wind_kph: Double
    var wind_degree: Int
    var wind_dir: String
    var pressure_mb: Double
    var pressure_in: Double
    var precip_mm: Double
    var precip_in: Double
    var humidity: Int
    var cloud: Int
    var feelslike_c: Double
    var feelslike_f: Double
    var windchill_c: Double
    var windchill_f: Double
    var heatindex_c: Double
    var heatindex_f: Double
    var dewpoint_c: Double
    var dewpoint_f: Double
    var vis_km: Double
    var vis_miles: Double
    var uv: Double
    var gust_mph: Double
    var gust_kph: Double
}
