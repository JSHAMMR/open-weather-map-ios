//
//  WeatherViewModelTests.swift
//  OpenWeatherMapTests
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import XCTest

@testable import OpenWeatherMap

class WeatherViewModelDelegateMock: NSObject, WeatherViewModelDelegate {
    func didFetchWeather(success: Bool, weather: Weather) {
        self.weather = weather
    }
    
    
    
    public var weather:Weather!

}


class WeatherViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testFetchingWeatherFromNetworkLayer() {
          let json = [
                  "coord": [
                  "lon": -0.13,
                  "lat": 51.51
                  ],
                  "weather": [
                  [
                  "id": 300,
                  "main": "Drizzle",
                  "description": "light intensity drizzle",
                  "icon": "09d"
                  ]
                  ],
                  "base": "stations",
                  "main": [
                  "temp": 280.32,
                  "pressure": 1012,
                  "humidity": 81,
                  "temp_min": 279.15,
                  "temp_max": 281.15
                  ],
                  "visibility": 10000,
                  "wind": [
                  "speed": 4.1,
                  "deg": 80
                  ],
                  "clouds": [
                  "all": 90
                  ],
                  "dt": 1485789600,
                  "sys": [
                  "type": 1,
                  "id": 5091,
                  "message": 0.0103,
                  "country": "GB",
                  "sunrise": 1485762037,
                  "sunset": 1485794875
                  ],
                  "id": 2643743,
                  "name": "London",
                  "cod": 200
                    ] as [String : Any]
        
        do {
        
         let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        let weather : Weather = try! Weather(data: jsonData)
                    
         
         let networkLayer = NetworkLayerMock(mockedWeather: weather)
         let viewModel = WeatherViewModel(networkLayer: networkLayer)
         let weatherViewModelDelegateMock = WeatherViewModelDelegateMock()
         viewModel.delegate = weatherViewModelDelegateMock
            viewModel.fetchWeather(city: "London")
            

            XCTAssertEqual(weatherViewModelDelegateMock.weather.id , 2643743, "Failed to return the expected id of weather")
            XCTAssertEqual(weatherViewModelDelegateMock.weather.name,"London" , "Failed to return the expected name of weather")
            XCTAssertEqual(weatherViewModelDelegateMock.weather.cod,200 , "Failed to return the expected cod of weather")


        // we can test all model properties here and try to focus on depenableble values


        } catch let error {
            print(error)
        }
         
             

     }

}
