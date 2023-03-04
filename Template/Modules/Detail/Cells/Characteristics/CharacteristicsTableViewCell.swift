//
//  CharacteristicsTableViewCell.swift
//  Template
//
//  Created by Дарья Шевченко on 04/03/2023.
//

import UIKit

class CharacteristicsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var characteristicLabel: UILabel!
    @IBOutlet private weak var measurableLabel: UILabel!
    @IBOutlet private weak var unmeasurableLabel: UILabel!
    
    var characteristic = "" {
        didSet {
            characteristicLabel.text = characteristic
        }
    }
    
    var measurable = "" {
        didSet {
            measurableLabel.text = measurable
        }
    }
    
    var unmeasurable = "" {
        didSet {
            unmeasurableLabel.text = unmeasurable
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
