//
//  OpenPositionsTableViewCell.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import UIKit

class OpenPositionsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var positionNameLbl: UILabel!
    
    
    
    @IBOutlet weak var positionImage: UIImageView!
    
    
    @IBOutlet weak var salaryLbl: UILabel!
    
}
