//
//  ApiHandler.swift
//  WeatherForecastApp
//
//  Created by Faki Doosuur Doris on 27.02.2024.
//

import Foundation
import Alamofire

class ApiHandler {
    static let shared = ApiHandler()

    func fetchingApiData( handler: @escaping(_ apiData:Model?) -> Void) {
        let url = "https://api.open-meteo.com/v1/forecast?latitude=55.830433&longitude=49.066082&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"

        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            response in
            switch response.result {
            case.success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Model.self, from: data!)
                   // print(jsonData)
                    //we decided to call the closure instead
                    handler(jsonData)
                } catch {
                    print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
                handler(nil)
            }
        }

    }

}


struct Model:Codable {
    let temperature_2m: String
    let time: String
    let wind_speed_10m: String

}
