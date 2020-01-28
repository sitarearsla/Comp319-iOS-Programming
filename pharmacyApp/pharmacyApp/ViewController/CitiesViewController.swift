//
//  CitiesViewController.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 17.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit
 
extension CitiesViewController: CityDataSourceDelegate{
    func CityListLoaded(cityList: [City]) {
        self.cityArray = cityList
        self.cityTable.reloadData()
    }
}

extension CitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        let city = cityArray[indexPath.row]
        cell.nameLabel.text = city.Name
        return cell
    }
}

class CitiesViewController: UIViewController {
    let cityDataSource = CityDataSource()
    var cityArray : [City] = []

    @IBOutlet weak var cityTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose a City"
        cityDataSource.delegate = self
        cityDataSource.loadListOfCities()
        // Do any additional setup after loading the view.
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
         let item = sender as! CityTableViewCell
         let indexPath = cityTable.indexPath(for: item)

         if let indexPath = indexPath {
             let city = cityArray[indexPath.row]
             let destination = segue.destination as! RegionViewController
             destination.selectedCityId = city.Id
         }
     }

}
