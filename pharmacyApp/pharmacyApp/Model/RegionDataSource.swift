//
//  RegionDataSource.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 18.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import Foundation

protocol RegionDataSourceDelegate {
    func RegionListLoaded(regionList: [Region])
}

class RegionDataSource {
    var delegate : RegionDataSourceDelegate?
    let baseURL = "https://koc.api.staging.tarentum.io"
    
    func loadListOfRegions(cityId: Int){
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/city/\(cityId)/region"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){
                (data, response, error) in
                let decoder = JSONDecoder()
                let regionList = try! decoder.decode([Region].self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.RegionListLoaded(regionList: regionList)
                }
            }
            dataTask.resume()
        }
    }
}
