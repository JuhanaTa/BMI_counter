//
//  OnePersonTableViewCell.swift
//  BMI_calculator
//
//  Created by iosdev on 5.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

class OnePersonTableViewCell: UITableViewCell {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
