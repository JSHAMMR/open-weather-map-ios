//
//  WeatherNetworkTest.swift
//  OpenWeatherMapTests
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import XCTest
@testable import OpenWeatherMap

class WeatherNetworkTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkTopStoriesIds() {
          let network = Network()
          let expectation = XCTestExpectation(description: "Get weather data")
        
        network.getWeather(city: "London") { (result) in
            XCTAssertNotNil(result,"Failed to download weather data")
            expectation.fulfill()

        }

          wait(for: [expectation], timeout: 10.0)
         
      }
  
}
