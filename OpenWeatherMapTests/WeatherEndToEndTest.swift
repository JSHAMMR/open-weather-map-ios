//
//  WeatherEndToEndTest.swift
//  OpenWeatherMapTests
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import XCTest
@testable import OpenWeatherMap
class WeatherEndToEndTestDelegate: WeatherProviderProtocol {
    func didSelectCell(weather: Weather) {
        didSelectCell = true
        self.weather = weather
    }
    
    
    var didSelectCell: Bool = false
    var weather: Weather?
    
    
}

class WeatherEndToEndTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStoriesEndToEnd() {
        
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
                    let weatherPresenter = WeatherPresenter(weatherViewModel: viewModel)

                    weatherPresenter.fetchWeather(city: "London")

                    let weatherProvider = WeatherProvider()
                    weatherProvider.weatherPresenter = weatherPresenter

                    let tableView = UITableView()
                    let weatherEndToEndTestDelegate = WeatherEndToEndTestDelegate()

                    tableView.register(WeatherTableViewCell.self,
                    forCellReuseIdentifier: "WeatherTableViewCell")

                    tableView.dataSource = weatherProvider
                    tableView.delegate = weatherProvider



                    weatherProvider.weatherProviderProtocol = weatherEndToEndTestDelegate

                    XCTAssertEqual(weatherProvider.tableView(tableView, numberOfRowsInSection: 1), 1,"Number of weather rows not correct")
                    XCTAssertEqual(weatherProvider.numberOfSections(in: tableView), 1,"Number of weather sections not correct")


                    let indexPath = IndexPath(row: 0, section: 0)
                    //  XCTAssertFalse(weatherEndToEndTestDelegate.didSelectCell)

                    //  let indexPath2 = IndexPath(row: 1, section: 0)
                    weatherProvider.tableView(tableView, didSelectRowAt: indexPath)
                    XCTAssertTrue(weatherEndToEndTestDelegate.didSelectCell)

                    //
                    //
                    let weatherItem = weatherEndToEndTestDelegate.weather
                    //
                    XCTAssertEqual(weatherItem?.id , 2643743, "Failed to return the expected id of weather")
                    XCTAssertEqual(weatherItem?.name,"London" , "Failed to return the expected name of weather")
                    XCTAssertEqual(weatherItem?.cod,200 , "Failed to return the expected cod of weather")


                    // we can test all model properties here and try to focus on depenableble values


                           
                
               } catch let error {
                print(error)
                
               }
                
    
       }

}
