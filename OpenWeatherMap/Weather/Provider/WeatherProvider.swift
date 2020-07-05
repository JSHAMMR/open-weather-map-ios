//
//  WeatherProvider.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import Foundation
import UIKit
protocol WeatherProviderProtocol {
    func didSelectCell(weather: Weather)
}
class WeatherProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    var weatherProviderProtocol: WeatherProviderProtocol?// for cell testing
    var weatherPresenter:WeatherPresenter! //to feed presenter
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        
        cell.weather = weatherPresenter.getWeather()
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let weather = weatherPresenter.getWeather()

        weatherProviderProtocol?.didSelectCell(weather: weather) // for testing
        
    }
    
    

}
