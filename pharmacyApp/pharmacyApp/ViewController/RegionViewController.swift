//
//  RegionViewController.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 18.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit

extension RegionViewController: RegionDataSourceDelegate{
    func RegionListLoaded(regionList: [Region]) {
        self.regionArray = regionList
        self.regionTable.reloadData()
    }
}

extension RegionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell", for: indexPath) as! RegionTableViewCell
        let region = regionArray[indexPath.row]
        cell.regionLabel.text = region.Name.capitalized
        return cell
    }
}

class RegionViewController: UIViewController {
    let regionDataSource = RegionDataSource()
    var regionArray : [Region] = []
    var selectedCityId: Int?
    @IBOutlet weak var regionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose a Region"
        regionDataSource.delegate = self
        regionDataSource.loadListOfRegions(cityId: selectedCityId!)
    }
   
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
           let item = sender as! RegionTableViewCell
           let indexPath = regionTable.indexPath(for: item)

           if let indexPath = indexPath {
               let region = regionArray[indexPath.row]
               let destination = segue.destination as! PharmacyViewController
               destination.selectedRegionId = region.Id
           }
       }
    
}
