//
//  APIServices.swift
//  Nooro
//
//  Created by Done Santana on 1/28/25.
//

import Foundation

enum APIError: Error {
    case invalidURL(message: String)
    case invalidResponse(message: String)
    case invalidData(message: String)
    case serverError(message: String)
}

struct APIServices {
    
    static let shared = APIServices()
    
    internal func createRequest(url: String, method: String, parameters: [String: String]) -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    internal func mapResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            throw APIError.invalidResponse(message: GlobalStrings.serverResponseMessage)
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        case 400..<499:
            if let json = try JSONSerialization.jsonObject(with: response.data) as? Dictionary<String, AnyObject> {
                throw APIError.invalidResponse(message: "Invalid City")
            }
            throw APIError.invalidResponse(message: GlobalStrings.serverResponseMessage)
        default:
            throw APIError.serverError(message: GlobalStrings.serverErrorMessage)
        }
    }

    func fetchWeatherData(city: String) async throws -> WeatherViewmodel {

            let urlWithParametters = "\(GlobalVariables.weatherApi)?q=\(city)&key=\(GlobalVariables.apiKey)"
            
            guard let request = createRequest(url: urlWithParametters, method: "GET", parameters: [:]) else {
                throw APIError.invalidURL(message: GlobalStrings.invalidUrlMessage)
            }
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                let dataResponse = try mapResponse(response: (data, response))
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: dataResponse)
                return WeatherViewmodel(weather: weatherData)
            } catch {
                throw APIError.serverError(message: error.localizedDescription)
            }

        }
    
    }
