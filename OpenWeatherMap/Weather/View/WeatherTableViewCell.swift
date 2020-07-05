//
//  WeatherTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 05/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var mainLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var tempLbl: UILabel!
    @IBOutlet var pressureLbl: UILabel!
    @IBOutlet var humidityLbl: UILabel!

    var weather:Weather!{
        didSet {
            mainLbl.text = weather.weather?.first?.main ?? ""
            descriptionLbl.text = weather.weather?.first?.weatherDescription ?? ""
            
            tempLbl.text = "\(weather.main?.temp as! Double ?? 0.0)"
            pressureLbl.text =  "\(weather.main?.pressure as! Int ?? 0)"
            humidityLbl.text =  "\(weather.main?.humidity as! Int ?? 0)"

            
        }
    }
}
