//
//  PharmacyViewController.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 19.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit

extension PharmacyViewController: PharmacyDataSourceDelegate{
    func PharmacyListLoaded(pharmacyList: [Pharmacy]) {
        self.pharmacyArray = pharmacyList
        self.pharmacyTable.reloadData()
    }
}

extension PharmacyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell", for: indexPath) as! PharmacyTableViewCell
        let pharmacy = pharmacyArray[indexPath.row]
        cell.pharmacyLabel.text = pharmacy.Name.capitalized
        return cell
    }
}

class PharmacyViewController: UIViewController {
    let pharmacyDataSource = PharmacyDataSource()
    var pharmacyArray : [Pharmacy] = []
    var selectedRegionId: String?
    @IBOutlet weak var pharmacyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose a Pharmacy"
        pharmacyDataSource.delegate = self
        pharmacyDataSource.loadListOfPharmacies(regionId: selectedRegionId!)
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
           let item = sender as! PharmacyTableViewCell
           let indexPath = pharmacyTable.indexPath(for: item)

           if let indexPath = indexPath {
               let pharmacy = pharmacyArray[indexPath.row]
               let destination = segue.destination as! PharmacyDetailViewController
               destination.selectedPharmacyId = pharmacy.Id
           }
       }

}
