//
//  PharmacyDetailViewController.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 19.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit

extension PharmacyDetailViewController: PharmacyDetailDataSourceDelegate {
    func PharmacyDetailLoaded(pharmacyDetail: PharmacyDetail) {
        nameLabel.text = "\(pharmacyDetail.Name.uppercased())"
        addressLabel.text = "Address: \(pharmacyDetail.Address)"
        phoneLabel.text = "Phone: \(pharmacyDetail.Phone)"
    }
}

class PharmacyDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var selectedPharmacyId: String?
    let pharmacyDetailDataSource = PharmacyDetailDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pharmacy Details"
        pharmacyDetailDataSource.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let pharmacyId = selectedPharmacyId {
            pharmacyDetailDataSource.loadDetailOfPharmacy(pharmacyId: pharmacyId)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
