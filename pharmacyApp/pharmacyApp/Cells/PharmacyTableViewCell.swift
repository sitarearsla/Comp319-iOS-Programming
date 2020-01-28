//
//  PharmacyTableViewCell.swift
//  pharmacyApp
//
//  Created by Sitare Arslantürk on 19.11.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {
    @IBOutlet weak var pharmacyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
