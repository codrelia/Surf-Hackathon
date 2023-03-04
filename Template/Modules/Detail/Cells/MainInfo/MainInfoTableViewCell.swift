import UIKit

class MainInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var lampImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var сharacteristicLabel: UILabel!
    @IBOutlet private weak var measuredLabel: UILabel!
    @IBOutlet private weak var unmeasuredLabel: UILabel!
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var rating: Double = 0.0 {
        didSet {
            ratingLabel.text = "\(rating)"
        }
    }
    
    var image: UIImage? {
        didSet {
            lampImageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell()
    }
}

private extension MainInfoTableViewCell {
    func configureCell() {
        lampImageView.contentMode = .scaleAspectFill
        lampImageView.layer.cornerRadius = 12.0
        
        measuredLabel.text = .localized(key: "DetailScreen.measurable")
        unmeasuredLabel.text = .localized(key: "DetailScreen.unmeasurable")
        сharacteristicLabel.text = .localized(key: "DetailScreen.characteristic")
    }
}
