//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit
import MapKit
class WeatherViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet var weatherProvider: WeatherProvider!
    var weatherPresenter:WeatherPresenter!
    fileprivate var selections = ["Kuala Lumpur","George Town","Johor Bahru"]
    fileprivate var selectionsPickerView = UIPickerView()
    fileprivate var selectedValue = String()
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.weatherPresenter = self.weatherListPresenter() // instance
        self.weatherPresenter?.fetchWeather(city: selections.first!) // asking presenter to get the data
        self.weatherPresenter?.delegate = self
        
        self.weatherProvider.weatherPresenter = self.weatherPresenter // to update  list
        
    }
    
    //mapping presnter->viewmodel->network
    func weatherListPresenter() -> WeatherPresenter {
           let networkLayer = Network()
           let weatherViewModel = WeatherViewModel(networkLayer: networkLayer)
           let weatherPresenter = WeatherPresenter(weatherViewModel: weatherViewModel)
           return weatherPresenter
    }

    @IBAction func changeCity(_ sender: Any) {
        let alert = UIAlertController(title: "Change City", message: " Data will filter based on this \n\n\n\n\n\n", preferredStyle: .actionSheet)
              
               let pickerFrame = UIPickerView(frame: CGRect(x: 0, y: 0, width: alert.view.frame.width, height: 200 ))
              
              alert.view.addSubview(pickerFrame)
              pickerFrame.dataSource = self
              pickerFrame.delegate = self
              
              alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
              alert.addAction(UIAlertAction(title: "Apply", style: .default, handler: { (UIAlertAction) in
                  
                
                self.weatherPresenter.fetchWeather(city: self.selectedValue)
                             
              }))
              self.present(alert,animated: true, completion: nil )
        
    }
}

extension WeatherViewController:WeatherPresenterDelegate {
    func didFetchWeather(success: Bool) {
        DispatchQueue.main.async {
                   self.tableview.reloadData()
        }
    }
    
}

extension WeatherViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selections.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selections[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       selectedValue = selections[row]
    }
}
