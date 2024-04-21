//
//  ViewController.swift
//  WeatherForecastApp
//
//  Created by Faki Doosuur Doris on 25.02.2024.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    var weatherView: WeatherView?
    var apiHandler = Model?.self

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        //try to call the api into the views
        ApiHandler.shared.fetchingApiData { apiData in
            if let temperature = apiData?.temperature_2m {
               DispatchQueue.main.async { [weak self] in
                   self?.weatherView!.updateTemp(temperature)
               }
           }
        }
    }
    
    private func setUpView() {
        weatherView = WeatherView(frame: view.bounds)
        view = weatherView
        view.backgroundColor = .white
    }


}

