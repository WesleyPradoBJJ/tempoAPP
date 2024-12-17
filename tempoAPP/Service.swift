//
//  Service.swift
//  tempoAPP
//
//  Created by Wesley Prado on 16/12/2024.
//

import Foundation

struct City{
    
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "725bef7dbc9bb894c21856c966d6b3be"
    private let session = URLSession.shared
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
        
    }
}


// MARK: - ForecastResponse
struct ForecastResponse: Codable {

    var current: Forecast
    var hourly: [Forecast]
    var daily: [DailyForecast]
}

// MARK: - Forecast
struct Forecast: Codable {
    var dt: Int
    var temp: Double
    var humidity: Int
    var windSpeed: Double
    var weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main, description, icon: String
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    var dt: Int
    var temp: Temp
    var weather: [Weather]

}

// MARK: - Temp
struct Temp: Codable {
    var day, min, max, night: Double
    var eve, morn: Double
}

