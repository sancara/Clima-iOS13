//
//  WeatherManager.swift
//  Clima
//
//  Created by Santiago Caraballo on 14/04/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather (_ weatherManager: WeatherManager, weather: WeatherModel)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d00c7c49c26e6b89eebf6391c6a1a55c&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1 Create URL
        
        if let url = URL(string: urlString) {
            // 2 Create URLSession
            let session =  URLSession(configuration: .default)
            // 3 Give the session a TASK
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4 Start the TASK
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
