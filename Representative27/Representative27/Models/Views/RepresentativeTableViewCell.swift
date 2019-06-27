//
//  RepresentativeTableViewCell.swift
//  Representative27
//
//  Created by Leah Cluff on 6/27/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    
    var representative: Representative? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        phoneNumberLabel.text = representative?.phone
    }
}
