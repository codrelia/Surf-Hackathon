import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var model: Info?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    func setModel(_ model: Info) {
        self.model = model
    }
}

private extension DetailViewController {
    func configureTable() {
        tableView.register(UINib(nibName: "\(MainInfoTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(MainInfoTableViewCell.self)")
        tableView.register(UINib(nibName: "\(CharacteristicsTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(CharacteristicsTableViewCell.self)")
        
        tableView.dataSource = self
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MainInfoTableViewCell.self)", for: indexPath) as? MainInfoTableViewCell else {
                return UITableViewCell()
            }
            guard let model = model else {
                return cell
            }
            guard let url = URL(string: model.image) else {
                return cell
            }
            DispatchQueue.main.async {
                cell.lampImageView.loadImage(from: url)
            }
            cell.name = model.brand ?? ""
            cell.rating = model.rating ?? 0.0
            return cell
        } else {
            let arrayOfChar = ["Температура", "Яркость", "Потребление", "Мощность"]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CharacteristicsTableViewCell.self)", for: indexPath) as? CharacteristicsTableViewCell else {
                return UITableViewCell()
            }
            guard let model = model else {
                return cell
            }
            let index = indexPath.row
            if index == 1 {
                cell.characteristic = arrayOfChar[index - 1]
                cell.measurable = model.temp?.measured ?? ""
                cell.unmeasurable = model.temp?.declared ?? ""
            } else if index == 2 {
                cell.characteristic = arrayOfChar[index - 1]
                cell.measurable = model.brightness?.measured ?? ""
                cell.unmeasurable = model.brightness?.declared ?? ""
            } else if index == 3 {
                cell.characteristic = arrayOfChar[index - 1]
                cell.measurable = model.usage?.measured ?? ""
                cell.unmeasurable = model.usage?.declared ?? ""
            } else if index == 4 {
                cell.characteristic = arrayOfChar[index - 1]
                cell.measurable = model.power?.measured ?? ""
                cell.unmeasurable = model.power?.declared ?? ""
            }
            return cell
        }
    }
    
}
