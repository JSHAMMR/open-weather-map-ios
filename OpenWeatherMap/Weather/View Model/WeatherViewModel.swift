//
//  WeatherViewModel.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit
protocol WeatherViewModelDelegate : AnyObject {
    func didFetchWeather(success:Bool, weather:Weather)
}

open class WeatherViewModel: NSObject {
       weak var delegate: WeatherViewModelDelegate? // tp update presneter
    
    
       private let networkLayer: Network // network layer
       init(networkLayer:Network) {
           self.networkLayer = networkLayer
       }
    
    
    open func fetchWeather (city: String){
        self.networkLayer.getWeather(city: city) { (result) in
            if let delegate = self.delegate {
                 delegate.didFetchWeather(success: true, weather: result!)
                 return
             }
        }
        
       
    }

}
