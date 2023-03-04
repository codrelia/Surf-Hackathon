import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
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
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CharacteristicsTableViewCell.self)", for: indexPath) as? CharacteristicsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
}
