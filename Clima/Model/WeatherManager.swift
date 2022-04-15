//
//  WeatherManager.swift
//  Clima
//
//  Created by Santiago Caraballo on 14/04/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d00c7c49c26e6b89eebf6391c6a1a55c&units=metric"
    
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
                    self.parseJSON(weatherData: safeData)
                }
            }
            // 4 Start the TASK
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        
    }
    
}
