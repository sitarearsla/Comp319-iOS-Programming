//
//  PharmacyDataSource.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 19.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import Foundation

protocol PharmacyDataSourceDelegate {
    func PharmacyListLoaded(pharmacyList: [Pharmacy])
}

class PharmacyDataSource {
    var delegate : PharmacyDataSourceDelegate?
    let baseURL = "https://koc.api.staging.tarentum.io"
    
    func loadListOfPharmacies(regionId: String){
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/region/\(regionId)/pharmacy"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){
                (data, response, error) in
                let decoder = JSONDecoder()
                let pharmacyList = try! decoder.decode([Pharmacy].self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.PharmacyListLoaded(pharmacyList: pharmacyList)
                }
            }
            dataTask.resume()
        }
    }
}
