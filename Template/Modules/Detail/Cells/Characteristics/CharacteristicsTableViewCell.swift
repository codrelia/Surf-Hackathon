//
//  CharacteristicsTableViewCell.swift
//  Template
//
//  Created by Дарья Шевченко on 04/03/2023.
//

import UIKit

class CharacteristicsTableViewCell: UITableViewCell {

    @IBOutlet weak var characteristicLabel: UILabel!
    @IBOutlet weak var measurableLabel: UILabel!
    
    @IBOutlet weak var unmeasurableLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
