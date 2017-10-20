 //
//  TableViewCell.swift
//  APITest
//
//  Created by Ashish kumar patel on 08/10/17.
//  Copyright © 2017 Ashish kumar patel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet var latlong: UILabel!
    
    @IBOutlet var company: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
