//
//  NetworkLayerMock.swift
//  OpenWeatherMapTests
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import XCTest
import OpenWeatherMap

class NetworkLayerMock: Network {

    
    private var mockedWeather: Weather!

    init(mockedWeather:Weather) {
          self.mockedWeather = mockedWeather
      }
    
    
    
    override func getWeather(city: String, completion: @escaping (Weather?) -> Void) {
        completion(self.mockedWeather)
    }
    
}
