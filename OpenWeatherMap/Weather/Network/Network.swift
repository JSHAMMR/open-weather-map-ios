//
//  Network.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import Foundation
open class Network: NSObject {
    func getWeather(city:String, completion:@escaping (Data?) -> Void)  {
        let parameters  = "?q=\(city)&appid=\(API_Key)"

        guard let getUrl = URL(string: openWeatherMapLink + parameters) else { return }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: getUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let returnData = String(data: data, encoding: .utf8) {
                    print(returnData)
                } else {
                    print("empty")
                }
            }
            
            if let err = error {
                print("Err", err)
            }
            
            completion(data)
        }
        dataTask.resume()
    }
    
}
