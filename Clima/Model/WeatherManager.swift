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
        
    }
}
