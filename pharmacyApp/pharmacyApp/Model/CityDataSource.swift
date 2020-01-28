//
//  CityDataSource.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 17.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import Foundation

protocol CityDataSourceDelegate {
    func CityListLoaded(cityList: [City])
}

class CityDataSource {
    var delegate : CityDataSourceDelegate?
    let baseURL = "https://koc.api.staging.tarentum.io"
    
    func loadListOfCities(){
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/city"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){
                (data, response, error) in
                let decoder = JSONDecoder()
                let cityList = try! decoder.decode([City].self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.CityListLoaded(cityList: cityList)
                }
            }
            dataTask.resume()
        }
    }
}
