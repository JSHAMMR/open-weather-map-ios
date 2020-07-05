//
//  Network.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import Foundation
open class Network: NSObject {
    open func getWeather(city:String, completion:@escaping (Weather?) -> Void)  {
        let parameters  = "?q=\(city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)&appid=\(API_Key)"

        guard let getUrl = URL(string: openWeatherMapLink + parameters) else { return }
        
        
        print(getUrl)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: getUrl) { (data, response, error) in
            var weather:Weather!
            guard let data = data else { return }
            do {
                    
                weather = try Weather(data: data)
                    
                
            } catch let error {
                print(error)
            }
            
            if let err = error {
                print("Err", err)
            }
            
            completion(weather)
        }
        dataTask.resume()
    }
    
}
