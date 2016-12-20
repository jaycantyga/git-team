//
//  TableViewCell.swift
//  GitTeam
//
//  Created by Benjamin Landau on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
