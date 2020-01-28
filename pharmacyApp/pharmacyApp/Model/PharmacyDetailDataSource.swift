//
//  PharmacyDetailDataSource.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 19.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import Foundation

protocol PharmacyDetailDataSourceDelegate {
    func PharmacyDetailLoaded(pharmacyDetail: PharmacyDetail)
}

class PharmacyDetailDataSource {
    var delegate : PharmacyDetailDataSourceDelegate?
    let baseURL = "https://koc.api.staging.tarentum.io"
    
    func loadDetailOfPharmacy(pharmacyId: String){
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/pharmacy/\(pharmacyId)"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){
                (data, response, error) in
                let decoder = JSONDecoder()
                let pharmacyDetail = try! decoder.decode(PharmacyDetail.self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.PharmacyDetailLoaded(pharmacyDetail: pharmacyDetail)
                }
            }
            dataTask.resume()
        }
    }
}
