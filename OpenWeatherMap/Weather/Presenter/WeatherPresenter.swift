//
//  WeatherPresenter.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

protocol WeatherPresenterDelegate : AnyObject { // to update proivers /uis
    func didFetchWeather(success:Bool)
}
extension WeatherPresenterDelegate {
    func didFetchWeather(success:Bool) {
    }
}


class WeatherPresenter: NSObject {
    weak var delegate: WeatherPresenterDelegate?
    private let weatherViewModel: WeatherViewModel!// getting view model
    
    fileprivate var weather: Weather!

    init(weatherViewModel:WeatherViewModel) { // init view mode
        self.weatherViewModel = weatherViewModel
        super.init()
        self.weatherViewModel.delegate = self
    }
    
    public func fetchWeather(city : String) { // asking view model to  fetch Weather
        self.weatherViewModel.fetchWeather(city: city)
    }
    
    public func getWeather() -> Weather { 
        return self.weather
    }
    
    
}
extension WeatherPresenter : WeatherViewModelDelegate {
    
    func didFetchWeather(success: Bool, weather: Weather) {
        self.weather = weather

        if let delegate = self.delegate {
            delegate.didFetchWeather(success: success)
        return
        }
    }
    
    
}
