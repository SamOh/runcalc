//
//  PacesTableViewCell.swift
//  RunCalc
//
//  Created by Samuel Oh on 1/9/16.
//  Copyright (c) 2016 Samuel Oh. All rights reserved.
//

import UIKit

class PacesTableViewCell: UITableViewCell {

    // create connections to labels in cell
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
